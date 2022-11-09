class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    flash[:notice] = "タスクが作成されました"
    redirect_to tasks_path
  end

  private
    def task_params
      params.require(:task).permit(:title)
    end
end
