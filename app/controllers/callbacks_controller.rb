class CallbacksController < ApplicationController
    def index
        oauth_data = request.env["omniauth.auth"]
        p oauth_data
    end
end
