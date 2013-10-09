# TODO: Add confirmable module here
class User < ActiveRecord::Base
  has_many :posts, foreign_key: :author_id, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  def name
    read_attribute(:name) || email.split('@').first
  end

  alias :to_s :name
end
