class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:Email].downcase)
    if user && user.authenticate(params[:session][:Password])
      log_in user
      redirect_to '/'
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end
  def show
    
  end
  def destroy
    log_out
    redirect_to root_url
  end
end
