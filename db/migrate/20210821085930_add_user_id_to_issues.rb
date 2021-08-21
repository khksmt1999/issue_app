class AddUserIdToIssues < ActiveRecord::Migration[6.1]
  def up
    execute 'DELETE FROM issues;'
    add_reference :issues, :user, null: false, index: true
  end

  def down
    remove_reference :issues, :user, index: true
  end
end
