class BorrowersController < ApplicationController
  before_action :redirect_login

  def show
    @borrower = Borrower.find(params[:id])
    @books = @borrower.books
    @active_books = @books.distinct
  end

  def new
    @borrower = Borrower.new
  end

  def create
    @borrower = Borrower.new(borrower_params)
    if @borrower.save
      flash[:notice] = "登録しました"
      redirect_to @borrower, notice: "登録しました。"
    else
      flash[:notice] = "入力ミスがあります。"
      render :new
    end
  end

  def edit
    @borrower = Borrower.find(params[:id])
  end

  def update
    @borrower = Borrower.find(params[:id])
    if @borrower.update(borrower_params)
      redirect_to @borrower, notice: "更新しました。"
    else
      flash[:notice] = "入力ミスがあります。"
      render :edit
    end
  end

  def lend
    @search_books = Book.where(owner_id: current_owner.id).search(params[:search])
    @borrower = Borrower.find(params[:id])
    if request.post?
      @book_borrower = BookBorrower.new(:book_id =>params[:book_id], :borrower_id=>@borrower.id)
      if @book_borrower.save
        @book = Book.find(params[:book_id])
        @book.activate = true
        @book.save
        flash[:alert] = Book.find(params[:book_id]).activate
        flash[:notice] = "貸し出しました。"
        redirect_to @borrower
      end
    end
  end

  def return_book
    @borrower = Borrower.find(params[:id])
    if request.post?
      @book = Book.find(params[:book_id])
      @book.activate = false
      @book.save
      #flash[:notice] = Book.find(params[:book_id]).activate
      redirect_to @borrower
    end
  end

  def destroy
    @borrower = Borrower.find(params[:id])
    @borrower.destroy
    redirect_to root_path, notice: "削除しました。"
  end

  def redirect_login
    unless owner_signed_in?
      redirect_to new_owner_session_path
    end
  end

  private
  def borrower_params
    params.require(:borrower).permit(
      :name, :twitter_id
    )
  end
  def book_borrower_params
    params.require(:book_borrower).permit(
      :borrower_id, :book_id
    )
  end
end
