require 'rails_helper'

RSpec.describe PostsController, type: :controller do
	describe "GET #edit" do 
		it "renders the edit template" do 
			post = FactoryGirl.create(:post)
			get :edit, id: post.id
			expect(response).to render_template :edit
		end

	end
	
end
