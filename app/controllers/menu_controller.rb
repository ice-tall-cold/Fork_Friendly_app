class MenuController < ApplicationController
  def new
 # @diet = Diet.diet_restriction
   render "diet_restriction"
  end
  
  def create
     render "start_shopping"
  end 
end