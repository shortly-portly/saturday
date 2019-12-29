class Organisations::Delete < BrowserAction
  route do
    OrganisationQuery.find(organisation_id).delete
    flash.success = "Deleted the record"
    redirect Index
  end
end
