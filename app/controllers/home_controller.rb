class HomeController < ApplicationController
  PER = 1
  def index
    unless owner_signed_in?
      redirect_to new_owner_session_path
    end

    @books = current_owner.books.paginate(page: params[:page], per_page: 8) if owner_signed_in?
  end

  def about
  end

  def help
  end
end
