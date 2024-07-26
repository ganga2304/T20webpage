class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :show]
  before_action :authorize, only: [:show, :create, :update, :destroy]


  def index
    @teams = Team.all
  end

  def show

  end

  def new
    @team = Team.new
  end

  def edit

  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to @team
      else
        render :new,status:422
      end

  end

  def update
    if @team.update(team_params)
      redirect_to @team
      else
        render :edit,status:422
      end
  end

  def destroy
    @team.destroy
    redirect_to teams_path

  end
  def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:name, :country, :founded, :description)
    end
  def authorize
    @team = Team.find(params[:id])
    authorize @team
    
  end
end

# app/controllers/teams_controller.rb
class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :update, :destroy]
  before_action :log_request, only: [:create, :update, :destroy]
  before_action :calculate_time_taken, only: [:create, :update, :destroy]
  before_action :authorize_user, only: [:create, :update, :destroy]

  def create
    # ...
  end

  def update
    # ...
  end

  def destroy
    # ...
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def log_request
    logger.info "#{action_name} request made on #{Time.zone.now}"
  end

  def calculate_time_taken
    start_time = Time.zone.now
    yield
    end_time = Time.zone.now
    total_time_taken = end_time - start_time
    logger.info "Time taken to perform #{action_name} action: #{total_time_taken} seconds"
  end

  def authorize_user
    unless current_user.admin? || current_user.manager?
      flash[:alert] = "You are not authorized to perform this action"
      redirect_to root_path
    end
  end
end