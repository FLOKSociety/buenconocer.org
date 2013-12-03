class Mailman < ActionMailer::Base

  default from: "hola@buenconocer.org"

  def send_message_to_validate_sign(signer)
  	@signer = signer
    subject = "[BuenConocer] Por favor, valida tu adhesión al manifiesto"
    mail :to => @signer.email, :subject => subject
  end
end
