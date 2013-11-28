class PagesController < ApplicationController

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
  	render :text => "Gracias por firmar el manifiesto"
  end

  private

  def signer_params
  	params.require(:signer).permit(:name, :email, :collective, :state, :comment)
  end
end
