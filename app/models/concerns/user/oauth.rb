# encoding: utf-8

module Concerns::User::Oauth
  extend ActiveSupport::Concern

  module ClassMethods
    def from_oauth(auth)
      where(provider: auth[:provider], uid: auth[:uid].to_s).first_or_create do |user|
        user.provider = auth.provider
        user.uid      = auth.uid
      end
    end
  end

  def password_required?
    super && provider.blank?
  end

  protected :password_required?
end
