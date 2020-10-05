class AddAvatarToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :avatar, :string
  end
end
