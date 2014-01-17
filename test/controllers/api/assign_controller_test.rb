require 'test_helper'

class Api::AssignControllerTest < ActionController::TestCase
  fixtures :tasks, :users
  test "succesfull incoming assign post" do
    post :create, {task_identifier: "25892e17-80f6-415f-9c65-7395632f0223", assignee_token: "a-token", assignee_identifier: "chris@openstaskstandard.com"}
    assert_response :success
    assert_equal(" ", @response.body)
  end
  
  test "user not found" do
    post :create, {task_identifier: "25892e17-80f6-415f-9c65-7395632f0223", assignee_token: "a-token", assignee_identifier: "john@openstaskstandard.com"}
    assert_response :missing
  end
  
  test "missing any params" do
    post :create
    assert_response :unprocessable_entity    
  end
end