class BooksController < ApplicationController
  before_action :owner_signed_in?, only: [:create, :destroy, :show]
  def show
    @book = current_owner.books.find(params[:id])
  end
  def new
    @book = current_owner.books.build
  end
  def create
    @book = current_owner.books.build(book_params)
    if @book.save
      redirect_to root_path, notice: "作成しました。"
    else
      flash[:notice] = "入力ミスがあります。"
      render :new
    end
  end

  def destroy
    @book = current_owner.books.find(params[:id])
    @book.destroy
    redirect_to root_path, notice: "削除しました。"
  end

  def edit
    @book = current_owner.books.find(params[:id])
  end
  def update
    @book = current_owner.books.find(params[:id])
    if @book.update(book_params)
      redirect_to @book, notice: "更新しました。"
    else
      flash[:notice] = "入力ミスがあります。"
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(
      :ISBN, :name, :author, :publisher
    )
  end

end
