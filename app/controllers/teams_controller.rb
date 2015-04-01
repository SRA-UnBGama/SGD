class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  check_authorization
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find( params[:id] )
  end

  def new
    @team = Team.new
  end

  def edit
    teams_index = Team#index
    team = Team.find( params[:team_id] )

    team.is_confirm = CONFIRMED
    team.save

    redirect_to teams_index
  end

  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Equipe criada com sucesso.' }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @team.update(team_params)

    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Equipe atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Equipe excluida com sucesso.' }
      format.json { head :no_content }
    end
  end

  CONFIRMED = true
  NOT_CONFIRMED = false

  def confirm_team
    teams_index = Team#index
    team = Team.find( params[:team_id] )
    if team.is_confirm == CONFIRMED
      team.is_confirm = NOT_CONFIRMED
    else
      team.is_confirm = CONFIRMED
    end
    team.save
    redirect_to teams_index
  end

  private
    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:leader, :members, :workplace, :is_confirm, :user_ids => [],
        :child_teams_ids => [])
    end
end