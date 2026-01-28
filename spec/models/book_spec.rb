require 'rails_helper'

RSpec.describe Book, type: :model do
  it "is valid with all attributes present" do
    book = Book.new(
      title: "Test Book",
      author: "Test Author",
      price: 10.99,
      published_date: Date.today
    )
    expect(book).to be_valid
  end

  it "is invalid without a title" do
    book = Book.new(title: "")
    expect(book).to_not be_valid
  end

  it "is invalid without an author" do
    book = Book.new(
      title: "Test Book",
      author: ""
    )
    expect(book).to_not be_valid
  end

  it "is invalid without a price" do
    book = Book.new(
      title: "Test Book",
      price: nil
    )
    expect(book).to_not be_valid
  end

  it "is invalid without a published date" do
    book = Book.new(
      title: "Test Book",
      published_date: nil
    )
    expect(book).to_not be_valid
  end
end
