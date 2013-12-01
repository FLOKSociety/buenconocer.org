class PagesController < ApplicationController

  #http_basic_authenticate_with name: "conocer", password: "conocer"

  def index
  	@signer = Signer.new
  end

  def sign_manifesto
  	@signer = Signer.new(signer_params)
  	if @signer.save
  		flash[:notice] = "Gracias por firmar el manifiesto"
  		redirect_to signed_url
  	else
  		flash[:error] = "Revisa los datos introducidos en el formulario"
  		render :index
  	end
  end

  def signed
  end

  private

  def signer_params
  	params.require(:signer).permit(:name, :email, :url, :collective, :state, :comment)
  end
end
