class UserMailer < ActionMailer::Base
  def reset_password_instructions(record, token, opts = {})
    locale = I18n.locale
    binding.pry
    @token = token
    @resource = record
    subject = if locale == :pt
                'Instruções para Redefinir a Senha'
              elsif locale == :en
                'Instructions to Reset Your Password'
              else
                'Reset Password Instructions'
              end

    mail(to: record.email, subject: subject, **opts) do |format|
      if locale == :pt
        format.html { render "reset_password_instructions" }
      elsif locale == :en
        format.html { render "reset_password_instructions_en" }
      else
        # Renderiza uma versão padrão ou adiciona lógica adicional aqui
        format.html { render "reset_password_instructions" }
      end
    end
  end
end
