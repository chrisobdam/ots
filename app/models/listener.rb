class Listener < ActiveRecord::Base
  belongs_to :user_object, foreign_key: :user, class_name: User
  belongs_to :task
end
