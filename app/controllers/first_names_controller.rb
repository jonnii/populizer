class FirstNamesController < ApplicationController
  def random
    respond_to do |f|
      f.json { render :json => Faker::Name.first_name }
    end
  end
end
