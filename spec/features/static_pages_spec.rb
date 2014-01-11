require 'spec_helper'

# A feature cannot be nested, but is synonymous with context and describe, which can be nested
feature "Static pages" do

 	# Define base_title for all contexts and scenarios to reference (DRY) 
 	let(:base_title) { "Ruby on Rails Tutorial Sample App" }

	context "Home page" do

	 	scenario "should have the content 'Sample App'" do
	  		visit '/static_pages/home'
	  		expect(page).to have_content('Sample App')
		end

		scenario "should have the base title" do
			visit '/static_pages/home'
			expect(page).to have_title("#{base_title}")
		end

		scenario "should not have a custom page title" do
			visit '/static_pages/home'
			expect(page).not_to have_title('Home')
		end
	end

	context "Help page" do

		scenario "should have the content 'Help'" do
			visit '/static_pages/help'
			expect(page).to have_content('Help')
		end

		scenario "should have a base title" do
			visit '/static_pages/help'
			expect(page).to have_title("#{base_title}")
		end

		scenario "should not have a custom page title" do
			visit '/static_pages/help'
			expect(page).not_to have_title('Help')
		end
	end

	context "About page" do

		scenario "should have the content 'About Us'" do
			visit '/static_pages/about'
			expect(page).to have_content('About Us')
		end

		scenario "should have the base title" do
			visit '/static_pages/about'
			expect(page).to have_title("#{base_title}")
		end

		scenario "should not have a custom page title" do
			visit '/static_pages/about'
			expect(page).not_to have_title('About Us')
		end
	end

	context "Contact page" do

		scenario "should have the content 'Contact'" do
			visit '/static_pages/contact'
			expect(page).to have_content('Contact')
		end

		scenario "should have the base title" do
			visit '/static_pages/contact'
			expect(page).to have_title("#{base_title}")
		end

		scenario "should not have a custom page title" do
			visit '/static_pages/contact'
			expect(page).not_to have_title('Contact')
		end
	end
end