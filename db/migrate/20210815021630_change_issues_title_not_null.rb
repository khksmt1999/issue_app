class ChangeIssuesTitleNotNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :issues, :title, false
  end
end
