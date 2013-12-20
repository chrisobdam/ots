require 'ots/client'
require 'ots/task'
require 'ots/server'
require 'ots/user'

module Ots

  def self.configure
    yield self
  end
end