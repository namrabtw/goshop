class CartsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_or_create_cart

  def index
    @cart_items = @cart.cart_items
  end

  def add
    @cart.cart_items.create(product_id: params[:product])

    redirect_to '/cart'
  end

  def checkout
    current_user.pay_and_checkout!(@cart)

    redirect_to carts_path(@cart)
  end

  def show
    @checked_out_cart = current_user.carts.where(id: params[:id], checked_out: true).last

    redirect_to root_path if @checked_out_cart.nil?
  end

  private

  def find_or_create_cart
    @cart = current_user.carts.where(checked_out: false).last

    if @cart.nil?
      @cart = current_user.carts.create
    end
  end

end