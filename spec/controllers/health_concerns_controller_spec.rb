require 'rails_helper'

describe HealthConcernsController do
    
     describe 'GET #create' do
        context 'when given given a valid user health conserns' do
            before do
               User.destroy_all
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

end
