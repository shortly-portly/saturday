class Nurseries::Edit < BrowserAction
  get "/organisations/:organisation_id/nurseries/:nursery_id/edit" do
    nursery = NurseryQuery.find(nursery_id)
    html EditPage,
      operation: SaveNursery.new(nursery),
      nursery: nursery
  end
end
