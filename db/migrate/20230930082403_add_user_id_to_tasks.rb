class AddUserIdToTasks < ActiveRecord::Migration[7.0]
  def up
    execute 'DELETE FROM tasks;'
    add_reference :tasks, :user, null: false, index: true, foreign_key: true
  end

  def down
    remove_reference :tasks, :user,  index: true, foreign_key: true
  end
end
