module TodoListHelpers
    # Code cut and pasted during step 13-2
    # Added on step 08-15
    def visit_todo_list(list)
        visit "/todo_lists"
        within "#todo_list_#{list.id}" do 
            click_link "List Items"
        end
    end
end