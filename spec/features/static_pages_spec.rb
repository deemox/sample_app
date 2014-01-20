require 'spec_helper'

# A feature cannot be nested, but is synonymous with context and describe, which can be nested
feature "Static pages" do

 	subject { page }

 	shared_examples_for "all static pages" do
 		it { should have_selector('h1', text: heading) }
 		it { should have_title(full_title(page_title)) }
 	end

	context "Home page" do
		before { visit root_path }
		let(:heading)		{ 'Sample App' }
		let(:page_title) 	{ '' }

		it_should_behave_like "all static pages"
	 	it { should_not have_title('Home') }
	end

	context "Help page" do
		before { visit help_path }

		let(:heading)		{ 'Help' }
		let(:page_title) 	{ 'Help' }

		it_should_behave_like "all static pages"
	 	# it { should_not have_title('Help') } <-- fails due to substring match

	end

	context "About page" do
		before { visit about_path }

		let(:heading)		{ 'About Us' }
		let(:page_title) 	{ 'About' }

		it_should_behave_like "all static pages"
		# it { should_not have_title('About') } <-- fails due to substring match
	end

	context "Contact page" do
		before { visit contact_path }
		
		let(:heading)		{ 'Contact' }
		let(:page_title) 	{ 'Contact' }

		it_should_behave_like "all static pages"
	 	# it { should_not have_title('Contact') } <-- fails due to substring match

	end

	it "should have the right links on the layout" do
    	visit root_path
		click_link "Help"
    	expect(page).to have_title(full_title('Help'))
    	click_link "About"
    	expect(page).to have_title(full_title('About'))
    	click_link "Contact"
    	expect(page).to have_title(full_title('Contact'))
    	click_link "Home"
    	click_link "Sign up now!"
    	expect(page).to have_title(full_title('Sign Up'))
    	click_link "sample app"
    	expect(page).to have_title(full_title(''))
	end
end