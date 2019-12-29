class Nurseries::NewPage < MainLayout
  needs operation : SaveNursery
  quick_def page_title, "New"

  def content
    h1 "New"
    render_nursery_form(@operation)
  end

  def render_nursery_form(op)
    form_for Nurseries::Create do
      mount Shared::Field.new(op.name), &.text_input(autofocus: "true")

      submit "Save", data_disable_with: "Saving..."
    end
  end
end
