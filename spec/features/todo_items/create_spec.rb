# Tutorial section #09-2

require 'spec_helper'

describe "Adding todo items" do
    let!(:todo_list) {TodoList.create(title: "Weekend Plans", description:"Get housework done") }
    
    # Code moved to spec/support todo_list_helpers.rb during step 13-2
    
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
    
    # Added by step 10-1
    it "displays an error with no content" do
        visit_todo_list(todo_list)
        click_link "New Todo Item"
        
        fill_in "Content", with: ""
        click_button "Save"
        
        within("div.flash") do 
            expect(page).to have_content("There was a problem adding that todo list item.")
        end
        
        expect(page).to have_content("Content can't be blank")
    end
    
    it "displays an error with content less than 2 characters long" do
        visit_todo_list(todo_list)
        click_link "New Todo Item"
        
        fill_in "Content", with: "1"
        click_button "Save"
        
        within("div.flash") do 
            expect(page).to have_content("There was a problem adding that todo list item.")
        end
        
        expect(page).to have_content("Content is too short")
    end
end







