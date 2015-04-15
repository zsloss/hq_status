class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]
  before_action :admin_only, only: [:index]
  before_action :correct_owner, only: [:edit, :destroy]
  before_action :correct_owner_or_reviewer, only: [:update]

  # GET /users/1/tasks
  # GET /tasks.json
  def index
    @users = User.all
    @unassigned = Task.where(writer_id: nil)
    @task = Task.new
    session[:return_to] = request.fullpath
  end

  # GET /tasks/1/edit
  def edit
    session[:return_to] = request.referer
  end

  # POST /tasks
  # POST /tasks.json
  def create

    # Deal with no documents selected
    if params[:task][:documents].nil?
      flash.now[:alert] = "Please select at least one document type."
      @task = Task.new(task_params)
      flash.keep :user_created
      render 'shared/_new_form' and return
    end

    # Save each document type in a separate task
    params[:task][:documents].each do |doc_type|
      @task = Task.new(task_params)
      @task.doc_type = doc_type
      @task.writer_id ||= flash[:user_created]

      render 'shared/_new_form' and return unless @task.save
    end

    redirect_to session.delete(:return_to), notice: params[:task][:documents].length > 1 ? 'Tasks were successfully added.' : 'Task was successfully added.'
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to session.delete(:return_to), notice: 'Task was successfully updated.' }
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
      format.html { redirect_to :back, notice: 'Task was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:writer_id, :reviewer_id, :flow, :product, :doc_type, :start_date, :version, :revision, :status, :region, :done, :draft, :draft_submitted, :completion_date, :notes)
    end
  end
