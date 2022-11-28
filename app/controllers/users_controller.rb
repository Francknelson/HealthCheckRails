class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /people or /people.json
  def index
    @users = User.search(params[:search])

    respond_to do |format|
      format.html

      format.pdf { render pdf: "articles-list-report",
                          footer: { center: "[page] of [topage]" }
      }
    end
  end

  # GET /people/1 or /people/1.json
  def show
  end

  # GET /people/new
  def new
    @user = User.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people or /people.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        @user.password = params[:user][:password]
        @user.save
        format.html { redirect_to "/", notice: "Usuário cadastrado com sucesso!" }
        session[:user_id] = @user.id if @current_user.nil?
      else
        format.html { redirect_to signup_path, notice: "Usuário não pode ser cadastrado." }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "Usuário atualizado com sucesso!" }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "Usuário excluído com sucesso!" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :last_name, :email, :password, :password_confirmation, :phone)
    end
end
