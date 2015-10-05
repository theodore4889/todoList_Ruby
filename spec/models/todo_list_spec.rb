require 'spec_helper'

describe TodoList do
  it { should have_many(:todo_items) } # 07-8
end
