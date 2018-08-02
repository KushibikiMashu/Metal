require "rails_helper"

RSpec.describe UsersController do
    describe 'GET #index' do
      before do
      	get :index
      end
      it "indexテンプレートを表示すること" do
        expect(response).to render_template :index
      end
    end

    describe 'GET #new' do
      before do
      	get :new
      end
      it "newテンプレートを表示すること" do
        expect(response).to render_template :new
      end
    end

    describe 'POST #create' do
      before do
      	get :create
      end
      context 'パスワードが一致している場合' do
      	context 'ユーザーが作成された場合' do
      		it 'データベースにユーザーが登録されていること'
			it 'セッションにユーザーIDを持つこと'
      		it 'indexテンプレートを表示すること'
      	end
      	context 'ユーザーが作成されなかった場合' do
    	    it "データベースにユーザーが登録されないこと"
    	    it "newテンプレートを表示すること" 
  		end
  	  end
      it "newテンプレートを表示すること" 
    end

    describe 'POST #login' do
      before do
      	get :login
      end
      context 'ユーザーが存在する場合' do
    	it '@userにユーザーを割り当てること'
        it 'セッションにユーザーIDを持つこと'
    	it 'indexテンプレートを表示すること'
      end
      context 'ユーザーが存在しなかった場合' do
  	    it "login_formテンプレートを表示すること" 
  	  end
    end

    describe 'GET #login_form' do
      before do
      	get :login_form
      end
      it "login_formテンプレートを表示すること" do
        expect(response).to render_template :login_form
      end
    end

    describe 'POST #logout' do
      before do
      	get :logout
      end
      it "login_formテンプレートを表示すること" do
        expect(response).to render_template :login_form
      end
    end
end