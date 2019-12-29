class Admins::Index < BrowserAction
  route do
    html IndexPage, admins: AdminQuery.new
  end
end
