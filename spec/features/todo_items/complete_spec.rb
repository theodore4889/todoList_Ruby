# Tutorial section #13-4

require 'spec_helper'

describe "Completing todo items" do
    let!(:todo_list) {TodoList.create(title: "Weekend Plans", description:"Get housework done") }
    let!(:todo_item) {todo_list.todo_items.create(content: "Clean Gutters") }
    
    it "is successful when marking a single item complete" do
        expect(todo_item.completed_at).to be_nil
        visit_todo_list todo_list
        
        within dom_id_for(todo_item) do
            click_link "Mark Complete"
        end
        
        todo_item.reload
        expect(todo_item.completed_at).to_not be_nil
    end
end
