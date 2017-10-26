class SessionsController < ApplicationController

  def home
    render 'home'
  end

  def new
    render 'new'
  end
  
  def create
    user = User.find_by(email: params[:session][:Email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      render 'userHome'
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  ##def user_home
  ##  render 'userHome'
  ##end

  def show
    
  end
  def destroy
    log_out
    redirect_to root_url
  end
end