class User < ApplicationRecord
  authenticates_with_sorcery!

  attr_accessor :password, :password_confirmation

 # validates_presence_of :email, message: "Please use your Lionmail"
  validates_format_of :email, message: "Wrong Format,please use your Lionmail", 
  with: /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/

  validates :email, uniqueness: true

  validates_presence_of :password, message: "Pwd should not be empty", 
    if: :need_validate_password
  validates_presence_of :password_confirmation, message: "pwd should not be empty",
    if: :need_validate_password
  validates_confirmation_of :password, message: "password not same",
    if: :need_validate_password

  def username
  	self.email.split('@').first
  end

  private
  def need_validate_password
    self.new_record? || 
      (!self.password.nil? || !self.password_confirmation.nil?)
  end
end
