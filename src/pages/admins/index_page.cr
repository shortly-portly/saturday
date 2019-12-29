class Admins::IndexPage < MainLayout
  needs admins : AdminQuery
  quick_def page_title, "All"

  def content
    h1 "All Admins"
    link "New Admin", to: Admins::New
    render_admins
  end

  def render_admins
    ul do
      @admins.each do |admin|
        li do
          link admin.first_name, Admins::Show.with(admin)
        end
      end
    end
  end
end
