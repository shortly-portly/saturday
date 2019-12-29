require "../spec/support/boxes/**"

# Add seeds here that are *required* for your app to work.
# For example, you might need at least one admin user or you might need at least
# one category for your blog posts for the app to work.
#
# Use `Db::CreateSampleSeeds` if your only want to add sample data helpful for
# development.
class Db::CreateRequiredSeeds < LuckyCli::Task
  summary "Add database records required for the app to work"

  def call
    # Using a Avram::Box:
    #
    # Use the defaults, but override just the email
    # UserBox.create &.email("me@example.com")

    # Using a SaveOperation:
    #
    # SaveUser.create!(email: "me@example.com", name: "Jane")
    #
    # You likely want to be able to run this file more than once. To do that,
    # only create the record if it doesn't exist yet:
    #
    # unless UserQuery.new.email("me@example.com").first?
    #  SaveUser.create!(email: "me@example.com", name: "Jane")
    # end

    # Create 1st organisation
    organisation = SaveOrganisation.create!(organisation_params)
    SignUpUser.create!(super_params, organisation_id: organisation.id)
    puts "Done adding required data"
  end
end

private def organisation_params
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

private def super_params
  {
    "email"                 => "dave@email.com",
    "password"              => "daviddavid",
    "password_confirmation" => "daviddavid",
    "role"                  => "0",
  }
end
