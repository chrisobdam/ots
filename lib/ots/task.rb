module Ots
  class Task
    @owner
    def initialize(owner)
      @owner = owner
    end

    def self.build(hash)
      initialize(User.build(hash[:owner]))
      
    end

    def assign(identifier)
      user = User.build(identifier)
      owner.server.assign(self, user)
    end
  end
end

# task = Ots::Task.build({:owner => "chris@openstaskstandard.com", :title => "Make this work"})
# task.assign("sander@holder.nl")