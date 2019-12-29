class Admins::ShowPage < MainLayout
  needs admin : Admin
  quick_def page_title, @admin.first_name

  def content
    link "Back to all Admins", Admins::Index
    h1 @admin.first_name
    render_actions
    render_admin_fields
  end

  def render_actions
    section do
      link "Edit", Admins::Edit.with(@admin.id)
      text " | "
      link "Delete",
        Admins::Delete.with(@admin.id),
        data_confirm: "Are you sure?"
    end
  end

  def render_admin_fields
    ul do
      li do
        text "first_name: "
        strong @admin.first_name.to_s
      end
    end
  end
end
