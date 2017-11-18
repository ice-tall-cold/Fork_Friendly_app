class ProductLine < ApplicationRecord
    has_many :product_categories
    
  def self.import(file)
    
    spreadsheet = open_spreadsheet(file)
    product_header = ["Name","Serving_Size","Calories","Sat_Fat","Sodium","Carbs","Sugar","Fiber","Protein","Whole_Grain","twenty_cent","Gluten_Free","Organic","Phosphorus","Soy","Potassium","Milk","Egg","Nut","FODMAP","Additional_Info","Company_Name","product_category_id"]
#    header2 = ["name", "subcategory", "product_name", "calories", "sat_fat", "sodium", "carbs", "sugar", "fiber", "protein", "whole_grain", "gluten_free", "phosphorus", "soy", "potassium", "milk", "egg", "fodmap"]
    product_category_header = ["Name","product_line_id"] #, "subcategory", "product_name", "calories", "sat_fat", "sodium", "carbs", "sugar", "fiber", "protein", "whole_grain", "gluten_free", "phosphorus", "soy", "potassium", "milk", "egg", "fodmap"]
#    headerb = [true, true, true, true, true, true, true, true, true, true, true, true, true, true, true, true]
    product_lines_header = ["Name"]
    
    
    store = ""
    category = ""
    subcategory = ""
    cat = nil

    (2..spreadsheet.last_row).each do |i|
      begin
        first_cell = spreadsheet.cell(i, 1)
        
        if first_cell == '**'
          
          store = spreadsheet.cell(i, 3)
          prod_line = spreadsheet.cell(i, 4)
          category = spreadsheet.cell(i, 5)
          arr = Array.new
          arr.push prod_line
          new_prod_line = Hash[[product_lines_header, arr].transpose]
          p_l = ProductLine.find_by Name: prod_line
          if !p_l
            p_l = ProductLine.create new_prod_line
          else
            p_l.update_attributes new_prod_line
          end   
          p_l_id = p_l.id
          
          arr = Array.new
          arr.push category
          arr.push(p_l_id)
          new_category = Hash[[product_category_header,arr].transpose]
          cat = ProductCategory.find_by Name: category
          if !cat
              cat = ProductCategory.create new_category
          else
              cat.update_attributes new_category
          end
          cat_id = cat.id
        elsif first_cell != nil && first_cell != "" && first_cell != " "
          row = Hash[[product_header, spreadsheet.row(i).first(product_header.size-2)+[store,cat.id]].transpose]    #.row(i) error with new format
          
          # some items may come with a <1 gram of fiber (or any other nutrient)
          # here we change the "<" symbol into a "-" so it can store as a float
          # later we change the negative back into a "<"
          row.each do |x,y|
            if y =~ /^</
              row[x][0] = "-"
              row[x] = row[x].to_f
            end
          end
          
          prod = Product.find_by_Name(row["Name"])
          
          if prod
            prod.update_attributes row.to_hash
          else
            prod =Product.create row.to_hash
          end
        end
      rescue
        raise "Error on row #{i} of spreadsheet"
      end
    end
  end
  
  def self.open_spreadsheet(file)
    case File.extname(file.path)
    when ".csv" then Roo::CSV.new(file.path, options = Hash.new) #add options
    #when ".csv" then Roo::Spreadsheet.open(file.path, extension: :csv)
    when ".xls" then Roo::Excel.new(file.path) #, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path) #, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
    
  def self.findtype
  end

end