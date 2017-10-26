require 'rails_helper'

describe SessionsController do
    before do
        load "#{Rails.root}/db/seeds.rb"
    end
    
    describe 'create' do
        context 'when given a valid user' do
            before do
                get :create, { :session => { :email => "willyman_ina_can@mailman.com", 
                                            :password => "passw0rd" } } 
            end
           
            it 'should redirect with user logged in' do
                response.should redirect_to '/'
            end
        end
        
        context 'when given an invalid user' do
            before do
                get :create, { :session => { :email => "not_in_database@email.com", 
                                            :password => "this gonna fail" } } 
            end
           
            it 'should set an error message and rerender the page' do
                expect(flash[:danger]).to eq "Invalid email/password combination"
                
                response.should render_template("new")
            end
        end
    end
    
    describe 'destroy' do
        before do
            user = User.find_by(email: "willyman_ina_can@mailman.com")
            get :destroy, nil, { :user_id => user.id }
        end
        
        it 'should log you out and redirect' do
            expect(session[:user_id]).to eq nil
            assigns(:current_user).should == nil
            
            response.should redirect_to root_url
        end
    end
end