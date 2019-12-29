class Organisations::Show < BrowserAction
  route do
    html ShowPage, organisation: OrganisationQuery.find(organisation_id)
  end
end
