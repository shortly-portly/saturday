class Nurseries::Show < BrowserAction
  get "/organisations/:organisation_id/nurseries/:nursery_id" do
    html ShowPage, nursery: NurseryQuery.find(nursery_id)
  end
end
