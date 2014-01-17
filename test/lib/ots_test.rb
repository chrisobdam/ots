require 'test_helper'

class OtsTest < ActiveSupport::TestCase
  
  test "build ok task" do
    task = Ots::Task.build({:owner => "chris@opentaskstandard.com", :title => "Call John Doe"})
    assert_equal("Call John Doe", task.title)
    assert_equal("chris@opentaskstandard.com", task.owner.identifier)
    assert_equal("opentaskstandard.com", task.owner.domain)    
  end
  
  test "build user by identifier ok" do
    user = Ots::User.build("chris@opentaskstandard.com")
    assert_equal("opentaskstandard.com", user.domain)
    assert_equal("chris@opentaskstandard.com", user.identifier)
  end

  # test "call remote ots server assign endpoint assignee identifier rejected: does not exist" do
  #   stub_request(:post, "https://opentaskstandard.com/assign").
  #     with(:body => {:task_identifier => "25892e17-80f6-415f-9c65-7395632f0223@opentaskstandard.com"}, :headers => {'Accept'=>'*/*; q=0.5, application/xml', 'Accept-Encoding'=>'gzip, deflate', 'User-Agent'=>'Ruby'}).
  #     to_return(:status => 404, :message => "", :headers => {})
  #           
  #   task = Ots::Task.build({:owner => "chris@opentaskstandard.com", :title => "Call John Doe", :identifier => "25892e17-80f6-415f-9c65-7395632f0223@opentaskstandard.com"})
  #   
  #   result = task.owner.server.assign(task, "steve@opentaskstandard.com")
  # 
  #   assert_equal(true, result)
  # end

  # test "call remote ots server assign endpoint " do
  #   stub_request(:any, "https://opentaskstandard.com/assign").
  #     with(:body => "task_identifier=25892e17-80f6-415f-9c65-7395632f0223%40opentaskstandard.com&assignee_identifier=steve%40opentaskstandard.com&assignee_token=hjkdsa").
  #     to_return(:status => 200 ,:body => "", :headers => {})
  #                 
  #   task = Ots::Task.build({:owner => "chris@opentaskstandard.com", :title => "Call John Doe", :identifier => "25892e17-80f6-415f-9c65-7395632f0223@opentaskstandard.com"})
  #   
  #   result = task.owner.server.assign(task, "steve@opentaskstandard.com")
  # 
  #   assert_equal(true, result)
  # end

  # test "call remote ots server assign endpoint on non existing domain" do
  #   stub_request(:post, "https://opentaskstandrd.com/assign").
  #     with(:headers => {'Accept'=>'*/*; q=0.5, application/xml', 'Accept-Encoding'=>'gzip, deflate', 'User-Agent'=>'Ruby'}).
  #     to_raise(SocketError)
  # 
  #   task = Ots::Task.build({:owner => "chris@opentaskstandrd.com", :title => "Call John Doe"})
  #   
  #   result = task.owner.server.assign(task, "steve@opentaskstandard.com")
  # 
  #   assert_equal(false, result)    
  # end  
end
