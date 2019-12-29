class Organisations::Create < BrowserAction
  route do
    SaveOrganisation.create(params) do |operation, organisation|
      if organisation
        flash.success = "The record has been saved"
        redirect Show.with(organisation.id)
      else
        flash.failure = "It looks like the form is not valid"
        html NewPage, operation: operation
      end
    end
  end
end
