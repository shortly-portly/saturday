class Nursery < BaseModel
  table do
    column name : String

    belongs_to organisation : Organisation
  end
end
