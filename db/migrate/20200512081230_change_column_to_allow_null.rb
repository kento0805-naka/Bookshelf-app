class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def up
    change_column :books, :title,:string, null: true # null: trueを明示する必要がある
  end

  def down
    change_column :books, :title,:string, null: false
  end
end
