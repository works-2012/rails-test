require 'spec_helper'

describe UsersController do

#Index-страница
  describe "GET 'tags'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  before(:each) do
    @tag = Factory(:tag)
  end

#Лист постов с тэгами
    it "should be successful" do
      get :list, :id => @tag
      response.should be_success
    end

end
