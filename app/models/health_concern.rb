class HealthConcern < ApplicationRecord
    belongs_to :user
  def self.update_table(user_id,calorie_healthy,heart_healthy,sodium_friendly,carb_friendly,kidney_friendly)
     begin
       user_concerns_header = ["user_id","Calorie_Friendly","Heart_Healthy", "Sodium_Friendly","Carb_Friendly","Kidney_Friendly"]
       user_row = HealthConcern.find_by user_id: user_id
       user_concerns = Hash[[user_concerns_header, [user_id,calorie_healthy,heart_healthy,sodium_friendly,carb_friendly,kidney_friendly]].transpose]
       if !user_row
         user_row = HealthConcern.create user_concerns
       else
         user_row.update_attributes user_concerns
       end
     end
  end
end
