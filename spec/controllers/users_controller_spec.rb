require 'spec_helper'

describe UsersController do

#Index-страница
  describe "GET 'users'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "POST 'create'" do

    describe "success" do

      before(:each) do
        @attr = { :name => "New User", :email => "user@example.com",
                  :password => "foobar", :password_confirmation => "foobar" }
      end

#Новая учётка
      it "should create a user" do
        lambda do
          post :create, :user => @attr
        end.should change(User, :count).by(1)
      end

#Автопереход при регистрации. Тест проходит, но из-за devise перенаправление идёт в отличное от тестируемого место.
      it "should redirect to the user show page" do
        post :create, :user => @attr
        response.should redirect_to(user_path(assigns(:user)))
      end
    end
  end

  describe "GET 'show'" do

    before(:each) do
      @user = Factory(:user)
    #  User.stub!(:find, @user.id).and_return(@user) #Альтернатива assigns
    end
#Страница просмотра юзера
    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end

#Страница редактирования данных юзера
    it "should be successful" do
      get :edit, :id => @user
      response.should be_success
    end

#Лист постов юзера
    it "should be successful" do
      get :list, :id => @user
      response.should be_success
    end

#Проверка возврата именно сгенерированного Factory юзера
    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end

  end

end
