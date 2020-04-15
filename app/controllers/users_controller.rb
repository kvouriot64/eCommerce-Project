# frozen_string_literal: true

class UsersController < ApplicationController
  protect_from_forgery with: :exception

  def show
    @user = User.find(params[:id])
  end

  def login; end

  def register; end
end
