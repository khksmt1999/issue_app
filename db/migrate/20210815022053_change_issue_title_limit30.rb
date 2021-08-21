class ChangeIssueTitleLimit30 < ActiveRecord::Migration[6.1]
  def up
    change_column :issues, :title, :string, limit: 30
  end

  def down
    chenge_column :issues, :title, :string
  end
end
