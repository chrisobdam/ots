require 'test_helper'

class Api::TasksControllerTest < ActionController::TestCase
  test "get task info" do
    get :show, {task_identifier: "25892e17-80f6-415f-9c65-7395632f0223@opentaskstandard.com"}
    assert true
  end
end
