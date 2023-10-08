class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @q  = current_user.tasks.ransack(params[:q])
    @tasks = @q.result(distinct: true).page(params[:page])

    respond_to do |format|
      format.html
      format.csv { send_data @tasks.generate_csv, filename: "tasks-#{Time.zone.now.strftime('%Y%m%d%S')}.csv" }
    end
  end

  def show
    @task = current_user.tasks.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new(task_params)

    if params[:back].present?
      render :new
      return
    end

    if @task.save
      TaskMailer.creation_email(@task).deliver_now
      flash[:notice] = "タスク「#{@task.name}」を登録しました。"
      redirect_to @task
    else
      render :new
    end
  end

  def edit
    @task = current_user.tasks.find(params[:id])
  end

  def update
    task = current_user.tasks.find(params[:id])
    task.update!(task_params)
    flash[:notice] = "タスク「#{task.name}」を更新しました。"
    redirect_to tasks_url
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy
    flash[:notice] = "タスク「#{task.name}」を削除しました"
    redirect_to tasks_url
  end

  def import
    current_user.tasks.import(params[:file])
    flash[:notice] = "タスクを追加しました"
    redirect_to tasks_url
  end

  def task_logger
    @task_logger ||= Logger.new('log/task.log', 'daily')
  end

  def confirm_new
    @task = current_user.tasks.new(task_params)
    render :new unless @task.valid?
  end

  def import
    current_user.tasks.import(params[:file])
    flash[:notice] = "タスクを追加しました"
    redirect_to tasks_url
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :image)
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end
end

# tasks_params = if user.premium?
#   params.require(:task).permit(:name, :description, :special)
# else
#   params.require(:task).permit(:name, :description)
# end

# Task.new(task_params)
# task_logger.debug 'taskのログを出力'
