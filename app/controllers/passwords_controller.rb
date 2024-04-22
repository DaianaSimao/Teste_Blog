class PasswordsController < ApplicationController
  before_action :authenticate_user!

  def edit
  end

  def update
    if current_user.update_with_password(password_params)
      sign_in current_user, bypass: true
      redirect_to root_path, notice: I18n.t('passwords.senha_alterada')
    else
      render(action: :edit, status: :unprocessable_entity)
    end
  end

  private

  def password_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end
end
