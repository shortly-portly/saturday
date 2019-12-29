class OrganisationBox < Avram::Box
  def initialize
    name "Organisation 1"
    address_line_1 "Toy Street"
    address_line_2 "Toy Lane"
    city "Toy Town"
    county "Toy & Wear"
    postcode "NE11 QT2"
    country "Fedration of Toys"
    telephone "111-111-111"
    email "contact@email.com"
    website "www.toytown.com"
  end
end
