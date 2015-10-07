# Tutorial section #10-7

require 'spec_helper'

describe "Editing todo items" do
    let!(:todo_list) {TodoList.create(title: "Weekend Plans", description:"Get housework done") }
    let!(:todo_item) {todo_list.todo_items.create(content: "Clean Gutters") }
    
    def visit_todo_list(list)
        visit "/todo_lists"
        within "#todo_list_#{list.id}" do 
            click_link "List Items"
        end
    end
    
    def edit_todo_list(options={})
        visit_todo_list(todo_list)
        options[:content] ||= "Powerwash Gutters"
        options[:msg] ||= "Saved todo list item."
        options[:expected] ||= "Clean Gutters"
        
        visit_todo_list(todo_list)
        within("#todo_item_#{todo_item.id}") do
            click_link "Edit"
        end
        
        fill_in "Content", with: options[:content]
        click_button "Save"
        
        expect(page).to have_content(options[:msg])
        
        todo_item.reload
        expect(todo_item.content).to eq(options[:expected])
    end
    
    it 'is successful with valid content' do
        edit_todo_list expected: "Powerwash Gutters"
    end
    
    it 'is unsuccessful with no content' do
        edit_todo_list content: "", msg: "Content can't be blank"
    end
    
    it 'is unsuccessful with not enough content' do
        edit_todo_list content: "1", msg: "Content is too short"
    end
    
end