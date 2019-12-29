class CreateAdmins::V20191229074714 < Avram::Migrator::Migration::V1
  def migrate
    create table_for(Admin) do
      primary_key id : Int64
      add_timestamps
      add first_name : String
      add last_name : String

      add_belongs_to user : User, on_delete: :restrict
    end
  end

  def rollback
    drop table_for(Admin)
  end
end
