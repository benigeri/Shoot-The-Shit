class PagesController < ApplicationController
  before_filter :set_timezone
  before_filter :authenticate_user!

  def musings
    @musings = Musing.all
    @secondary_navbar = true
    @pillbox_sorter = true
    @highlight_musings = true
  end

end
