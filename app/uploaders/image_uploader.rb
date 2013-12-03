# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
    storage :fog
    
    version :masthead do
       process :resize_to_fill => [800, 450]
    end
    version :thumbnail do
       process :resize_to_fill => [300, 250]
    end
   	def default_url
    	ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
 	end

end
