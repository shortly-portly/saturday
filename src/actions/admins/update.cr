class Admins::Update < BrowserAction
  route do
    admin = AdminQuery.find(admin_id)
    SaveAdmin.update(admin, params) do |operation, admin|
      if operation.saved?
        flash.success = "The record has been updated"
        redirect Show.with(admin.id)
      else
        flash.failure = "It looks like the form is not valid"
        html EditPage, operation: operation, admin: admin
      end
    end
  end
end
