class Admins::NewPage < MainLayout
  needs operation : SignUpAdmin
  quick_def page_title, "New"

  def content
    h1 "New"
    render_admin_form(@operation)
  end

  def render_admin_form(op)
    form_for Admins::Create do
      mount Shared::Field.new(op.save_admin_op.first_name), &.text_input(autofocus: "true")
      mount Shared::Field.new(op.save_admin_op.last_name)

      mount Shared::Field.new(op.email)
      mount Shared::Field.new(op.password), &.password_input
      mount Shared::Field.new(op.password_confirmation), &.password_input

      submit "Save", data_disable_with: "Saving..."
    end
  end
end
