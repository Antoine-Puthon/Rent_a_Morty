class My::MortiesController < ApplicationController 
    def index 
        @morties = current_user.morties
    end
end