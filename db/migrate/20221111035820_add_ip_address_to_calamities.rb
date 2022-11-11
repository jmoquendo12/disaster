class AddIpAddressToCalamities < ActiveRecord::Migration[7.0]
  def change
    add_column :calamities, :ip_address ,:string
  end
end
