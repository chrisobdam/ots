module Ots
  class Server
    include Dnsruby    
    
    @domain
    @endpoints
    
    def initialize(domain)
      @domain = domain
    end
    
    def assign(task)
    end
    
    def resolve_dns_txt
      txt = Dnsruby::Resolver.new.query(domain, Types.TXT)
    end
    
    def valid?
      # has xrds
      # check https certificate is valid
    end
    
    def get_endpoints_from_xrds
    end
    
    def get_domain_from_txt_record(txt)
      if result = (txt||"").match(/domain:(.+)$/)
        result[1]
      end
    end
  end
end