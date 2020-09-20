class ChangeIdToBeBigintInStats < ActiveRecord::Migration[5.2]
  def change
  	change_column :stats, :id, :integer, limit: 8
  end
end
