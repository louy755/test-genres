require 'rails_helper'

RSpec.describe "genres/show", type: :view do
  before(:each) do
    @genre = assign(:genre, Genre.create!(
      :name => "Name"
    ))
    @genre.url.attach(io: File.open('tmp/storage.pdf'), filename: 'storage.pdf')
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
