class PagesController < ApplicationController
  def about
  end

  def contact
  end

  def letsencrypt
    # use your code here, not mine
    render text: "#{params[:id]}.FU9mpYT9y1uj4yK2md2hbR-vxR27z2bCtf691yw8Odg"
  end
end