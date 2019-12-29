class Admin < BaseModel
  table do
    column first_name : String
    column last_name : String

    belongs_to user : User
  end
end
