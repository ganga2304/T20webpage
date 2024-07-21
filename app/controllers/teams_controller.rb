class TeamsController < ApplicationController
    before_action :set_team, only: [:show, :edit, :update, :destroy]
    def index
        @teams = Team.all
    end
    def show

    end
    def new
        @team = Team.new
    end
    def create
        @team = Team.new(team_params)
        if @team.save
            flash[:notice] = "team was created successfully."
            redirect_to team_path(@team)
        else
            render :new, status: :unprocessable_entity
        end
    end
    def edit
    end
    def update
       if @team.update(team_params)
            flash[:notice] = "team was updated successfully."
               redirect_to team_path(@team)
        else
            render :edit, status: :unprocessable_entity
        end
    end
    def destroy
    end
    private
    def set_team
        @team = Team.find(params[:id])
    end
    def team_params
        params.require(:team).permit(:name,:country,:founded,:description)
    end
end
