class PlayersController < ApplicationController
  before_action :set_player, only: [:show, :update, :destroy]

  # GET /players
  def index
    @players = Player.all
    render json: @players
  end

  def login
    @player = Player.find_by_username player_params[:username]
    
    if @player and @player.authenticate(player_params[:password])
      render json: {
        token: @player.token
      }, status: 200
    else 
      render json: {
        errors: "No such username or password"
      }, status: :forbidden
    end
  end

  # GET /players/1
  def show
    render json: @player
  end

  # POST /players
  def create
    @player = Player.new(player_params)

    if @player.save
      render json: {
        username: @player.username,
        token: @player.token
      }, status: :created
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /players/1
  def update
    if @player.update(player_params)
      render json: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  # DELETE /players/1
  def destroy
    @player.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def player_params
      params.require(:player).permit(:username, :password, :password_confirmation)
    end
end
