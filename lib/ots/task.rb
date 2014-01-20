module Ots
  class Task
    @owner
    @hash
    
    def initialize(owner, hash)
      @owner = owner
      @hash = hash
    end

    def self.build(hash)
      self.new(User.build(hash[:owner]), hash)
    end

    def assign(identifier)
      user = User.build(identifier)
      if user.valid_webfinger?
        owner.server.assign(self, user)
    end
    
    def owner
      @owner
    end
    
    def title
      @hash[:title]
    end
    
    def identifier
      @hash[:identifier]
    end
  end
end

# task = Ots::Task.build({:owner => "chris@openstaskstandard.com", :title => "Make this work"})
# task.assign("sander@holder.nl")