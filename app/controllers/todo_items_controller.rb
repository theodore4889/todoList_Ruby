class TodoItemsController < ApplicationController
  before_action :find_todo_list # Added 11-1
  
  def index
    @todo_list = TodoList.find(params[:todo_list_id]) #08-14 (id comes from routes that requires us to send it in)
  end
  
  # Added from 09-4
  def new
    @todo_item = @todo_list.todo_items.new
  end
  
  # Added from 09-6
  def create
    @todo_item = @todo_list.todo_items.new(todo_item_params)
    if @todo_item.save
      flash[:success] = "Added todo list item."
      redirect_to todo_list_todo_items_path
    else
      flash[:error] = "There was a problem adding that todo list item."
      render action: :new
    end
  end
  
  # Added from 10-9
  def edit
    @todo_item = @todo_list.todo_items.find(params[:id])
  end
  
  # Added from 10-9
  def update
    @todo_item = @todo_list.todo_items.find(params[:id])
    if @todo_item.update_attributes(todo_item_params)
      flash[:success] = "Saved todo list item."
      redirect_to todo_list_todo_items_path
    else
      flash[:error] = "That todo item could not be saved."
      render action: :edit
    end
  end
  
  # Added from 10-11
  def url_options
      { todo_list_id: params[:todo_list_id] }.merge(super)
  end
    
  private
  
  # Added 11-1
  def find_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end
  
  def todo_item_params
    params[:todo_item].permit(:content)
  end
  
end
