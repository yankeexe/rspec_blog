require 'rails_helper'

RSpec.describe PostsController, type: :controller do
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
	
end
