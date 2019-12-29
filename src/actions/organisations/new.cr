class Organisations::New < BrowserAction
  route do
    html NewPage, operation: SaveOrganisation.new
  end
end
