class Nurseries::IndexPage < MainLayout
  needs nurseries : NurseryQuery
  quick_def page_title, "All"

  def content
    h1 "All Nurseries"
    link "New Nursery", to: Nurseries::New.with(@current_user.organisation_id)
    render_nurseries
  end

  def render_nurseries
    ul do
      @nurseries.each do |nursery|
        li do
          link nursery.name, Nurseries::Show.with(@current_user.organisation_id, nursery)
        end
      end
    end
  end
end
