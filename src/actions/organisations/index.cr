class Organisations::Index < BrowserAction
  route do
    html IndexPage, organisations: OrganisationQuery.new
  end
end
