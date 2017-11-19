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
    
    

  private

    def user_params
      params.require(:user).permit(:First_Name, :Last_Name, :Email, :password,
                                   :password_confirmation, :Gender)
    end

end