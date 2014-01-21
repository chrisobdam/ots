class Api::AssignController < ApiController
  before_filter :check_task, :get_user
  skip_before_filter :verify_authenticity_token  
  
  def create
    render nothing: true
  end
  
private
  def check_task
    unless params[:task].present?
      render text: "No task object found", status: :unprocessable_entity; return false
    end
    unless params[:task][:owner].present?
      render text: "No owner found", status: :unprocessable_entity; return false
    end
    unless params[:task][:owner].present?
      render text: "No owner found", status: :unprocessable_entity; return false
    end
  end
  
  def get_user
    begin
      @user = User.find_by!(identifier: params[:assignee_identifier])
    rescue ActiveRecord::RecordNotFound
      render text: "No user found", status: :not_found
      return false      
    end
  end
end