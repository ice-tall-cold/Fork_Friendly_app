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
    
    describe 'GET #create' do
        context 'when given given a valid user and health conserns' do
            before do
               User.destroy_all
               load "#{Rails.root}/db/seeds.rb"
               #user = build(:user)
               get :create, params: {:user => attributes_for(:valid_user)}
            end
       
            it 'should make and save a proper user' do
               new_user = User.find_by(First_Name: 'Ashok')
               expect(new_user.First_Name).to eq attributes_for(:valid_user)[:First_Name]
            end
           
            it 'should set a welcome message and redirect' do

               response.should redirect_to '/login'
            end
            context 'when given an invalid user and health conserns' do
            before do
               User.destroy_all
               load "#{Rails.root}/db/seeds.rb"
               get :create, params: {:user => attributes_for(:invalid_user)}
            end
            
             it 'should render  a new page until proper user created' do
               response.should render_template("new")         
              
            end
            
            
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
end
    # end