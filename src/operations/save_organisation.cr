class SaveOrganisation < Organisation::SaveOperation
  permit_columns name, address_line_1, address_line_2, city, county, postcode, country, telephone, email, website 

  before_save do
    validate_uniqueness_of name
  end
end
