class Api::V1::TasksController < Api::V1::ApplicationController
  before_action :set_task, only: %i[update show destroy]

  def index
    tasks = Task.order(created_at: :desc)
    render json: tasks.to_json
  end

  def create
    task = Task.new(task_params)

    if task.save
      render json: task.to_json
    else
      render json: { errors: task.errors.full_messages }
    end
  end

  def update
    if @task.update(task_params)
      render json: @task.to_json
    else
      render json: { errors: @task.errors.full_messages }
    end
  end

  def show
    render json: @task.to_json
  end

  def destroy
    if @task.destroy
      render json: @task.to_json
    else
      render json: { errors: @task.errors.full_messages, status: :unprocessable_entity }
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :body)
  end
end