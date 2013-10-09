# encoding: utf-8
require 'securerandom'

class PostImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def filename
    @filename ||= "#{SecureRandom.uuid}.#{file.extension}" if original_filename
  end

  version :thumb do
    process resize_to_fill: [200, 200]
  end
end
