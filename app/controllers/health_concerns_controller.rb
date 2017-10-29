class HealthConcernsController < ApplicationController
<<<<<<< HEAD
  before_action :logged_in_user, only: [:new, :import,:concerns,:create]
=======
  before_action :logged_in_user, only: [:new, :import,:concerns,:create,:product_line,:product_line_create]
>>>>>>> af63c5d71fbae03631277d505d3a202e8cda4d8a
  before_action :is_admin, only: [:new, :import]
  
  def new

  end
  
<<<<<<< HEAD
=======
  
  def product_line
    
  end
  
  def continue
    redirect_to '/product_line'
  end
  
  def update_cart
    begin
      p_id = params[:compny]
        UserCart.update_cart(current_user.id,p_id.to_i,"true")
      rescue Exception => e
        flash[:danger] = e.message
        redirect_to 'https://google.com/'
      else
        flash[:success] = "User Concerns updated"
        redirect_to '/final_cart'
    end   
  end
  
  
  def final_cart
    product_cart = UserCart.where user_id: current_user.id
    len = product_cart.length
    $i =0
    $j =0
    @arr =[]
    @product =[]
    @company =[]
    @length =[]
    while $i < len
     prod_row = Product.where id: product_cart[$i].product_id
     @arr.push(prod_row[0])
     $i+=1
    end
    len = product_cart.length
    while $j < len
      @product.push(@arr[$j].Name)
      @company.push(@arr[$j].Company_Name)
      @length.push($j)
     $j+=1
    end 
    render 'final_cart'
  end
  
  def product_category
      p_l = ProductLine.find_by Name: params[:product_line]
      product_catgory = ProductCategory.where product_line_id: p_l.id
      len = product_catgory.length
      $i =0
      @arr =[]
      while $i < len.to_i do
        @arr.push( product_catgory[$i].Name.to_s)
        $i+=1
      end
      render 'product_category'
  end

 def company
      p_l = ProductCategory.find_by Name: params[:product_category]   
      produt=Product.where product_category_id: p_l.id
      @Name=[]
      @product_id =[]
      @Company_Name =[]
      @Serving_Size =[]
      @Calories =[]
      @Sat_Fat =[]
      @Sodium =[]
      @Carbs=[]
      @Sugar=[]
      @Fiber =[]
      @Protein =[]
      @Whole_Grain =[]
      @Gluten_Free =[] 
      @Organic =[]
      @Phosphorus =[]
      @Soy =[]
      @Potassium =[]
      @Milk =[]
      @Egg =[]
      @Nut =[]
      @FODMAP =[]
      @Additional_Info =[]
      @id =[]
      len = produt.length
      $i =0
      while $i < len.to_i do
      @Name.push( produt[$i].Name.to_s)
      @Company_Name.push( produt[$i].Company_Name.to_s)
      @Serving_Size.push( produt[$i].Serving_Size.to_s)
      @Calories.push( produt[$i].Calories.to_s)
      @Sat_Fat.push( produt[$i].Sat_Fat.to_s)
      @Sodium.push( produt[$i].Sodium.to_s)
      @Carbs.push( produt[$i].Carbs.to_s)
      @Sugar.push( produt[$i].Sugar.to_s)
      @Fiber.push( produt[$i].Fiber.to_s)
      @Protein.push( produt[$i].Protein.to_s)
      @Whole_Grain.push( produt[$i].Whole_Grain.to_s)
      @Gluten_Free.push( produt[$i].Gluten_Free.to_s)
      @Organic.push( produt[$i].Organic.to_s)
      @Phosphorus.push( produt[$i].Phosphorus.to_s)
      @Soy.push( produt[$i].Soy.to_s)
      @Potassium.push( produt[$i].Potassium.to_s)
      @Milk.push( produt[$i].Milk.to_s)
      @Egg.push( produt[$i].Egg.to_s)
      @Nut.push( produt[$i].Nut.to_s)
      @FODMAP.push( produt[$i].FODMAP.to_s)
      @product_id.push(produt[$i].id.to_i)
      @Additional_Info.push( produt[$i].Additional_Info.to_s)
      @id.push($i)
        $i+=1
      end
      render 'company' 
 end
  
>>>>>>> af63c5d71fbae03631277d505d3a202e8cda4d8a
  def concerns

  end
  
  def create
    begin
      HealthConcern.update_table(current_user.id,params[:concerns][:calorie_friendly],params[:concerns][:heart_healthy],params[:concerns][:sodium_friendly],params[:concerns][:carb_friendly],params[:concerns][:kidney_friendly])
    rescue Exception => e
      flash[:danger] = e.message
#      redirect_to chows_new_path                 ##FIXME
      redirect_to 'https://google.com/'
    else
      flash[:success] = "User Concerns updated"
#      redirect_to chows_index_path               ##FIXME
<<<<<<< HEAD
      redirect_to 'https://google.com/'
=======
      redirect_to '/product_line'
>>>>>>> af63c5d71fbae03631277d505d3a202e8cda4d8a
    end
  end
  
  def show
    render health_concerns_concerns_path
  end
  
  def import
    begin
      HealthConcernMap.import(params[:file])
    rescue Exception => e
      flash[:danger] = e.message
#      redirect_to chows_new_path                 ##FIXME
      redirect_to 'https://google.com/'
    else
      flash[:success] = "File Imported"
#      redirect_to chows_index_path               ##FIXME
      redirect_to 'https://google.com/'
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
<<<<<<< HEAD
end
=======
end
>>>>>>> af63c5d71fbae03631277d505d3a202e8cda4d8a
