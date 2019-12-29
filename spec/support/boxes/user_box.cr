class UserBox < Avram::Box
  def initialize
    email "#{sequence("test-email")}@example.com"
    encrypted_password Authentic.generate_encrypted_password("password")
    role 0
  end
end
