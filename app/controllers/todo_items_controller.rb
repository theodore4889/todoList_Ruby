class TodoItemsController < ApplicationController
  def index
    @todo_list = TodoList.find(params[:todo_list_id]) #08-14 (id comes from routes that requires us to send it in)
  end
end
