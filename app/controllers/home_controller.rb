class HomeController < ApplicationController
  before_action :redirect_login, except: [:about, :help]

  def index
      @books = current_owner.books.paginate(page: params[:page], per_page: 8)
      @search_books = Book.where(owner_id: current_owner.id).search(params[:search])
  end

  def about
  end

  def help
  end

  def search_book
    @search_books = Book.where(owner_id: current_owner.id).search(params[:search])
  end

  def search_borrower
    @search_borrowers = Borrower.search(params[:search])
  end

  def redirect_login
    unless owner_signed_in?
      redirect_to new_owner_session_path
    end
  end
end
