require 'test_helper'
require 'webmock'


class OtsTest < ActiveSupport::TestCase
  include WebMock::API    
  
  test "check for valid txt record" do
    # DnsRuby.any_instance.stub!(:query).and_return()
    stub_request(:any, "www.example.com")
    assert true
  end
  
  test "get domain from txt" do
    result = Ots::Server.new("").get_domain_from_txt_record("v=ots domain:opentaskstandard.com")
    assert_equal("opentaskstandard.com", result)
  end
  
  test "incorrect ots txt record" do
    result = Ots::Server.new("").get_domain_from_txt_record("v=ots doman:opentaskstandard.com")
    assert_equal(nil, result)
  end

  test "empty result" do
    result = Ots::Server.new("").get_domain_from_txt_record("")
    assert_equal(nil, result)        

    result = Ots::Server.new("").get_domain_from_txt_record(nil)
    assert_equal(nil, result)        
  end
  
  test "build ok task" do
    assert true
  end
  
  test "build user by identifier ok" do
    user = Ots::User.build("chris@opentaskstandard.com")
    assert_equal("opentaskstandard.com", user.domain)
  end
  
end
