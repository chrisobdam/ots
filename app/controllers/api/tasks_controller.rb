class Api::TasksController < ApiController

  def show
    @task = Task.find_by! identifier: params[:id]
  end

  def assign
    render nothing: true, status: :unprocessableentity unless params[:as].present? or ["assignee", "listener"].include?(params[:as])
    @task = Task.build(params[:task])
    user = User.find_by_identifier(params[:user])
    
    render nothing: true
  end
end