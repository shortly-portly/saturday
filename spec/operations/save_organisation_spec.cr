require "../spec_helper"

describe SaveOrganisation do
  it "should create an organisation" do
    organisation = SaveOrganisation.create!(valid_params)
    organisation.name.should eq "Organisation 1"
  end

  it "should return errors if mandatory fields are missing" do
    SaveOrganisation.create() do |operation, organisation|
      organisation.should eq nil
      operation.name.errors.should eq ["is required"]
      operation.address_line_1.errors.should eq ["is required"]
      operation.city.errors.should eq ["is required"]
      operation.county.errors.should eq ["is required"]
      operation.postcode.errors.should eq ["is required"]
      operation.country.errors.should eq ["is required"]
      operation.telephone.errors.should eq ["is required"]
      operation.email.errors.should eq ["is required"]
      operation.website.errors.should eq ["is required"]
    end
  end

  it "should all address_line_2 to be optional" do
    params = valid_params.reject("address_line_2")
    organisation = SaveOrganisation.create!(params)
    organisation.name.should eq "Organisation 1"
  end

  it "should not create two organisations with the same name" do
    organisation = SaveOrganisation.create!(valid_params)
    SaveOrganisation.create(valid_params) do |operation, organisation|
      organisation.should eq nil
      operation.name.errors.should eq ["is already taken"]
    end
  end

  it "should be able to delete if no associated records" do
    organisation = SaveOrganisation.create!(valid_params)
    organisation.delete
    Organisation::BaseQuery.all.size.should eq 0
  end

  it "should throw an exception if trying to delete with associated records" do
    organisation = SaveOrganisation.create!(valid_params)
    user = SignUpAdmin.create!(valid_admin_params, organisation_id: organisation.id)

    begin
      organisation.delete
    rescue ex
      ex.message.should eq "update or delete on table \"organisations\" violates foreign key constraint \"users_organisation_id_fkey\" on table \"users\""
    end
    Organisation::BaseQuery.all.size.should eq 1
  end
end

private def valid_params
  {
    "name"           => "Organisation 1",
    "address_line_1" => "Toy Street",
    "address_line_2" => "Toy Lane",
    "city"           => "Toy Town",
    "county"         => "Toy & Wear",
    "postcode"       => "NE11 QT2",
    "country"        => "Fedration of Toys",
    "telephone"      => "111-111-111",
    "email"          => "contact@email.com",
    "website"        => "www.toytown.com",
  }
end

private def valid_admin_params
  {
    "first_name"            => "Dave",
    "last_name"             => "Simmons",
    "email"                 => "dave@email.com",
    "password"              => "davedave",
    "password_confirmation" => "davedave",
    "role"                  => Role::Admin.to_i.to_s,
  }
end
