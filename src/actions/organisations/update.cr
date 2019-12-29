class Organisations::Update < BrowserAction
  route do
    organisation = OrganisationQuery.find(organisation_id)
    SaveOrganisation.update(organisation, params) do |operation, organisation|
      if operation.saved?
        flash.success = "The record has been updated"
        redirect Show.with(organisation.id)
      else
        flash.failure = "It looks like the form is not valid"
        html EditPage, operation: operation, organisation: organisation
      end
    end
  end
end
