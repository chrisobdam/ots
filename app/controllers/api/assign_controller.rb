class Api::AssignController < ApiController
  before_filter :check_task, :get_user
  skip_before_filter :verify_authenticity_token  
  
  def create
    render nothing: true
  end
  
private
  def check_task
    unless params["task"].present? and params["task"]["identifier"].present? and params["task"]["token"].present?
      render text: "No task identifier or token found", :status => :unprocessable_entity
      return false      
    end
  end
  
  def get_user
    begin
      @user = User.find_by!(identifier: params["task"]["assignee"]["identifier"])
    rescue ActiveRecord::RecordNotFound
      render text: "No user found", :status => :unprocessable_entity
      return false      
    end
  end
end
