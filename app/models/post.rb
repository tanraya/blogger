class Post < ActiveRecord::Base
  belongs_to :author, class_name: 'User'

  validates :author, :title, :article, :image_to_download, presence: true
  validates :image_to_download, url: true

  before_save  :nullify_image_if_changed
  after_commit :process_remote_image

  # Note: it should comes after callbacks
  mount_uploader :image, PostImageUploader

  scope :descending, ->{ order(:created_at => :desc) }

  def to_s
    title
  end

protected

  def image_to_download_previously_changed?
    changes = previous_changes['image_to_download']
    changes.try(:first) != changes.try(:last)
  end

  def nullify_image_if_changed
    write_attribute(:image, nil) if image_to_download_changed? && persisted?
  end

  def process_remote_image
    if image_to_download_previously_changed?
      PostImageWorker.perform_async(image_to_download, id)
    end
  end

end
