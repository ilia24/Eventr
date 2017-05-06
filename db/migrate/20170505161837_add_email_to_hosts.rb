class AddEmailToHosts < ActiveRecord::Migration[5.0]
  def change
    add_column :hosts, :email, :string
  end
end
