require 'spec_helper'

describe Band do
  before {@band = Band.new(name: "Metallica",
                           place: "USA")}
  subject {@band}

  it {should respond_to(:name)}
  it {should respond_to(:place)}
  it {should respond_to(:genre)}
  it {should respond_to(:rate)}
  it {should respond_to(:rating_ct)}
  it {should respond_to(:review)}
  it {should respond_to(:biography)}
  it {should respond_to(:established_date)}

  it {should be_valid}

  describe "name is not present" do
    before {@band.name = " "}

    it {should_not be_valid}
  end
  describe "place is not present" do
    before {@band.place = " "}

    it {should be_valid}
  end
  describe "genre is not present" do
    before {@band.genre = " "}

    it {should be_valid}
  end
  describe "rate is not present" do
    before {@band.rate = " "}

    it {should be_valid}
  end
  describe "rating_ct is not present" do
    before {@band.rating_ct = " "}

    it {should be_valid}
  end
  describe "review not present" do
    before {@band.review = " "}

    it {should be_valid}
  end
  describe "biography is not present" do
    before {@band.biography = " "}

    it {should be_valid}
  end
  describe "established_date is not present" do
    before {@band.established_date = " "}

    it {should be_valid}
  end

  describe "name is too long" do
    before {@band.name = "a" * 51}

    it {should_not be_valid}
  end
end
