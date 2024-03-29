class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string  :title
      t.boolean :done

      t.belongs_to :todolist, index: true

      t.timestamps
    end

  end
end

