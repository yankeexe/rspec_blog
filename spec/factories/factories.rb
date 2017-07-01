FactoryGirl.define do
	factory :post do 
		title "post title"
		author "simmons"
		content "YOLO semiotics coloring book, chartreuse 3 wolf moon tote bag lomo migas vice sartorial sriracha. Drinking vinegar four dollar toast meditation lomo letterpress, banh mi literally selfies actually art party tbh jianbing ugh you probably haven't heard of them distillery. Beard flexitarian chartreuse asymmetrical slow-carb. Cray ennui taxidermy enamel pin health goth. Hammock iceland sriracha microdosing roof party pitchfork etsy man bun flexitarian typewriter umami. Hexagon food truck biodiesel listicle."
	end

	factory :invalid_post, :class => "Post" do #to show :invalid_post belongs to Post Class 
		content "Short Content"
	end

end
