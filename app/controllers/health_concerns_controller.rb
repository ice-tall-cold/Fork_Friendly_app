class HealthConcernsController < ApplicationController
  before_action :logged_in_user, only: [:new, :import,:concerns,:create]
  before_action :is_admin, only: [:new, :import]
  
  def new

  end
  
  def concerns

  end
  
  def create
    begin
      HealthConcern.update_table(current_user.id,params[:concerns][:calorie_friendly],params[:concerns][:heart_healthy],params[:concerns][:sodium_friendly],params[:concerns][:carb_friendly],params[:concerns][:kidney_friendly])
    rescue Exception => e
      flash[:danger] = e.message
#      redirect_to chows_new_path                 ##FIXME
      redirect_to 'https://google.com/'
    else
      flash[:success] = "User Concerns updated"
#      redirect_to chows_index_path               ##FIXME
      redirect_to 'https://google.com/'
    end
  end
  
  def show
    render health_concerns_concerns_path
  end
  
  def import
    begin
      HealthConcernMap.import(params[:file])
    rescue Exception => e
      flash[:danger] = e.message
#      redirect_to chows_new_path                 ##FIXME
      redirect_to 'https://google.com/'
    else
      flash[:success] = "File Imported"
#      redirect_to chows_index_path               ##FIXME
      redirect_to 'https://google.com/'
    end
  end
  
  private
  def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
  end
    
  def is_admin

        redirect_to(root_url) unless current_user.Admin?
  end
end
