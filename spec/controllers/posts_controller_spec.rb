require 'spec_helper'

describe PostsController do

#Index-страница
  describe "GET 'posts'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "POST 'create'" do

    describe "success" do

      before(:each) do
        @attr = { :title => "New title's post", :text => "New text's post", 
                  :user_id => '1' }
      end

#Новый пост
      it "should create a post" do
        lambda do
          post :create, :post => @attr
        end.should change(Post, :count).by(1)
      end

#Ошибка пустого заполнения поста
      it "should not make a new post" do
       lambda do
        visit new_post_path
        fill_in "Title",       :with => ""
        fill_in "Text",        :with => ""
        fill_in "Tags",        :with => ""
        click_button
        response.should render_template('posts/new')
        response.should have_selector("div#error_explanation")
       end.should_not change(User, :count)
      end

    end
  end

  describe "GET 'show'" do

    before(:each) do
      @post = Factory(:post)
    end

#Страница просмотра поста
    it "should be successful" do
      get :show, :id => @post
      response.should be_success
    end

#Страница редактирования поста, провальный, не авторизован
    it "should be successful" do
      get :edit, :id => @post
      response.should be_success
    end

#Проверка возврата именно сгенерированного Factory
    it "should find the right post" do
      get :show, :id => @post
      assigns(:post).should == @post
    end

  end

end
