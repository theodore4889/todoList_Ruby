01 - Generate a Rails Application

	1. Navigate to projects directory
	cd projects/

	2. Generate new rails app (named odot)
	rails new odot

	3. Navigate to new odot directory
	cd odot

	4. Start rails server
	bin/rails server (normal)
	rails s -b $IP -p $PORT (c9.io)

	5. Navidate to browser to see Rails welcome screen


02 - Setup Git and add Gems

	1. Configure git
	git config --global user.email "youremail@domain.com"
	git config --global user.name "Theodore Lano"

	2. Initialize repository, track files, commit
	git init
	git status
	git add .
	git commit -m "Initial Commit"

	3. Open up Gemfile, cleanup comment lines

	4. Add 'rspec-rails' and 'capybara' gems

	5. Install new gems
	bundle

	6. Generate rspec
	bin/raile generate rspec:install

	7. Open up spec/spec_helper.rb, add "require 'capybara/rspec'"

	8. Generate more rspec stuff
	bundle binstubs rspec-core

	9. Track and commit
	git status
	git add .
	git commit -m "Add rspec and capybara"

	10. Remove test directory since spec will be used for testing
	rm -rf test/
	git rm -rf test

	11. Commit
	git commit -m "Removed test directory"


03 - Generate a Scaffold

	1. Generate scaffold for todo lists
	bin/rails generate scaffold todo_list title:string description:text

	2. Migrate database and test database
	bin/rake db:migrate
	bin/rake db:migrate RAILS_ENV=test

	3. Start rails server

	4. Navigate browser to /todo_lists

	5. Open up config/routes.rb file

	6. Notice resources line added, add your own root line

	7. Navigate to main url on browser, notice your todo_lists page loads

	8. Track and commit
	git status
	git add .
	git commit -m "Generate todo list scaffold" 


04 - Write Our Create Tests

	1. Test to make sure default specs work
	bin/rake spec

	2. Make directory to hold specs (-p creates subdirectories)
	mkdir -p spec/features/todo_lists

	3. Create a file for testing todo list creation
	touch spec/features/todo_lists/create_spec.rb

	4. Modify spec/features.todo_lists/create_spec.rb, add test code

	5. Add validation to todo list, open app/models/todo_list.rb

	6. Run create test code
	bin/rspec spec/feaures/todo_list/create_spec.rb

	7. Track and commit
	git status
	git add .
	git commit -m "Add spec and validations for create"


05 - Write Our Edit Tests

	1. Create a file for todo list edits
	touch spec/features/todo_lists/edit_spec.rb

	2. Open file, add code, save

	3. Run edit test code
	in/rspec spec/feaures/todo_list/edit_spec.rb

	4. Track and commit
	git status
	git add .
	git commit -m "Add spec and validations for edit"


 06 - Write our Delete Tests

	1. Create file
	touch spec/features/todo_lists/destroy_spec.rb

	2. Open file, make edits

	3. Run delete test code
	bin/rspec spec/features/todo_lists/destroy_spec.rb

	4. Run all spec code
	bin/rake spec

	5. Controller spec might throw a lot of errors, open up spec/controllers/todo_lists_controller_spec.rb

	6. Add additional valid attributes

	7. Run all spec code
	bin/rake spec

	8. Track and commit
	git status
	git add .
	git commit -am "Add specs for deleting to-dos"


07 - Relationships

	1. Add Gem "shoulda-matchers" to Gemfile

	2. Install new gems, specify bundle in Gemfile if not specified
	bundle

	3. Generate Todo Item model, use -p prefix on command to see what will be generated but not actually perform commnd
	bin/rails generate model todo_item todo_list:references content:string

	4. Check out the new migration file in db/migrate, perform migration
	bin/rake db:migrate
	bin.rake db:migrate RAILS_ENV=test

	5. Write test in spec/models/todo_item_spec.rb

	6. Run test
	bin/rspec spec/models/todo_item_spec.rb

	7. Check out app/models/todo_item.rb and see that todo_item was automatically setup to reference todo_list

	8. Open spec/models/todo_list_spec.rb and update

	9. Run test on todo_list_spec.rb, should fail because we added todo_items relation
	bin/rspec spec/models/todo_list_spec.rb

	10. Modify  app/models/todo_list.rb 

	11. Run test again 
	bin/rspec spec/models/todo_list_spec.rb

	12. Add and commit
	git status
	git add .
	git commit -am "Add todo item model and associated specs"


08 - Viewing Todo Items

	1. Generate Todo Items controller
	bin/rails generate controller todo_items index

	2. Create a directory to house todo items features
	mkdir -p spec/features/todo_items

	3. Create todo items index spec file
	touch spec/features/todo_items/index_spec.rb

	4. Think a bit.  We hav a todo list index page, and on that page we want to be able to link to the todo items index page located in app/views/todo_items/index.html.erb.  So, write test that checks if we can navigate to todo items pages when clicked from todo List 
	spec/features/todo_items/index_spec.rb

	5. Run test, it will fail because there isn't yet a "List Items" Link
	bin/rspec spec/features/todo_items/index_spec.rb

	6. Open up routes file.  We want to make sure there is a route to our list items, so we add in that specification. 
	
	7. List routes in application.  Notice that there is a "todo_list_todo_items" prefix that is intended to get todo list items.
	bin/rake routes

	8. Create a "List Items" link in todo-lists/index.html.erb, add routes prefix and append "_path"
	
	9. Run test again, it will fail because we're missing the required keys for the todo list id.  Take a look at the URI Pattern for the route and notice the id requirement.
	bin/rspec spec/features/todo_items/index_spec.rb

	10. Go back to todo_lists/index.html.erb and add in the proper code.

	11. Track and commit
	
	12. Add todo list title check in spec/features/todo_items/index_spec.rb
	
	13. Run test, it will fail because views/todo_items/index.html.erb does not have code to display the todo list title
	bin/rspec --format=documentation spec/features/todo_items/index_spec.rb

	14. Open up app/controllers/todo_items_controller.rb; find todo list
	
	15. Modify tests in app/views/todo_items/index.html.erb
	
	16. Modify spec/features/todo_items/index_spec.rb, to include todo items
	
	17. Track and commit
	git status
	git commit -am "Write tests for todo items"

09 - Adding To Do Items

	1. Create test file for creating todo items
	touch spec/features/todo_items/create_spec.rb

	2. Modify test file, run to see errors
	bin/rspec --format=documentation spec/features/todo_items/create_spec.rb

	3. add "New Todo Item" link to app/views/todo_items/index.html.erb.  Check routes to figure out new todo item link URI Pattern.
	bin/rake routes

	4. Modify todo_items_controler.rb to include "new" action
	
	5. Create new layout for new todo list items, edit
	touch app/views/todo_items/new.html.erb

	6. Create new "create" action for the TodoItemsController
	
	7. Modify app/views/layouts/application.html.erb to display flash messages
	
	8. Run test again
	bin/rspec --format=documentation spec/features/todo_items/create_spec.rb

	9. Track and commit
	git status
	git add .
	git commit -am "Added test for creating todo items and associated code"
	
10 - Adding Validations to Todo Items

	1. Add cases to spec/features/todo_items/create_spec.rb

	2. Add validations to model by updating todo_item.rb model
	
	3. Run test
	bin/rspec --format=documentation spec/features/todo_items/create_spec.rb

	4. Run all tests to see if everything is still valid
	bin/rspec --format=documentation
	
	5. Start server and take a look at app

	6. Update app/assets/stylesheets/application.css
	
	7. Create new file for testing editing todo items
	touch spec/features/todo_items/edit_spec.rb
	
	8. Modify app/views/todo_items/index.html.erb

	9. Modify app/controllers/todo_items/todo_items_controller.rb
	
	10. Create todo item edit view
	touch app/views/todo_items/edit.html.erb
	
	11. In order to not have to type the todo_list everytime we're in a controller or a view, we can give the todo_list id this way

	12. Run test
	bin/rspec --format=documentation spec/features/todo_items/edit_spec.rb
	
	13. Track and commit
	git status
	git add .
	git commit -m "Add specs and code for editing todo items"
	

11 - Cleanup our code

	1. Cleanup todo_items_controller.rb
 
	2. app/views/todo_items edit.html.erb and new.html.erb are the exact same.  We create a "partial" to handle this.
	touch app/views/todo_items/_form.html.erb

	3. Track and Commit
	git status
	git add .
	git commit -m "Add specs and code for editing todo items"


12 - Deleting Todo Items

	1. Create new file for delete tests
	touch spec/features/todo_items/delete_spec.rb
	
	2. Edit app/views/todo_items/index.html.erb to include delete link
	
	3. Edit app/controllers/todo_items_controller.rb to include destroy action

	4. Run Test
	bin/rspec --format=documentation spec/features/todo_items/delete_spec.rb
	
	5. Also test out in the browser
	
	6. Track and commit
	
13 - Cleanup test code

	1. View spec/spec_helper.rb and notice that anything included in the spec/support folder gets included. So, lets create that directory
	mkdir spec/support

	2. Create todo_list_helpers.rb in the support folder, add code and delete code from other spec/feature files
	touch spec/support/todo_list_helpers.rb

	3. Include TodoListHelpers in spec_helper.rb file
	
	4. Track and Commit











