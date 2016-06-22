class PagesController < ApplicationController
  def about
  end

  def contact
  end

  def letsencrypt
    # use your code here, not mine
    render text: params[:id]
  end
end