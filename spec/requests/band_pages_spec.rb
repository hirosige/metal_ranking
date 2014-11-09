require 'spec_helper'

describe "Band pages", :js => true do

  subject { page }

  describe "index" do

    let(:user) { FactoryGirl.create(:user)}

    before do
      sign_in user
      visit bands_path
      page.save_screenshot(Rails.root + 'spec/screenshots/init_screen.gif')
    end

    it { should have_title(full_title('Band List')) }
    it { should have_content('バンド一覧') }

    it "should list each band" do
      Band.all.each do |band|
        expect(page).to have_selector('td', text: band.name)
      end
    end

    describe "pagination" do

      before(:all) {32.times { FactoryGirl.create(:band)}}
      after(:all)  {Band.delete_all}

      it { should have_selector('div.pagination') }

      it "should list each user" do
        Band.paginate(page: 1).each do |band|
          expect(page).to have_selector('td', text: band.name)
          expect(page).to have_selector('td', text: band.place)
          expect(page).to have_selector('td', text: band.rate)
          expect(page).to have_selector('td', text: band.rating_ct)
          expect(page).to have_selector('td', text: band.review)
          expect(page).to have_selector('td', text: band.biography)
        end
      end
    end

    describe "show pages" do
      let(:band) { FactoryGirl.create(:band)}

      before do
        visit band_path(band)
        page.save_screenshot(Rails.root + 'spec/screenshots/show_page.gif')
      end
      after {}

      it "should list each user" do
        expect(page).to have_content(band.name)
      end
    end

    # describe "pagination" do
    #
    #   before(:all) { 30.times { FactoryGirl.create(:user) } }
    #   after(:all)  { User.delete_all }
    #
    #   it { should have_selector('div.pagination') }
    #
    #   it "should list each user" do
    #     User.paginate(page: 1).each do |user|
    #       expect(page).to have_selector('li', text: user.name)
    #     end
    #   end
    # end
  end
end
