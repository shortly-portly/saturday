class Nurseries::Create < BrowserAction
  route do
    SaveNursery.create(params, organisation_id: current_user.organisation_id) do |operation, nursery|
      if nursery
        flash.success = "The record has been saved"
        redirect Show.with(current_user.organisation_id, nursery.id)
      else
        flash.failure = "It looks like the form is not valid"
        html NewPage, operation: operation
      end
    end
  end
end
