require 'spec_helper'

describe NamesController do
  describe "on GET :random" do
    before(:each) do
      get :random, :format => :json
    end

    it do
      should respond_with(:success)
    end
  end
end
