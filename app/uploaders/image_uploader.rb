# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
    storage :fog

    def store_dir
      'reservester-for-startup/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}'
    end
    
    version :masthead do
       process :resize_to_fit => [600, 500]
    end
    version :thumbnail do
       process :resize_to_fill => [300, 250]
    end
end
