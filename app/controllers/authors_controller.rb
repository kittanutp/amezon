class AuthorsController < ApplicationController
  before_action :authorize_user, only: [:create, :destroy, :update]

  def index
    data = paginate(Author)
    data[:result] = Author.limit(params[:limit]).offset(get_offset).all
    render json: data
  end

  def show
    render json: Author.find(params[:id])
  end

  def create
    author = Author.create(authorparam)
    if author.save()
      render(json: author, status: 200)
    else
      render(json: author.errors, status: 422)
    end
  end

  def update
    author = Author.find(params[:id])
    author.update(authorparam)
    render json: author, status: 200
  end

  def destroy
    Author.find(params[:id]).destroy!
    head :no_content
  end

  private
  def authorparam
    params.require(:author).permit(:first_name, :last_name, :age)
  end
end
