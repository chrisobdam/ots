class Api::AssignController < ApiController
  before_filter :check_task
  skip_before_filter :verify_authenticity_token  
  
  def create
    render nothing: true
  end
  
private
  def check_task
    unless params[:task].present? and params[:task].is_a?(Hash)
      render text: "No task object found", status: :unprocessable_entity; return false
    end
    unless params[:task][:identifier].present? and params[:task][:identifier].is_a?(String)
      render text: "No identifier found", status: :unprocessable_entity; return false
    end
    unless params[:task][:owner].present? and params[:task][:owner].is_a?(String)
      render text: "No owner found", status: :unprocessable_entity; return false
    end
    unless params[:task][:token].present? and params[:task][:token].is_a?(String)
      render text: "No token found", status: :unprocessable_entity; return false
    end
    unless params[:task][:title].present? and params[:task][:title].is_a?(String)
      render text: "No title found", status: :unprocessable_entity; return false
    end
    
    unless has_listeners and has_assignees
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
        params[:task][:assignees].each do |assignee|
          unless assignee[:identifer].present?
            render text: "No identifier found in assignee", status: :unprocessable_entity and return
          end
        end
        result = true
      else
        render text: "Malformed assignees; array expected", status: :unprocessable_entity and return
      end
    end
    result
  end

  def has_listeners
    result = false
    if params[:task][:listeners].present?
      if params[:task][:listeners].is_a?(Array)
        params[:task][:listeners].each do |listener|
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
  
  def check_for_valid_user
    result = []
    (params[:task][:listeners] + params[:task][:assignees].map{|x|x[:identifier]}).each do |user|
      result << obj if (obj = User.find_by(identifier: user))
    end
    !result.empty?
  end
end