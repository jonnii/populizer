class BuildersController < ApplicationController
  def new
    sample = [{
      :firstname => 'first_name',
      :lastname => 'last_name'
    }]

    @builder = Builder.new(:prototype => sample.to_json)
  end

  def create
    @builder = Builder.new(params[:builder])
    
    

    render :text => @builder.make
  end
end
