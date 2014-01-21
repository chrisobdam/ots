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
  
  test "full json object" do
    json = {
      task: {
        identifier: "25892e17-80f6-415f-9c65-7395632f0223",
        token: "a8006fa5d9d46c5e",
        owner: "chris@openstaskstandard.com",
        title: "This is a title",
        due_date: "2014-01-31T12:00:00+01:00",
        notes: "Working on it asap.\nHope you start too!",
        assignees: [{
              identifier: "john@task.af",
              status: "accepted"
            },{
              identifier: "chip@task.af"
            },            
          ],
        listeners: ["adam@task.af", "liam@gmail.com"],
        comments: [
            {
              index: 0,
              comment: "What is this?",
              author: "adam@task.af",
              date: "2014-01-21T22:51:57+01:00"
            },
            {
              index: 1,
              comment: "It's a task",
              author: "chris@openstaskstandard.com",
              date: "2014-01-21T22:59:57+01:00"
            }            
          ]
      }
    }
    post :create, json
    assert_response :success
    assert_equal(" ", @response.body)
  end
  
  test "missing any params" do
    post :create
    assert_response :unprocessable_entity    
  end
end

