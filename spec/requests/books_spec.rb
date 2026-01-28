require 'rails_helper'

RSpec.describe "Books", type: :request do
  it "creates a book successfully with all attributes (sunny day)" do
    post books_path, params: {
      book: {
        title: "Rails Book",
        author: "Author",
        price: 12.99,
        published_date: "2024-01-01"
      }
    }

    follow_redirect!
    expect(response.body).to include("Book was successfully created.")
  end

  it "fails to create a book without title (rainy day)" do
    post books_path, params: {
      book: {
        title: ""
      }
    }

    expect(response.body).to include("error")
  end

  it "creates a book with all attributes" do
    post books_path, params: {
      book: {
        title: "Full Book",
        author: "Test Author",
        price: 25.99,
        published_date: "2024-01-01"
      }
    }

    follow_redirect!

    expect(response.body).to include("Book was successfully created.")
  end

  it "fails when author is missing" do
    post books_path, params: {
      book: {
        title: "No Author Book",
        author: "",
        price: 10.00,
        published_date: "2024-01-01"
      }
    }

    expect(response.body).to include("error")
  end

  it "fails when price is missing" do
    post books_path, params: {
      book: {
        title: "No Price Book",
        author: "Author",
        price: nil,
        published_date: "2024-01-01"
      }
    }

    expect(response.body).to include("error")
  end

  it "fails when published date is missing" do
    post books_path, params: {
      book: {
        title: "No Date Book",
        author: "Author",
        price: 10.00,
        published_date: nil
      }
    }

    expect(response.body).to include("error")
  end
end
