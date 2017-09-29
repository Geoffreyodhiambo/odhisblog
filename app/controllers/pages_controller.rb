class PagesController < ApplicationController
	def about
		@title = 'About Us';
		@content = 'this is our about page ';
	end
end
