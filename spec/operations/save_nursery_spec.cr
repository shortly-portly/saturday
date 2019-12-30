require "../spec_helper"

describe SaveNursery do
  it "should create a nursery" do
    admin = UserBox.create
    nursery = SaveNursery.create!(valid_params, organisation_id: admin.organisation_id)
    nursery.name.should eq "Toy Town Nursery"
  end

  it "should returns errors if mandatory nursery fields are not specified" do
    SaveNursery.create() do |operation, nursery|
      nursery.should eq nil
      operation.name.errors.should eq ["is required"]
    end
  end

  it "should not create two nurseries with the same name" do
    admin = UserBox.create
    nursery = SaveNursery.create!(valid_params, organisation_id: admin.organisation_id)
    SaveNursery.create(valid_params, organisation_id: admin.organisation_id) do |operation, nursery|
      nursery.should eq nil
      operation.name.errors.should eq ["is already taken"]
    end
  end
end

private def valid_params
  {
    "name" => "Toy Town Nursery",
  }
end
