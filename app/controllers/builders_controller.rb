class BuildersController < ApplicationController
  def new
    @builder = Builder.new    
  end

  def create
    @builder = Builder.new(params[:builder])
    render :text => @builder.make
  end
end
