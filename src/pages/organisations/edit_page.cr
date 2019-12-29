class Organisations::EditPage < MainLayout
  needs operation : SaveOrganisation
  needs organisation : Organisation
  quick_def page_title, "Edit"

  def content
    h1 "Edit"
    render_organisation_form(@operation)
  end

  def render_organisation_form(op)
    form_for Organisations::Update.with(@organisation.id) do
      mount Shared::Field.new(op.name), &.text_input(autofocus: "true")
      mount Shared::Field.new(op.address_line_1), &.text_input
      mount Shared::Field.new(op.address_line_2), &.text_input
      mount Shared::Field.new(op.city), &.text_input
      mount Shared::Field.new(op.county), &.text_input
      mount Shared::Field.new(op.postcode), &.text_input
      mount Shared::Field.new(op.country), &.text_input
      mount Shared::Field.new(op.telephone), &.text_input
      mount Shared::Field.new(op.email), &.text_input
      mount Shared::Field.new(op.website), &.text_input

      submit "Update", data_disable_with: "Updating..."
    end
  end
end
