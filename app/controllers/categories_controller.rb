# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :load_cart
  def show
    @category = Category.find(params[:id])
  end

  def load_cart
    @cart = Product.find(session[:cart])
  end
end
