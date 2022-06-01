class ProfileController < ApplicationController

  before_action :authenticate_user!, only: %i[ index show ]
  def index
    @cats = current_user.cats
  end
end
