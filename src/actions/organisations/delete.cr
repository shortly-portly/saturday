class Organisations::Delete < BrowserAction
  route do
    if admins_for_organisation?(organisation_id) || nurseries_for_organisations?(organisation_id)
      flash.failure = "Unable to delete Organisation - has associated Users/Nursuries"
    else
      OrganisationQuery.find(organisation_id).delete

      flash.success = "Organisation deleted"
    end
    redirect Index
  end

  private def admins_for_organisation?(organisation_id)
    if UserQuery.new.organisation_id(organisation_id).select_count > 0
      true
    else
      false
    end
  end

  private def nurseries_for_organisations?(organisation_id)
    if NurseryQuery.new.organisation_id(organisation_id).select_count > 0
      true
    else
      false
    end
  end
end
