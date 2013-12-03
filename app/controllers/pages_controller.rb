class PagesController < ApplicationController

  def index
  	@signer = Signer.new
  end

  def sign_manifesto
  	@signer = Signer.new(signer_params)
  	if @signer.save
      Mailman.send_message_to_validate_sign(@signer).deliver
  		redirect_to unverified_url
  	else
  		render :index
  	end
  end

  def unverified
  end

  def verify
    signer = Signer.where(:code => params[:code]).first
    if signer
      signer.validated = true
      signer.code = nil
      signer.save
      redirect_to signed_url
    else
      redirect_to fail_url
    end
  end

  def signed
  end

  def fail
  end

  private

  def signer_params
  	params.require(:signer).permit(:name, :email, :url, :collective, :state, :comment)
  end
end
