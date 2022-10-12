class TasksController < ApplicationController
  before_action :set_task, only: %i[update destroy]

  # GET /tasks
  def index
    @tasks = Task.all
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to root_url, notice: t(".success") }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  def update
    respond_to do |format|
      if @task.update complete: !@task.complete
        format.html { redirect_to root_url, notice: t(".#{@task.complete?}") }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to root_url, notice: t(".success") }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:title, :complete)
  end
end
