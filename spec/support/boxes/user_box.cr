class UserBox < Avram::Box
  def initialize
    organisation = OrganisationBox.create

    email "#{sequence("test-email")}@example.com"
    encrypted_password Authentic.generate_encrypted_password("password")
    role 0
    organisation_id organisation.id
  end
end
