class HealthConcernsController < ApplicationController

  before_action :logged_in_user, only: [:new,:index,:import,:concerns,:create,:product_line,:product_line_create]
  before_action :is_admin, only: [:new, :index, :import]
  @to_remove = []
  def new

  end
  
  def product_line
    
  end
  
  def index
    
  end
  
  def continue
    redirect_to '/product_line'
  end
  
  def update_cart
    begin
      p_id = params[:compny]
        UserCart.update_cart(current_user.id,p_id.to_i,"true")
        redirect_to '/company'
    end   
  end
  
  def modify_cart
    begin
        p_id = params[:compny]
        user_cart_data = UserCart.where user_id: current_user.id
        item_remove = user_cart_data.find_by product_id: p_id
        item_remove.destroy
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
    @product_id =[]
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
      @product_id.push(@arr[$j].id.to_i)
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
	  session[:product_category_link] = request.url if request.get?
      render 'product_category'
  end

 def company
      if params[:product_category] != nil 
        p_l = ProductCategory.find_by Name: params[:product_category]
        session[:product_category] = p_l
        p_l_id = p_l["id"]
      else
        p_l = session[:product_category]
        p_l_id = p_l["id"]
      end
	  session[:product_link] = request.url if request.get?
      produt_database=Product.where product_category_id: p_l_id
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
      len = produt_database.length
        user_cncern_list = HealthConcern.where user_id: current_user.id
      if user_cncern_list[0].Calorie_Friendly ==1
        user_cncern = "Calorie_Friendly"
      elsif user_cncern_list[0].Heart_Healthy ==1
        user_cncern = "Heart_Healthy"
      elsif user_cncern_list[0].Sodium_Friendly ==1
        user_cncern = "Sodium_Friendly"
      elsif user_cncern_list[0].Carb_Friendly ==1
        user_cncern = "Carb_Friendly"
      elsif user_cncern_list[0].Kidney_Friendly ==1
        user_cncern = "Kidney_Friendly"
      end
      cncern_map = HealthConcernMap.where product_category_id: p_l_id
      srt_by = cncern_map[0][user_cncern]
      concern_acronym = {"LS" => "Sodium","LSF" => "Sat_Fat","Lcal" => "Carbs"}
      produt = produt_database.sort_by { |k| k[concern_acronym[srt_by]]}
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
  

  def concerns
  end
  
  def create
    begin
      HealthConcern.update_table(current_user.id,params[:concerns][:calorie_friendly],params[:concerns][:heart_healthy],params[:concerns][:sodium_friendly],params[:concerns][:carb_friendly],params[:concerns][:kidney_friendly])
      rescue Exception => e
      flash[:danger] = e.message
      redirect_to 'https://google.com/'
    else
      flash[:success] = "User Concerns updated"
	  session[:product_line_link] = '/product_line'
      redirect_to '/product_line'
    end
  end
  
  def show
    render 'concerns'
  end
  
  def import
    begin
      HealthConcernMap.import(params[:file])
    rescue Exception => e
      flash[:danger] = e.message
      redirect_to 'https://google.com/'
    else
      flash[:success] = "File Imported"
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
end
