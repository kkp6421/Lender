class BorrowersController < ApplicationController
  #before_action :owner_signed_in?, only: [:create, :destroy, :show]

  def show
    @borrower = Borrower.find(params[:id])
    @books = @borrower.books
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

  end

  def destroy
    @borrower = Borrower.find(params[:id])
    @borrower.destroy
    redirect_to borrowers_path, notice: "削除しました。"
  end

  private
  def borrower_params
    params.require(:borrower).permit(
      :name, :twitter_id
    )
  end
end
