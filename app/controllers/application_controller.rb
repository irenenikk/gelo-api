class ApplicationController < ActionController::API

    def authorize
        @current_user = Player.find_by_token request.headers["Authorization"]
        render json: { error: 'Not Authorized' }, status: 401 unless @current_user        
    end

    def current_user
        Player.find_by_token request.headers["Authorization"]        
    end

    def authorize_self 
        g = Game.find(params[:id])
        unless g.has_player?(current_user) and g.added_by != current_user
            render json: { error: "Not your game to confirm" }, status: :forbidden 
        end
    end
end