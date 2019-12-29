class Admins::EditPage < MainLayout
  needs operation : SaveAdmin
  needs admin : Admin
  quick_def page_title, "Edit"

  def content
    h1 "Edit"
    render_admin_form(@operation)
  end

  def render_admin_form(op)
    form_for Admins::Update.with(@admin.id) do
      mount Shared::Field.new(op.first_name), &.text_input(autofocus: "true")

      submit "Update", data_disable_with: "Updating..."
    end
  end
end
