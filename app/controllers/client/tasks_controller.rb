class Client::TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.create(params["task"])
  end
  
  def show
    @task = Task.find params[:id]
  end
end