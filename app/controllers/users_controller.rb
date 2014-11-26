class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
 
  load_and_authorize_resource
  check_authorization
 # GET /users
  # GET /users.json
  def index
    @users = User.search(params[:search], params[:search_option]).order(:name_user).paginate(:per_page => 5, :page => params[:page])
    @evaluations = Evaluation.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @role = Role.new
    @user = User.new(user_params)
    @user.is_active_user = true
    @user.add_role "admin"
    
    respond_to do |format|
      if @user.save
        
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        format.json { render :index, status: :created, location: @user }

      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { render :index, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.is_active_user ? @user.is_active_user = false : @user.is_active_user = true
    respond_to do |format|
      @user.save
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name_user, :fub_registry, :siape_registry, :cost_center,
        :admission_date, :password, :password_confirmation,:role_ids,:user_id, :evaluation_ids => [])
    end
end
