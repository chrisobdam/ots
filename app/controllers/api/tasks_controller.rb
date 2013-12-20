class Api::TasksController < ApiController
  def show
    @task = Task.find_by! identifier: params[:id]
  end
end