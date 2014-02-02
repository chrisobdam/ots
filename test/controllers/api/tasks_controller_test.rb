require 'test_helper'

class Api::TasksControllerTest < ActionController::TestCase
  test "assign task" do
    post :assign, {task: {title: "Task title", owner: "john@doe.com", identifier: "henk"}, user: "henk", as: "assignee"}
    assert true
  end
end
