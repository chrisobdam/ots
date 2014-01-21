class Task < ActiveRecord::Base
  has_many :assignees
  has_many :listeners  
  has_many :comments
  belongs_to :owner, :class_name => User
  
  after_save :push_updates
  before_save :create_assignees
  
  attr_accessor :assignees_text  
  
  def build(json)
    
  end
  
  def to_param
    URI::encode(identifier)
  end
  
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
  
  def create_assignees
    if assignees_text
      assignees_text.split(",").each do |assignee|
        assignees.assign(assignee)
      end
    end
  end
  
  def listeners_array
    listeners.map(&:user).map(&:identifier)
  end
  
  def model
    @model ||= Ots::Task.build({:owner => owner.identifier, :title => title})
  end
end