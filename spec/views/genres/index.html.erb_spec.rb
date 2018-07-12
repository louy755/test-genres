require 'rails_helper'

RSpec.describe "genres/index", type: :view do
  before(:each) do
    assign(:genres, [
      Genre.create!(
        :name => "Name"
      ),
      Genre.create!(
        :name => "Name2"
      )
    ])
    Genre.all.each { |genre| genre.url.attach(io: File.open('tmp/storage.pdf'), filename: 'storage.pdf') }
  end

  it "renders a list of genres" do
    render

    expect(rendered).to have_css("center > h1", :text => "NAME")
    expect(rendered).to have_css("center > h1", :text => "NAME2")
  end
end
