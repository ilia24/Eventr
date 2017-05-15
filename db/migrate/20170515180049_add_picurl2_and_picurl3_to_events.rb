class AddPicurl2AndPicurl3ToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :picurl2, :string
    add_column :events, :picurl3, :string
  end
end
