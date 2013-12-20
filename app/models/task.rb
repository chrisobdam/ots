class Task < ActiveRecord::Base
  has_many :assignees
  has_many :listeners  
  has_many :comments
  belongs_to :owner, :class_name => User
  
  after_save :push_updates
  
  def push_updates
    all_concerned.each do |user|
      # post to concerning ots server
    end
  end
  
  def all_concerned
    (listeners.map(&:user).push(owner) + assignees.map(&:user)).compact
  end
  
  def push_update(user)
    # RestClient.update()
  end
  
  def listeners_array
    listeners.map(&:user).map(&:identifier)
  end  
end