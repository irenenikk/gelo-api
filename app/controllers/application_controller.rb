class ApplicationController < ActionController::API

    def authorize
        @current_user = Player.find_by_token request.headers["Authorization"]
        render json: { error: 'Not Authorized' }, status: 401 unless @current_user        
    end

    def current_user
        Player.find_by_token request.headers["Authorization"]        
    end
end