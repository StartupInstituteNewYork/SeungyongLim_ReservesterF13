class Restaurant < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	belongs_to :owner
	mount_uploader :menu, MenuUploader
	
end
