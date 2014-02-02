class Task < ActiveRecord::Base
  has_many :assignees
  has_many :listeners
  has_many :comments
  belongs_to :owner, :class_name => User
  
  after_save :push_updates
  before_save :create_assignees
  
  validates :title, presence: true
  validates :identifier, presence: true
  
  attr_accessor :assignees_text  

  class AssigneesError < StandardError;end
  class ListenersError < StandardError;end
  class CommentsError < StandardError;end
  class UnknownAttributeError < StandardError;end
      
  def self.build(json)
    assignees_hash = json.delete(:assignees) || []
    comments_hash = json.delete(:comments) || []
    listeners_hash = json.delete(:listeners) || []
    owner_string = json.delete(:owner) || ""
    
    task = Task.new(json)
    
    task.owner = User.new({identifier: owner_string})

    raise AssigneesError unless assignees_hash.is_a?(Array)
    raise ListenersError unless listeners_hash.is_a?(Array)
    raise CommentsError unless comments_hash.is_a?(Array)
    
    assignees_hash.each do |assignee|
      task.assignees.new(assignee)
    end

    listeners_hash.each do |listener|
      task.listeners.new({user: listener})
    end

    comments_hash.each do |comment|
      task.comments.new(comment)
    end

    task
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