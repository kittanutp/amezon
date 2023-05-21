class BooksController < ApplicationController
  def index
    books = Book.limit(params[:limit]).offset(get_offset).all
    data = paginate(Book)
    data[:result] = BooksRepresenter.new(books).as_json
    render json: data
  end

  def show
    render json: Book.find(params[:id])
  end

  def create
    book = Book.create(bookparam)
    if book.save()
      render(json: book, status: 200)
    else
      render(json: book.errors, status: 422)
    end
  end

  def update
    book = Book.find(params[:id])
    book.update(bookparam)
    render json: book, status: 200
  end

  def destroy
    Book.find(params[:id]).destroy!
    head :no_content
  end

  private

  def bookparam
    params.require(:book).permit(:title, :author_id)
  end

end
