class HealthConcernMap < ApplicationRecord
    belongs_to :product_category
    
  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    product_header = ["Calorie_Friendly","Heart_Healthy","Sodium_Friendly","Carb_Friendly","Kidney_Friendly","Comments","product_category_id"]
    (2..spreadsheet.last_row).each do |i|
    begin
      first_cell = spreadsheet.cell(i, 1) #Bacon
      p_c = ProductCategory.find_by Name: first_cell #first search in prod cat table
      h_c = HealthConcernMap.find_by product_category_id:  p_c.id #second search in health convert table
      row = Hash[[product_header, spreadsheet.row(i).first(product_header.size-1)+[p_c.id]].transpose]    #.row(i) error with new format
      if h_c
        h_c = HealthConcernMap.update_attributes row
      else
        h_c = HealthConcernMap.create row 
      end
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