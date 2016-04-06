class TasksController < ApplicationController
  def index
    @task = Task.new
    @tasks = Task.order(:id, position: :asc)
  end

  def show
    task = Task.find(params[:id])
    if task
      @task = task
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new
    @task.body = params[:task][:body]
    @task.position = params[:task][:position]
    @task.completed = false

    if @task.save
      flash[:notice] = "Task added"
      redirect_to tasks_path
    else
      flash[:alert] = "Task could not be saved"
      @tasks = Task.order(position: :asc)
      render :index
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
   Task.update(params[:id], task_params)
   redirect_to root_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path
    flash[:alert] = "Task deleted"

  end

  def complete
    params[:tasks_checkbox].each do |check|
      task_id = check
      t = Task.find_by_id(task_id)
      t.update_attribute(:completed, true)
      flash[:notice] = "Task completed"
    end
    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit(:body, :position, :completed)
  end

end
