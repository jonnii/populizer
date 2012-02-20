class NamesController < ApplicationController
  def random
    respond_to do |f|
      f.json { render :json => Faker::Name.name }
    end
  end
end
