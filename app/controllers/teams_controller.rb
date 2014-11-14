class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  check_authorization
  def index
    @teams = []

    verify_exist_teams
    verify_new_users

    @teams = Team.all
  end

  def show
    @team = Team.find( params[:id] )
  end

  def new
    @team = Team.new
  end

  def edit
  end

  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
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
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
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
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  CONFIRMED = true
  NOT_CONFIRMED = false

  def confirm_team
    teams_index = Team#index
    team = Team.find( params[:team_id] )

    team.is_confirm = CONFIRMED
    team.save

    redirect_to teams_index
  end

  def not_confirm_team
    teams_index = Team#index
    team = Team.find( params[:team_id] )

    team.is_confirm = NOT_CONFIRMED
    team.save

    redirect_to teams_index
  end

  private
    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:leader, :members, :workplace, :is_confirm, :user_ids => [])
    end

    def verify_exist_teams
      if Team.all.empty?
        initialize_teams
      else
        # Nothing To Do
      end
    end

    def verify_new_users
      actual_users = User.all

      qtd_allocated_users = select_users_with_team.size
      qtd_users = actual_users.size

      if !qtd_allocated_users.equal? qtd_users
        destroy_teams

        initialize_teams
      else
        # Nothing To Do
      end
    end

    def initialize_teams
      users = User.all

      mount_teams( users )
    end

    def mount_teams( users )
      while( !users.empty? )
        workplace = users.at( 0 ).cost_center

        team = Team.create( :workplace => workplace )
        team.initialize_team

        users = select_users_without_team( users, workplace )
      end
    end

    def select_users_without_team( users, workplace )
      users = users.select do |user|
        user.cost_center != workplace
      end

      users
    end

    def select_users_with_team
      allocated_users = []
      teams = Team.all

      teams.each do |team|
        members = team.users

        members.each do |member|
          allocated_users << member
        end
      end

      allocated_users
    end

    def destroy_teams
      Team.all.destroy_all   
    end
end
