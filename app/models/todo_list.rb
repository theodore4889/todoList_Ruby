class TodoList < ActiveRecord::Base
    has_many :todo_items   #07-10
    
    validates :title, presence: true                #04-6
    validates :title, length: { minimum: 3 }
    validates :description, presence: true
    validates :description, length: { minimum: 5}
end
