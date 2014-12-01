class PermissionsController < ApplicationController
  authorize_resource class: false
  def index
    @user = User.all
  
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    logger.info "Entrou update #{@user.name_user}"

     params[:user][:role_ids] ||= []

    if @user.update_attributes(user_params)
      sign_in(@user, :bypass => true) if @user == current_user
      redirect_to permissions_path, :flash => { :success => 'User was successfully updated.' }
       logger.info "Entrou If #{@user.name_user}"
    else
      format.html { render 'edit' }
      logger.info "Entrou Else"
    end
  end
  private
  def user_params
      params.require(:user).permit(:name_user, :fub_registry, :siape_registry, :cost_center,
        :admission_date, :password, :password_confirmation,:roles,:user_id,:role_ids => [])
    end


end
