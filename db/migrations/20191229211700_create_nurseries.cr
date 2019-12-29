class CreateNurseries::V20191229211700 < Avram::Migrator::Migration::V1
  def migrate
    create table_for(Nursery) do
      primary_key id : Int64
      add_timestamps
      add name : String

      add_belongs_to organisation : Organisation, on_delete: :restrict
    end
  end

  def rollback
    drop table_for(Nursery)
  end
end
