class LastNamesController < ApplicationController
  def random
    respond_to do |f|
      f.json { render :json => Faker::Name.last_name }
    end
  end
end
