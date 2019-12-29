class SignUpAdmin < User::SaveOperation
  param_key :user
  # Change password validations in src/operations/mixins/password_validations.cr
  include PasswordValidations

  permit_columns email
  attribute password : String
  attribute password_confirmation : String

  @_save_admin_op : SaveAdmin?

  def save_admin_op
    @_save_admin_op ||= SaveAdmin.new(params)
  end

  before_save do
    validate_uniqueness_of email
    Authentic.copy_and_encrypt password, to: encrypted_password
  end

  after_save create_admin

  private def create_admin(user : User)
    save_admin_op.user_id.value = user.id
    if !save_admin_op.save
      database.rollback
    end
  end
end
