class Nurseries::Update < BrowserAction
  put "/organisation/:organisation_id/nurseries/:nursery_id/" do
    nursery = NurseryQuery.find(nursery_id)
    SaveNursery.update(nursery, params) do |operation, nursery|
      if operation.saved?
        flash.success = "The record has been updated"
        redirect Show.with(current_user.organisation_id, nursery.id)
      else
        flash.failure = "It looks like the form is not valid"
        html EditPage, operation: operation, nursery: nursery
      end
    end
  end
end
