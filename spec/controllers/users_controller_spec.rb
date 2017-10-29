require 'rails_helper'

describe UsersController do
    before do
        load "#{Rails.root}/db/seeds.rb"
    end
    
    describe 'new' do
        before do
            get :new
        end
        
        it 'should make a default user' do
            assigns(:user).should_not == nil
        end
    end
    
    describe 'create' do
        context 'when given a valid user' do
            before do
               User.destroy_all
               load "#{Rails.root}/db/seeds.rb"
               
               get(:create, {:user => {:First_Name => "Paul", :Last_Name => "Hawk", 
                        :Email => "paulmikehawk@ogmail.com", 
                        :password => "passw0rd", :password_confirmation => "passw0rd", :Gender => "Male"}})
            end
       
            it 'should make and save a proper user' do
               assigns(:user).first_name.should == "Paul";
               
               new_user = User.find_by(first_name: 'Paul')
               
               expect(new_user).to eq assigns(:user)
            end
           
            it 'should set a welcome message and redirect' do
               expect(flash[:success]).to eq "Welcome to Fork-Friendly!"
               
               response.should redirect_to '/'
            end
            
        end
        
        context 'when given a invalid user' do
            before do
               get(:create, 
               {:user => {:First_Name => 'Tonka', :Last_Name => 'Dan', 
                        :Email => 'tonka_the_tank_engine@m', 
                        :password => 'passw0rd', :password_confirmation => 'passw0rd', :Gender => "Male"}})
            end
            
            it 'should rerender the page' do
                response.should render_template("new")
            end
        end
    end
    
    # describe 'edit' do
    #     before do
    #         include SessionsHelper
    #         log_in(User.find_by(first_name: 'admin'))
    #         get :edit
    #     end
        
    #     it 'should set user for editting' do
    #         assigns(:user).should_not == nil
    #     end
    # end
    
    # describe 'index' do
        
        
    #     before do
    #         include ActionView::Helpers
    #         # include SessionsHelper
    #         # log_in(User.find_by(first_name: 'admin'))
            
    #         # controller.stub :logged_in_user
    #         # controller.stub :is_admin
            
    #         get :index
    #     end
        
    #     it 'should set user for display' do
    #         assigns(:user).should_not == nil
    #     end
    # end
end