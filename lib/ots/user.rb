module Ots
  class User
    @domain
    @identifier
    @server
    
    def initialize(identifier, domain)
      @identifier = identifier
      @domain = domain
    end
    
    def self.build(identification_string)
      identifier, domain = identification_string.split(/@/)
      self.new(identifier, domain)
    end
    
    def server
      @server || Server.new(@domain)
    end

    def domain
      @domain
    end
  end
end