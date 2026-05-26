# frozen_string_literal: true

# Handles public user profiles.
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
end
