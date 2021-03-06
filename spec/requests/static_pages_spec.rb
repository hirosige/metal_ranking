require 'spec_helper'

describe "StaticPages" do
  describe "Home Page" do
    it "should have the content 'Sample App'" do
      visit root_path
      expect(page).to have_content('Metal Ranking')
    end

    it "should have the title" do
      visit root_path
      expect(page).to have_title("Metal Ranking(tmp)")
    end

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end
    end

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem")
        FactoryGirl.create(:micropost, user: user, content: "Ipsum")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end

      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end

        it { expect(page).to have_content('0 following') }
        it { expect(page).to have_content('1 followers') }
      end
    end
  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit help_path
      expect(page).to have_content('Help')
    end

    it "should have the title" do
      visit help_path
      expect(page).to have_title(full_title('Help'))
    end
  end

  describe "About page" do

    it "should have the content 'About'" do
      visit about_path
      expect(page).to have_content('About Us')
    end

    it "should have the title" do
      visit about_path
      expect(page).to have_title(full_title('About'))
    end
  end

  describe "Contact page" do

    it "should have the content 'Contact'" do
      visit contact_path
      expect(page).to have_content('Contact')
    end

    it "should have the title" do
      visit contact_path
      expect(page).to have_title(full_title('Contact'))
    end
  end

  describe "Band page" do

    it "should have the content 'Contact'" do
      visit bands_path
      expect(page).to have_content('バンド一覧')
    end

    it "should have the title" do
      visit bands_path
      expect(page).to have_title(full_title('Band List'))
    end
  end

end
