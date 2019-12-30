class UserBox < Avram::Box
  def initialize
    email "#{sequence("test-email")}@example.com"
    encrypted_password Authentic.generate_encrypted_password("password")
    role Role::Admin.to_i
    organisation_id OrganisationBox.create.id
  end
end
