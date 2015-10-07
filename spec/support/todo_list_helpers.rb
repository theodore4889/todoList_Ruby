module TodoListHelpers
    # Code cut and pasted during step 13-2
    # Added on step 08-15
    def visit_todo_list(list)
        visit "/todo_lists"
        within dom_id_for(list) do      # 13-7 edit
            click_link "List Items"
        end
    end
end