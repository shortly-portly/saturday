class Nurseries::Delete < BrowserAction
  delete "/organisations/:organisation_id/nurseries/:nursery_id" do
    NurseryQuery.find(nursery_id).delete
    flash.success = "Deleted the record"
    redirect Index
  end
end
