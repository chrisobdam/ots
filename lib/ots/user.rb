module Ots
  class User
    @domain
    @identifier
    @server
    
    def initialize(identifier, domain)
      @identifier = identifier
      @domain = domain
    end
    
    def self.build(identifier)
      domain = identifier.split(/@/).last
      self.new(identifier, domain)
    end
    
    def valid_webfinger?
      WebFinger.discover! as_webfinger
      raise Ots::Webfinger::NoOtsProfileFound      
    end
    
    
    def server
      @server || Server.new(@domain)
    end

    def domain
      @domain
    end
    
    def identifier
      @identifier
    end
  private
    def as_webfinger
      "acct:#{identifier}"
    end  
  end
end