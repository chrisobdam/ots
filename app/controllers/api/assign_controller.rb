class Api::AssignController < ApiController
  # before_filter :check_task
  skip_before_filter :verify_authenticity_token  
  
  def create
    begin
      Task.build(params[:task])
    rescue Task::CommentsError
      render text: "Comments is not an array", status: :unproccesableentity
    rescue Task::ListenersError
      render text: "Listeners is not an array", status: :unproccesableentity
    rescue Task::AssigneesError
      render text: "Assignees is not an array", status: :unproccesableentity
    rescue ActiveRecord::UnknownAttributeError
      render text: "Unknown attribute in task", status: :unproccesableentity
    end
  end
  
end