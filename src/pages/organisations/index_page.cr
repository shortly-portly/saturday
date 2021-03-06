class Organisations::IndexPage < MainLayout
  needs organisations : OrganisationQuery
  quick_def page_title, "All"

  def content
    div class: "alert alert-primary", role: "alert" do
      text "This is a primary div"
    end

    h1 "All Organisations"
    link "New Organisation", to: Organisations::New
    render_organisations
  end

  def render_organisations
    ul do
      @organisations.each do |organisation|
        li do
          link organisation.name, Organisations::Show.with(organisation)
        end
      end
    end
  end
end
