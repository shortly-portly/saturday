class User < BaseModel
  include Carbon::Emailable
  include Authentic::PasswordAuthenticatable

  table do
    column email : String
    column encrypted_password : String
    column role : Int32

    belongs_to organisation : Organisation
  end

  def emailable : Carbon::Address
    Carbon::Address.new(email)
  end
end
