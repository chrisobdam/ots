class Assignee < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  
  # validates_format_of :user_identifier, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/  
  # validates_uniqueness_of :user_identifier, scope: :task_id
  validates_uniqueness_of :user, scope: :task_id, :allow_nil => true
  validates :identifier, presence: true
  
  def user_name
    user ? user.identifier : identifier
  end
  
  def status
    attributes["status"] || "pending"
  end
  
  def self.assign(user_identifier)
    if user = User.find_by(:identifier)
      assignee = create user: user
      assignee.notify unless assignee
    else
      assignee = create user_identifier: user_identifier
      assignee.task.model.assign(user_identifier) unless assignee
    end    
  end
  
  def notify
    # send e-mail notification
  end
end