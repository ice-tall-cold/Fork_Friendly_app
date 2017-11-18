class UsersController < ApplicationController
    before_action :logged_in_user, only: [:edit, :update, :index, :destroy, :new_shopping_list]
    before_action :correct_user,   only: [:edit, :update]
    before_action :is_admin, only: [:index, :destroy]
    
    def index
        @users = User.paginate(page: params[:page])
    end
    
    def new
        @user = User.new

    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            #if params[:concerns]
            #    params[:concerns].each_key do |k|
            #        @healthconcern = @user.health_concerns.create(name: k)
            #    end
            #end
            log_in @user
            flash[:success] = "Welcome to Fork-Friendly!"
            redirect_to '/login'
        else
            
          render 'new'
        end
    end
    
    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
          flash[:success] = "Profile updated"
          redirect_to '/' 
        else
          render 'edit'
        end
    end
    
    def destroy
        User.find(params[:id]).destroy
        flash[:success] = "User deleted"
        redirect_to users_url
    end
    
    def new_shopping_list
      @user = User.find(session[:user_id])
      @list = @user.chows
      @list.delete_all
      
      redirect_to '/shop'
    end
    
  private

    def user_params
      params.require(:user).permit(:First_Name, :Last_Name, :Email, :password,
                                   :password_confirmation, :Gender)
    end
    
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    def is_admin
        redirect_to(root_url) unless current_user.admin?
    end
end