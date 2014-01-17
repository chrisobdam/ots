module Ots
  module Webfinger
    class NoOtsProfileFound < StandardError; end
  end

  class Server    
    @domain
    @endpoints
    
    def initialize(domain)
      @domain = domain
    end
    
    def assign(task, assignee_identifier)
      if active?
        begin
          response = HTTParty.post("https://#{@domain}/assign", {:body => {:task_identifier => task.identifier, :assignee_identifier => assignee_identifier}})
          # response.code = 200
        rescue SocketError
          return false
        end
      end
    end
    
    def webfinger_enabled?
      # check if yrd is in place
    end
    
    def get_endpoints_from_xrds
    end
    
  end
end