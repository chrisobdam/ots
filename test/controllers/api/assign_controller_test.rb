require 'test_helper'

class Api::AssignControllerTest < ActionController::TestCase
  fixtures :tasks
  test "succesfull incoming post" do
    post :create, task: {identifier: "25892e17-80f6-415f-9c65-7395632f0223", token: "a-token", assignee: {identifier: "chris@openstaskstandard.com"}}
    assert_response :success
    assert_equal(" ", @response.body)
  end
  
  test "missing any params" do
    post :create
    assert_response :unprocessable_entity    
  end
end
