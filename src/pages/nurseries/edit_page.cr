class Nurseries::EditPage < MainLayout
  needs operation : SaveNursery
  needs nursery : Nursery
  quick_def page_title, "Edit"

  def content
    h1 "Edit"
    render_nursery_form(@operation)
  end

  def render_nursery_form(op)
    form_for Nurseries::Update.with(@current_user.organisation_id, @nursery.id) do
      mount Shared::Field.new(op.name), &.text_input(autofocus: "true")

      submit "Update", data_disable_with: "Updating..."
    end
  end
end
