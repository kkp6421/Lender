class BooksController < ApplicationController
  before_action :owner_signed_in?, only: [:create, :destroy, :show]
  def show
    @book = current_owner.books.find_by(params[:id])
  end
  def new
    @book = current_owner.books.build
  end
  def create
    @book = current_owner.books.build(book_params)
    if @book.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @book = current_owner.books.find_by(params[:id])
    @book.destroy
    redirect_to root_path
  end

  def edit
    @book = current_owner.books.find_by(params[:id])
  end
  def update
    @book = current_owner.books.find_by(params[:id])
    if @book.update(book_params)
      redirect_to @book
    end
  end

  private

  def book_params
    params.require(:book).permit(
      :ISBN, :name, :author, :publisher
    )
  end

end
