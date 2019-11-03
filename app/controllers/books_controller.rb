class BooksController < ApplicationController
  before_action :redirect_login
  def show
    @book = current_owner.books.find(params[:id])
    @borrower = @book.borrowers.last
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

  def redirect_login
    unless owner_signed_in?
      redirect_to new_owner_session_path
    end
  end

  private

  def book_params
    params.require(:book).permit(
      :ISBN, :name, :author, :publisher
    )
  end

end
