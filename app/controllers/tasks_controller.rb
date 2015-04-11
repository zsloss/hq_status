class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /users/1/tasks
  # GET /tasks.json
  def index
    init_index
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    @user_id = params[:user_id]
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    init_index
    if user_id = params[:user_id]
      @task.writer_id = user_id
    end
    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_path, notice: 'Task was successfully added.' }
        format.json { render :index, status: :created, location: @task }
      else
        format.html { render :index }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        @tasks = Task.all
        format.html { redirect_to tasks_path, notice: 'Task was successfully updated.' }
        format.json { render :index, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
  def init_index
    @tasks = Task.all
    if user_id = params[:user_id]
      @remaining_tasks = Task.where(writer_id: user_id, done: false)
      @peer_reviews = Task.where(reviewer_id: user_id, done: false)
      @finished_tasks = Task.where(done: true)
    else
      @remaining_tasks = Task.where(done: false)
      @finished_tasks = Task.where(done: true)
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:writer_id, :reviewer_id, :flow, :product, :doc_type, :start_date, :version, :revision, :status, :region, :done, :draft, :draft_submitted, :completion_date, :notes)
    end
  end
