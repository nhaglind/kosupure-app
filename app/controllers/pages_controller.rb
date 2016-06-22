class PagesController < ApplicationController
  def about
  end

  def contact
  end

  def letsencrypt
    # use your code here, not mine
    render text: "0hQv5ZVn5cNyxwTwYwU4vH9_lO9VFdrw4WbDI0hhe2o.FU9mpYT9y1uj4yK2md2hbR-vxR27z2bCtf691yw8Odg"
  end
end