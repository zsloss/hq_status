module SessionsHelper

	def log_in(user)
		session[:user_id] = user.id
	end

	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def logged_in?
		!current_user.nil?
	end

	def set_user
		@user = User.find(params[:id])
	end

	def set_task
      @task = Task.find(params[:id])
    end

	def enforce_login
		unless logged_in?
			flash[:alert] = "Please log in first."
			redirect_to login_path
		end
	end

	def correct_user
		unless enforce_login
			set_user
			redirect_to current_user unless @user == current_user or current_user.admin
		end
	end

	def admin_only
		unless enforce_login
			redirect_to current_user unless current_user.admin
		end
	end

	def correct_owner
		unless enforce_login
			set_task
			redirect_to current_user unless current_user.id == @task.writer_id or current_user.admin
		end
	end

	def correct_owner_or_reviewer
		unless enforce_login
			set_task
			redirect_to current_user unless current_user.id == @task.writer_id or current_user.id == @task.reviewer_id or current_user.admin
		end
	end

end
