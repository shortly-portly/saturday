class Admins::Create < BrowserAction
  post "/organisation/:organisation_id/admin/new" do
    puts "Organisation id is #{organisation_id}"
    organisation = OrganisationQuery.find(organisation_id)
    SignUpAdmin.create(params, role: Role::Admin.to_i, organisation_id: organisation.id) do |operation, user|
      if user
        flash.success = "The record has been saved"
        admin = AdminQuery.new.user_id(user.id).first
        redirect Show.with(admin.id)
      else
        flash.failure = "It looks like the form is not valid"
        html NewPage, operation: operation, organisation: organisation
      end
    end
  end
end
