require 'spec_helper'

# A feature cannot be nested, but is synonymous with context and describe, which can be nested
feature "Static pages" do

 	# Define base_title for all contexts and scenarios to reference (DRY) 
 	let(:base_title) { "Ruby on Rails Tutorial Sample App" }
 	subject { page }

	context "Home page" do
		before { visit root_path }

	 	it { should have_content('Sample App') }
	 	it { should have_title(full_title('')) }
	 	it { should_not have_title('Home') }

	end

	context "Help page" do
		before { visit help_path }

		it { should have_content('Help') }
	 	it { should have_title(full_title('Help')) }

	end

	context "About page" do
		before { visit about_path }

		it { should have_content('About Us') }
		it { should have_title(full_title('About')) }
	end

	context "Contact page" do
		before { visit contact_path }

		it { should have_content('Contact') }
	 	it { should have_title(full_title('Contact')) }

	end
end