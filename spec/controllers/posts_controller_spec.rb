require 'rails_helper'

RSpec.describe PostsController, type: :controller do
	describe "POST #create" do 
		context "with valid attributes" do
			it "creates a new post" do 
				expect {
					post :create, post: FactoryGirl.attributes_for(:post)
				}.to change(Post, :count).by(1)
			end
			it "redirects the user to home page" do
				post :create, post: FactoryGirl.attributes_for(:post)
				expect(response).to redirect_to root_path
			end
		end

		context "with invalid attributes"
			it "doesn't create a new post" do 
				expect {
					post :create, post: FactoryGirl.attributes_for(:invalid_post)
				}.to change(Post, :count).by(0)
			
			end

			it "renders the new template" do 
				post :create, post: FactoryGirl.attributes_for(:invalid_post)
				expect(response).to render_template :new
			end
		end
	
end
