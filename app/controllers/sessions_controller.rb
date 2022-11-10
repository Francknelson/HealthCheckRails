class SessionsController < ApplicationController
  def new
  end

  def create
    @person = User.authenticate(params[:session][:email], params[:session][:password])
    if @person.present?
      session[:user_id] = @person.id
      respond_to do |format|
        format.html { redirect_to "/", notice: "Você está logado." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to signin_path, notice: "Usuário/Senha incorreto." }
        format.json { head :no_content }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Você saiu."
    redirect_to "/"
  end
end
