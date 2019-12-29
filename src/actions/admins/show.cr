class Admins::Show < BrowserAction
  route do
    html ShowPage, admin: AdminQuery.find(admin_id)
  end
end
