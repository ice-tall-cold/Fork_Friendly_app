class ProductLinesController < ApplicationController
  before_action :logged_in_user, only: [:new, :index, :import, :list, :destroy, :add_to_shoping_list, :return_subs, :return_chows, :concerns]
  before_action :is_admin, only: [:new, :import, :destroy]
  
  def new
    # @user = Chow.new
  end
  
  def concerns
    
  end
  
  # def concern_list
    
    
  #   index
  # end
  
  
  def import
    begin
      ProductLine.import(params[:file])
    rescue Exception => e
      flash[:danger] = e.message
#      redirect_to chows_new_path                 ##FIXME
      redirect_to 'https://google.com/'
    else
      flash[:success] = "File Imported"
#      redirect_to chows_index_path               ##FIXME
      redirect_to health_concerns_new_path
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

