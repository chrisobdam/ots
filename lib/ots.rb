require 'ots/client'
require 'ots/task'

module Ots

  def self.configure
    yield self
  end
end