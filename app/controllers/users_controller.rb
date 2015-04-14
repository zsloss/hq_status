class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	before_action :correct_user, only: [:show, :edit, :update, :destroy]
	before_action :admin_only, only: [:index]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params) 
		respond_to do |format|
			if @user.save
				log_in @user
				format.html { redirect_to user_tasks_path(@user), notice: 'User was successfully added.' }
				format.json { render :index, status: :created, location: @user }
			else
				format.html { render :new }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	def index
		@users = User.all
		session[:return_to] = request.fullpath
	end

	def edit

	end

	def show
		@task = Task.new
		params[:sort_by] ||= "status"
		@remaining_tasks = @user.tasks.where(done: false)

		# Sort the remaining tasks
		criterion = Proc.new { |t| t.send params[:sort_by] } # attribute to sort by stored in params
		sorted_tasks = @remaining_tasks.select(&criterion).sort_by(&criterion)
		nil_attr_tasks = @remaining_tasks.reject(&criterion)
		@remaining_tasks = sorted_tasks + nil_attr_tasks # nil attributes at the end
		@remaining_tasks.reverse! if params[:order_by] == 'desc'

		@peer_reviews = @user.peer_reviews.where(done: false)
		@finished_tasks = @user.tasks.where(done: true)
		session[:return_to] = request.fullpath
		flash[:user_created] = @user.id
	end

	def update
		respond_to do |format|
			if @user.update(user_params)
				format.html { redirect_to session.delete(:return_to), notice: 'User was successfully updated.' }
				format.json { render :index, status: :ok, location: @user }
			else
				format.html { render :edit }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@user.destroy
		respond_to do |format|
			format.html { redirect_to :back, notice: 'User was successfully deleted.' }
			format.json { head :no_content }
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end


end
