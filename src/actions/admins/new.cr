class Admins::New < BrowserAction
  get "/organisation/:organisation_id/admin/new" do
    organisation = OrganisationQuery.find(organisation_id)

    html NewPage, operation: SignUpAdmin.new, organisation: organisation
  end
end
