class Api::TasksController < ApiController

  def show
    @task = Task.find_by! identifier: params[:id]
  end
  
  def server_valid?
    # check if server controls the domain he requesting for
    #  - check if user-domain is connected to the requesting server
  end
end