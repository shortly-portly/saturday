class Organisations::ShowPage < MainLayout
  needs organisation : Organisation
  quick_def page_title, @organisation.name

  def content
    link "Back to all Organisations", Organisations::Index
    h1 @organisation.name
    render_actions
    render_organisation_fields
  end

  def render_actions
    section do
      link "Edit", Organisations::Edit.with(@organisation.id)
      text " | "
      link "Create Admin", Admins::New.with(@organisation.id)
      text " | "
      link "Create Nursery", Nurseries::New.with(@organisation.id)
      text " | "
      link "Delete",
        Organisations::Delete.with(@organisation.id),
        data_confirm: "Are you sure?"
    end
  end

  def render_organisation_fields
    ul do
      li do
        text "name: "
        strong @organisation.name.to_s
      end
    end
  end
end
