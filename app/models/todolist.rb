class Todolist < ActiveRecord::Base
  validates :title, presence: true
  has_many :tasks
end
