class Organisation < BaseModel
  table do
    column name : String
    column address_line_1 : String
    column address_line_2 : String?
    column city : String
    column county : String
    column postcode : String
    column country : String
    column telephone : String
    column email : String
    column website : String
  end
end
