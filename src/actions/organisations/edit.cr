class Organisations::Edit < BrowserAction
  route do
    organisation = OrganisationQuery.find(organisation_id)
    html EditPage,
      operation: SaveOrganisation.new(organisation),
      organisation: organisation
  end
end
