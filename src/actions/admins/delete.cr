class Admins::Delete < BrowserAction
  route do
    AdminQuery.find(admin_id).delete
    flash.success = "Deleted the record"
    redirect Index
  end
end
