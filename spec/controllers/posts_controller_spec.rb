require 'rails_helper'

RSpec.describe PostsController, type: :controller do
	describe "GET #new" do 
		it "renders the new_template" do 
			get :new
			expect(response).to render_template :new
		end
	
	end

end
