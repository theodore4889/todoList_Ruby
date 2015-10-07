class TodoItem < ActiveRecord::Base
  belongs_to :todo_list
  
  validates :content, presence: true,        #Added from 10-2
                      length: { minimum: 2}
end
