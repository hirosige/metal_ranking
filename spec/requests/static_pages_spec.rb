require 'spec_helper'

describe "StaticPages" do
  describe "Home Page" do
    it "should have the content 'Sample App'" do
      visit root_path
      expect(page).to have_content('Metal Ranking')
    end

    it "should have the title" do
      visit root_path
      expect(page).to have_title("Metal Ranking(tmp) | Home")
    end
  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit help_path
      expect(page).to have_content('Help')
    end

    it "should have the title" do
      visit help_path
      expect(page).to have_title("Metal Ranking(tmp) | Help")
    end
  end

  describe "About page" do

    it "should have the content 'About'" do
      visit about_path
      expect(page).to have_content('About Us')
    end

    it "should have the title" do
      visit about_path
      expect(page).to have_title("Metal Ranking(tmp) | About")
    end
  end

  describe "Contact page" do

    it "should have the content 'Contact'" do
      visit contact_path
      expect(page).to have_content('Contact')
    end

    it "should have the title" do
      visit contact_path
      expect(page).to have_title("Metal Ranking(tmp) | Contact")
    end
  end

end
