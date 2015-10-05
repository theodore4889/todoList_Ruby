# Tutorial section #07-5

require 'spec_helper'

describe TodoItem do
    it { should belong_to(:todo_list) }
end
