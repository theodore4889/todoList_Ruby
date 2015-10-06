# Tutorial section #08-4

require 'spec_helper'

describe "Viewing todo items" do
    let!(:todo_list) {TodoList.create(title: "Weekend Plans", description:"Get housework done") }
    
    # Added on step #08-15
    def visit_todo_list(list)
                visit "/todo_lists"
        within "#todo_list_#{list.id}" do 
            click_link "List Items"
        end
    end
    
    # Commented out on step #08-15
    # before do                                               #08-4
    #     visit "/todo_lists"
    #     within "#todo_list_#{todo_list.id}" do 
    #         click_link "List Items"
    #     end
    # end
    
    it "displays the title of the todo list" do             #08-12
        visit_todo_list(todo_list)  # Added 08-15
        within("h1") do
            expect(page).to have_content(todo_list.title)
        end
    end
        
    it "displays no items when a todo list is empty" do     #08-15
        visit_todo_list(todo_list)  # Added 08-15
        expect(page.all("ul.todo_items li").size).to eq(0)
    end
    
    # Added on step #08-15
    it "displays item content when a todo list has items" do
        todo_list.todo_items.create(content: "Clean Gutters")
        todo_list.todo_items.create(content: "Wash Car")
       
        visit_todo_list(todo_list)
        expect(page.all("ul.todo_items li").size).to eq(2)
        
        within "ul.todo_items" do
            expect(page).to have_content("Clean Gutters")
            expect(page).to have_content("Wash Car")
        end
    end
end