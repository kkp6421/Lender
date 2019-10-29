class HomeController < ApplicationController
  def index
    unless owner_signed_in?
      redirect_to new_owner_session_path
    end

    @books = current_owner.books if owner_signed_in?
  end

  def about
  end

  def help
  end
end
