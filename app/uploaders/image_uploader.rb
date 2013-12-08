# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
    storage :fog
    
    version :masthead do
       process :resize_to_fill => [800, 450]
    end
    version :thumbnail do
       process :resize_to_fill => [150, 150] 
    end

end
