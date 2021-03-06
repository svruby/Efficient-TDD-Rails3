class UsersController < ApplicationController

  def index
    @users = User.all
    respond_to do |fmt|
      fmt.html { render :index }
      fmt.json { render :json => @users }
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @user.shipping_addresses.build
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to(@user, :notice => 'User was successfully created.')
    else
      render "new"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to(@user, :notice => 'User was successfully updated.')
    else
      render "edit"
    end
  end

end
