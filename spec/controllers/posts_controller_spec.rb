require 'rails_helper'

RSpec.describe PostsController, type: :controller do

	#------------Index Action------------#

	describe "GET #index" do
		it "should render the index page" do 
			get :index 
			expect(response).to render_template :index
		end 
	end

	#------------Show Action------------#

	describe "GET #show" do 
		it "should render the show page" do 
			post = FactoryGirl.create(:post)
			get :show, id: post.id
			expect(response).to render_template :show
		end
	end

	#------------New Action------------#

	describe "GET #new" do 
		it "renders the new page" do 
			get :new 
			expect(response).to render_template :new
		end
	end

	#------------Create Action------------#

	describe "POST #create" do 
		context "when the attributes are valid" do 
			it "creates a new post" do
				expect {
					post :create, post: FactoryGirl.attributes_for(:post)
				}.to change(Post, :count).by(1)
			end
		

			it "redirects to the root path" do
				post :create, post: FactoryGirl.attributes_for(:post)
				expect(response).to redirect_to root_path
			end
		end

		context "when the attributs are invalid" do 
			it "doesn't creates a new post" do 
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


	#------------Update Action------------#

	describe "PUT #update" do 
		post = FactoryGirl.create(:post)
		context "when attributes are valid" do
			it "updates the post" do 
				put :update, id: post.id, post: FactoryGirl.attributes_for(:post, title: 'New Title', author: 'Yankee')
				post.reload
				expect(post.title).to eq("New Title")
				expect(post.author).to eq("Yankee")
			end

			it "redirects to the root path" do 
				put :update, id: post.id, post: FactoryGirl.attributes_for(:post, title: 'New Title', author: 'Yankee')
				expect(response).to redirect_to root_path
			end
		end

			context "when attributes are invalid" do 
				post = FactoryGirl.create(:post)
				it "doesn't update the post" do 
					put :update, id: post.id, post: FactoryGirl.attributes_for(:post, title: 'New Title', author: 'Yankee', content: 'Hello!!!' )
					post.reload
					expect(post.title).to_not eq("New Title")
					expect(post.author).to_not eq("Yankee")
				end

				it "renders the edit template" do 
					put :update, id: post.id, post: FactoryGirl.attributes_for(:invalid_post)
					expect(response).to render_template :edit
				end

			end

	end

	#------------Destroy Action------------#

	describe "DELETE #destroy" do 
		it "deletes the post" do 
			post = FactoryGirl.create(:post)
			expect {
				delete :destroy, id: post.id
			}.to change(Post, :count).by(-1)
		end

		it "redirect_to root_path" do
			post = FactoryGirl.create(:post)
			delete :destroy, id: post.id
			expect(response).to redirect_to root_path
		end
	end
	
end
