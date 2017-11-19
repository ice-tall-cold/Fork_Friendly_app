require 'rails_helper'


describe HealthConcernsController do
     describe 'GET #concerns' do
        context 'when given given a valid user health conserns' do
            before do
               load "#{Rails.root}/db/seeds.rb"
               session[:user_id] = 1
               get(:concerns )
              User.destroy_all
            end
            it 'should redirect to product line page' do
              post :create, params: {:concerns => attributes_for(:health_concern)}
              #post(:create, params: {:concerns => attributes_for(:health_concern)})
            end
        end
    end
    
    describe 'GET #create' do
        context 'Method called post concerns' do
            before do
               load "#{Rails.root}/db/seeds.rb"
               session[:user_id] = 1
               get(:create, 
               params: {:concerns => {:calorie_friendly => 1, :heart_healthy => 0, :sodium_friendly => 0, :carb_friendly => 0, :kidney_friendly => 0}})
            end
            it 'should redirect to product line page' do
                response.should redirect_to '/product_line'
            end
        end
    end
    
    describe 'GET #show' do
        context 'Show Method HealthConcerns' do
            before do
               load "#{Rails.root}/db/seeds.rb"
               session[:user_id] = 1
            end
            it 'render the path' do
               get(:show)
               response.should render_template("concerns")
            end
        end
    end
    
    describe 'GET #continue' do
        context 'Continue Method HealthConcerns' do
            before do
               load "#{Rails.root}/db/seeds.rb"
               session[:user_id] = 1
            end
            it 'render the path' do
               get(:continue)
               response.should redirect_to '/product_line'
            end
        end
    end
    
    describe 'GET #product_line' do
        context 'Method product_line' do
            before do
               load "#{Rails.root}/db/seeds.rb"
               session[:user_id] = 1
               get(:product_line)
            end
            it 'post view go to product_category' do
                post :product_category, params: {:product_line => "Dairy"}
            end
        end
    end
    
    describe 'GET #product_category' do
        context 'Method product_category' do
            before do
               load "#{Rails.root}/db/seeds.rb"
               session[:user_id] = 1
            end
            it 'post view go to product_category' do
                get(:product_category, params: {:product_line => "Dairy"})
                response.should render_template("product_category")
            end
        end
    end
    
    describe 'GET #company_1' do
        context 'Method company' do
            before do
               load "#{Rails.root}/db/seeds.rb"
               session[:user_id] = 1
               get(:company, params: {:product_category => "Yogurt"})
            end
            it 'render company view' do
                response.should render_template("company")
            end
        end
    end
    
   describe 'GET #company_2' do
        context 'Method company' do
            before do
               load "#{Rails.root}/db/seeds.rb"
               session[:user_id] = 2
               get(:company, params: {:product_category => "Yogurt_1"})
            end
            it 'render company view' do
                response.should render_template("company")
            end
        end
    end 

   describe 'GET #company_3' do
        context 'Method company' do
            before do
               load "#{Rails.root}/db/seeds.rb"
               session[:user_id] = 3
               get(:company, params: {:product_category => "Yogurt_2"})
            end
            it 'render company view' do
                response.should render_template("company")
            end
        end
    end
    
       describe 'GET #company_4' do
        context 'Method company' do
            before do
               load "#{Rails.root}/db/seeds.rb"
               session[:user_id] = 4
               get(:company, params: {:product_category => "Yogurt_3"})
            end
            it 'render company view' do
                response.should render_template("company")
            end
        end
    end
    
    describe 'GET #company_5' do
        context 'Method company' do
            before do
               load "#{Rails.root}/db/seeds.rb"
               session[:user_id] = 5
               get(:company, params: {:product_category => "Yogurt_4"})
            end
            it 'render company view' do
                response.should render_template("company")
            end
        end
    end
    
    describe 'GET #updaate_cart' do
        context 'Method update_cart' do
            before do
               load "#{Rails.root}/db/seeds.rb"
               session[:user_id] = 1
            end
            it 'update cart with pid 52' do
               get(:update_cart, params:{:compny => 52 }) 
               response.should redirect_to '/company'
            end
        end
    end
 
    describe 'GET #final_cart' do
        context 'Method final_cart' do
            before do
               load "#{Rails.root}/db/seeds.rb"
               session[:user_id] = 1
            end
            it 'get final_cart and render the view' do
                get(:final_cart)
                response.should render_template("final_cart")
            end
        end
    end   
    
    describe 'GET #modify_cart' do
        context 'Method modify' do
            before do
               load "#{Rails.root}/db/seeds.rb"
               session[:user_id] = 1
            end
            it 'get final_cart and render the view' do
                get(:modify_cart, params:{:compny => 52})
                response.should redirect_to '/final_cart'
            end
        end
    end 
    
end