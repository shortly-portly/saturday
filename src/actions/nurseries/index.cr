class Nurseries::Index < BrowserAction
  route do
    html IndexPage, nurseries: NurseryQuery.new
  end
end
