class Admins::Edit < BrowserAction
  route do
    admin = AdminQuery.find(admin_id)
    html EditPage,
      operation: SaveAdmin.new(admin),
      admin: admin
  end
end
