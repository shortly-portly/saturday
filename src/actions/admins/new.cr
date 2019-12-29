class Admins::New < BrowserAction
  route do
    html NewPage, operation: SignUpAdmin.new
  end
end
