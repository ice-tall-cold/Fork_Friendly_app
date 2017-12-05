require 'rails_helper'

describe SessionsController do
    before do
        load "#{Rails.root}/db/seeds.rb"
    end
    
    describe 'create' do
        context 'when given a valid user' do
           before do
              
              get :create, params: {:session => {:Email => "software@tamu.edu", :password => "password" } }
             
            end
           
            it 'should redirect with user logged in' do
                
                response.should render_template("userHome") 
            end
        end

        context 'when given an invalid user' do
            before do
                get :create, params: {:session => {:Email => "sankeerth@", :password => "password" } }
            end
           
            it 'should set an error message and rerender the page' do
                expect(flash[:danger]).to eq "Invalid email/password combination"
                
                response.should render_template("new")
            end
        end
    end
    
    describe 'destroy' do
        before do
            User.destroy_all
            load "#{Rails.root}/db/seeds.rb"
            user = User.find_by(email: "software@tamu.edu")
            get :destroy, params: { :user_id => user.id }
        end
        
        it 'should log you out and redirect' do
            expect(session[:user_id]).to eq nil
            assigns(:current_user).should == nil
            
            response.should redirect_to root_url
        end
    end
end
