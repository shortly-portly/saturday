class Admins::Create < BrowserAction
  route do
    SignUpAdmin.create(params, role: Role::Admin.to_i) do |operation, user|
      if user
        flash.success = "The record has been saved"
        admin = AdminQuery.new.user_id(user.id).first
        redirect Show.with(admin.id)
      else
        flash.failure = "It looks like the form is not valid"
        html NewPage, operation: operation
      end
    end
  end
end
