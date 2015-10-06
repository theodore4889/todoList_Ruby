# Tutorial section #09-2

require 'spec_helper'

describe "Adding todo items" do
    let!(:todo_list) {TodoList.create(title: "Weekend Plans", description:"Get housework done") }
    
    # Added on step #08-15
    def visit_todo_list(list)
        visit "/todo_lists"
        within "#todo_list_#{list.id}" do 
            click_link "List Items"
        end
    end
    
    it "is successful with valid content" do
        visit_todo_list(todo_list)
        click_link "New Todo Item"
        
        fill_in "Content", with: "Clean Gutters"
        click_button "Save"
        
        expect(page).to have_content("Added todo list item.")
        
        within("ul.todo_items") do 
            expect(page). to have_content("Clean Gutters")
        end
    end
    
end