require 'rails_helper'

describe 'Books API', type: :request do
  let!(:author) {FactoryBot.create(:author, first_name: 'Steven' ,last_name: 'Spielberg')}
  describe 'GET /books' do
    before do
      FactoryBot.create(:book, title: 'Star War', author_id: author.id)
      FactoryBot.create(:book, title: 'Star War 2', author_id: author.id)
    end
    it 'returns all books' do
      get '/api/books'
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)["result"].length).to eq(2)
    end
  end
  describe 'POST /books' do
    it 'create a new book' do
      expect{
        post '/api/books', params: {book:  {title: 'Star War', author_id: author.id}}
      }.to change {Book.count}.from(0).to(1)
      expect(response).to have_http_status(200)
      end
    end
  describe 'DELETE /books/:id' do
    let!(:book) {FactoryBot.create(:book, title: 'Star War', author_id: author.id)}
    it 'deletes a book' do
      expect{
        delete "/api/books/#{book.id}"
    }.to change {Book.count}.from(1).to(0)
      expect(response).to have_http_status(204)
    end
  end
end
