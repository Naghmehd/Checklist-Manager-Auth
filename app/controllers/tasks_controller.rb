class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.order(position: :asc)
  end

  def show
    task = Task.find(params[:id])
    if task
      @task = task
    end
  end

  def new
    redirect_to root_path
  end

  def create
    @task = Task.new
    @task.body = params[:task][:body]
    @task.position = params[:task][:position]
    @task.completed = false

    if @task.save
      flash[:notice] = "Task added"
      redirect_to root_path
    else
      flash[:alert] = "Task could not be saved"
      @tasks = Task.order(position: :asc)
      render :index
    end
  end

  def  update
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path
    flash[:alert] = "Task deleted"
  end

end
