require 'spec_helper'

describe "StaticPages" do
  describe "Home Page" do
    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Metal Ranking')
    end

    it "should have the title" do
      visit '/static_pages/home'
      expect(page).to have_title("Metal Ranking(tmp) | Home")
    end
  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    it "should have the title" do
      visit '/static_pages/help'
      expect(page).to have_title("Metal Ranking(tmp) | Help")
    end
  end

  describe "About page" do

    it "should have the content 'About'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end

    it "should have the title" do
      visit '/static_pages/about'
      expect(page).to have_title("Metal Ranking(tmp) | About")
    end
  end

end