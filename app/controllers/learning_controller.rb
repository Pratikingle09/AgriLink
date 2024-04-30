class LearningController < ApplicationController
  def index
    respo = HTTParty.get("https://agriculture-api-r09u.onrender.com/crop-diseases")
    @crop_diseases=  JSON.parse(respo.body)
    extracted_data = []

# Loop through each disease hash in @crop_diseases
@crop_diseases.each do |disease|
   id = disease["id"]                          
   name = disease["name"]                      
   description = disease["description"]        
   causes = disease["causes"]                  
   symptoms = disease["symptoms"]              
   cures = disease["cures"]                    

  extracted_data << {
     id: id,
     name: name,
     description: description,
     causes: causes,
     symptoms: symptoms,
     cures: cures
  }
end
@extracted_data = extracted_data
  end
end
