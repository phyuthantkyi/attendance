class UserController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :new, :home, :destroy]
  
  def home
  
  end

  def new

  end

  def edit

  end

  def home
  end
end
