class PostImageWorker
  include Sidekiq::Worker

  def perform(image_to_download, post_id)
    post = Post.find(post_id)
    post.remote_image_url = image_to_download
    post.save!
  end
end
