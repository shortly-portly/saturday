require "../spec_helper"

describe SignUpAdmin do
  it "should create an Admin AND User" do
    params = {
      "first_name"            => "Dave",
      "last_name"             => "Simmons",
      "email"                 => "dave@email.com",
      "password"              => "davedave",
      "password_confirmation" => "davedave",
      "role"                  => "0",
    }

    user = SignUpAdmin.create!(params)
    user.email.should eq "dave@email.com"

    admin = AdminQuery.new.user_id(user.id).first
    admin.first_name.should eq "Dave"
  end

  it "should returns errors if mandatory user fields are not specified" do
    SignUpAdmin.create() do |operation, user|
      user.should eq nil
      operation.email.errors.should eq ["is required"]
      operation.password.errors.should eq ["is required", "is too short"]
      operation.password_confirmation.errors.should eq ["is required"]
    end
  end

  it "should return errors if mandatory admin fields are not specified" do
    params = {
      "email"                 => "dave@email.com",
      "password"              => "davedave",
      "password_confirmation" => "davedave",
      "role"                  => "0",
    }
    SignUpAdmin.create(params) do |operation, user|
      user.should eq nil
      operation.save_admin_op.first_name.errors.should eq ["is required"]
      operation.save_admin_op.last_name.errors.should eq ["is required"]
    end
  end
end
