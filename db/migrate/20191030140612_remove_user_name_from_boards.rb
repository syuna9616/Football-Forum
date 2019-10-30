class RemoveUserNameFromBoards < ActiveRecord::Migration[5.2]
  def change
    remove_column :boards, :name, :string
  end
end
