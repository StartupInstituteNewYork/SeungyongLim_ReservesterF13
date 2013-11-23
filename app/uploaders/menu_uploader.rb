#encoding: utf-8

class MenuUploader < CarrierWave::Uploader::Base
  storage :file

  version :small do
	process resize_to_fill: [32, 32]
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  def extension_white_list
    %w(pdf)
  end

end
