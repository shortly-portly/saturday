class Organisations::NewPage < MainLayout
  needs operation : SaveOrganisation
  quick_def page_title, "New"

  def content
    h1 "New"
    render_organisation_form(@operation)
  end

  def render_organisation_form(op)
    form_for Organisations::Create do
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

      submit "Save", data_disable_with: "Saving..."
    end
  end
end
