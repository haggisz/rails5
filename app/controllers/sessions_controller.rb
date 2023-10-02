class SessionsController < ApplicationController
<<<<<<< HEAD
=======
  skip_before_action :login_required
>>>>>>> cc6fe40bbfa09f0aa1fa3674b29e0f603a179346
  def new
  end

  def create
<<<<<<< HEAD
    user = User.find_by(email: session_params[:email])
=======
    user = User.find_by(:email: session_params[:email])
>>>>>>> cc6fe40bbfa09f0aa1fa3674b29e0f603a179346

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'ログインしました'
    else
<<<<<<< HEAD
      render :new
    end
  end

  private

=======
        render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "ログアウトしました"
  end

  private
>>>>>>> cc6fe40bbfa09f0aa1fa3674b29e0f603a179346
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
