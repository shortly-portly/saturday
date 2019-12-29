class SaveAdmin < Admin::SaveOperation
  permit_columns first_name, last_name
end
