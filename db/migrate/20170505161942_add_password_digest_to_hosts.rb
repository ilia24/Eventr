class AddPasswordDigestToHosts < ActiveRecord::Migration[5.0]
  def change
    add_column :hosts, :password_digest, :string
  end
end
