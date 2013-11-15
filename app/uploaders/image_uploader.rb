# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
    storage :fog
    
    version :masthead do
       process :resize_to_fit => [600, 500]
    end
    version :thumbnail do
       process :resize_to_fill => [300, 250]
    end
end
