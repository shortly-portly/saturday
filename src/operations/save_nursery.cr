class SaveNursery < Nursery::SaveOperation
  permit_columns name

  before_save do
    validate_uniqueness_of name
  end
end
