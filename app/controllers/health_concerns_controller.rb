class HealthConcernsController < ApplicationController
  before_action :logged_in_user, only: [:new, :import]
  before_action :is_admin, only: [:new, :import]
  
  def new

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
