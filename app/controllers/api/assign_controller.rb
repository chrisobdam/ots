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
    unless params[:task][:identifier].present?
      render text: "No identifier found", status: :unprocessable_entity; return false
    end
    unless params[:task][:owner].present?
      render text: "No owner found", status: :unprocessable_entity; return false
    end
    unless params[:task][:token].present?
      render text: "No token found", status: :unprocessable_entity; return false
    end
    unless params[:task][:title].present?
      render text: "No title found", status: :unprocessable_entity; return false
    end
    
    unless has_assignees and has_listeners
      render text: "No assignee or listener found", status: :unprocessable_entity; return false
    end
    
    unless check_for_valid_user
      render text: "No assignee or listener in this task is known on this server", status: :not_found; return false
    end
  end
  
  def has_assignees  
    result = false
    if params[:task][:assignees].present?
      if params[:task][:assignees].is_a?(Array)
        params[:task][:assignees].each |assignee| do
          unless assignee[:identifer].present?
            render text: "No identifier found in assignee", status: :unprocessable_entity; return false
          end
        end
        result = true
      else
        render text: "Malformed assignees; array expected", status: :unprocessable_entity; return false
      end
    end
    result
  end

  def has_listeners
    result = false
    if params[:task][:listeners].present?
      if params[:task][:listeners].is_a?(Array)
        params[:task][:listeners].each |listener| do
          unless listener.is_a?(String)
            render text: "Malformed listeners; array of strings expected", status: :unprocessable_entity; return false
          end
        end
        result = true
      else
        render text: "Malformed listeners; array expected", status: :unprocessable_entity; return false
      end
    end
    result
  end
  
  def get_user
    begin
      @user = User.find_by!(identifier: params[:assignee_identifier])
    rescue ActiveRecord::RecordNotFound
      render text: "No user found", status: :not_found
      return false      
    end
  end
  
  def check_for_valid_user
    result = []
    (params[:task][:listeners] + params[:task][:assignees].map{|x|x[:identifier]}).each |user| do
      result << obj if (obj = User.find_by(identifier: user))
    end
    !result.empty?
  end
end