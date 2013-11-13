class RemovePhoneNumberToRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :phone_number, :integer
  end
end
