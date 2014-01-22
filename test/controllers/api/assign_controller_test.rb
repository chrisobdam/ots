require 'test_helper'

class Api::AssignControllerTest < ActionController::TestCase
  fixtures :tasks, :users

  test "missing task object" do
    post :create
    assert_response :unprocessable_entity
    assert_equal("No task object found", @response.body)
  end

  test "task not a hash" do
    post :create, {task: true}
    assert_response :unprocessable_entity
    assert_equal("No task object found", @response.body)
  end

  test "missing identifer in task" do
    post :create, {task: {empty: true}}
    assert_response :unprocessable_entity
    assert_equal("No identifier found", @response.body)
  end

  test "missing owner in task" do
    post :create, {task: {identifier: "a"}}
    assert_response :unprocessable_entity
    assert_equal("No owner found", @response.body)
  end

  test "missing token in task" do
    post :create, {task: {identifier: "25892e17", owner: "john@doe.com"}}
    assert_response :unprocessable_entity
    assert_equal("No token found", @response.body)
  end

  test "missing title in task" do
    post :create, {task: {identifier: "25892e17", owner: "john@doe.com", token: "25892e17"}}
    assert_response :unprocessable_entity
    assert_equal("No title found", @response.body)
  end

  test "missing assignees or listeners in task" do
    post :create, {task: {identifier: "25892e17", owner: "john@doe.com", token: "25892e17", title: "This is a task"}}
    assert_response :unprocessable_entity
    assert_equal("No assignee or listener found", @response.body)
  end

  test "Malformed listeners; array expected" do
    post :create, {task: {identifier: "25892e17", owner: "john@doe.com", token: "25892e17", title: "This is a task", listeners: "a"}}
    assert_response :unprocessable_entity
    assert_equal("Malformed listeners; array expected", @response.body)
  end

  # test "No assignee or listener found" do
  #   post :create, {task: {identifier: "25892e17", owner: "john@doe.com", token: "25892e17", title: "This is a task", listeners: ["john@doe.com"]}}
  #   assert_response :not_found
  #   assert_equal("No assignee or listener in this task is known on this server", @response.body)
  # end
  # 
  # test "listener found" do
  #   post :create, {task: {identifier: "25892e17", owner: "john@doe.com", token: "25892e17", title: "This is a task", listeners: ["john@doe.com"]}}
  #   assert_response :success
  #   assert_equal(" ", @response.body)
  # end

end