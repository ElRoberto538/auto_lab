class IndexController < ApplicationController
  before_filter :authenticate_user!, only: :index

  def show
    render 'index/index'
  end
end
