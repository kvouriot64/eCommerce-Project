# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :initialize_session
  before_action :load_cart
  def index
    @products = Product.order(:product_name).page params[:page]
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @products = Product.where(product_name: params[:search]).or("description LIKE #{params[:search]}")
  end

  def load_cart
    @cart = Product.find(session[:cart])
  end

  def add_to_cart
    session[:cart] << params[:id]
    redirect_to root_path
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_to root_path
  end

  def initialize_session
    session[:cart] ||= []
  end
end
