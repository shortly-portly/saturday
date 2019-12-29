class CreateOrganisations::V20191229113051 < Avram::Migrator::Migration::V1
  def migrate
    create table_for(Organisation) do
      primary_key id : Int64
      add_timestamps
      add name : String
      add address_line_1 : String
      add address_line_2 : String
      add city : String
      add county : String
      add postcode : String
      add country : String
      add telephone : String
      add email : String
      add website : String
    end
  end

  def rollback
    drop table_for(Organisation)
  end
end
