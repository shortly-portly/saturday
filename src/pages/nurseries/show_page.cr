class Nurseries::ShowPage < MainLayout
  needs nursery : Nursery
  quick_def page_title, @nursery.name

  def content
    link "Back to all Nurseries", Nurseries::Index
    h1 @nursery.name
    render_actions
    render_nursery_fields
  end

  def render_actions
    section do
      link "Edit", Nurseries::Edit.with(@current_user.organisation_id, @nursery.id)
      text " | "
      link "Delete",
        Nurseries::Delete.with(@current_user.organisation_id, @nursery.id),
        data_confirm: "Are you sure?"
    end
  end

  def render_nursery_fields
    ul do
      li do
        text "name: "
        strong @nursery.name.to_s
      end
    end
  end
end
