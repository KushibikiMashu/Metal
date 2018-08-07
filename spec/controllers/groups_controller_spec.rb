require "rails_helper"

RSpec.describe UsersController do

    describe 'POST #search' do
      before do
      	post :search
      end
      context 'グループ名がDBにある場合' do
        it "@resultに検索結果を割り当てる" 
        it "searchテンプレートを表示すること" 
      end
      context 'グループ名がDBにない場合' do
        it "検索結果がありませんでしたと表示する" 
        it "searchテンプレートを表示すること" 
      end
    end

end