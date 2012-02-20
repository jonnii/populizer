require 'spec_helper'

describe NamesController do
  describe "on GET :index" do
    before(:each) do
      get :index, :format => :json
    end

    it do
      should respond_with(:success)
    end
  end
end
