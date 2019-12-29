class Nurseries::New < BrowserAction
  get "/organisations/:organisation_id/nursies/new" do
    html NewPage, operation: SaveNursery.new
  end
end
