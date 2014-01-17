class AssigneesController < ApplicationController
  skip_before_filter :authenticate_or_token
  def show
    task = Task.find_by identifier: params[:task_id]
    @assignee = task.assignees.find params[:id]
  end
  
end