class MusingsListController < ApplicationController
  before_filter :set_globals

  def set_globals
    @secondary_navbar = true
    @pillbox_sorter = true
    @highlight_musings = true
  end

  def recent
    @sort = "recent"
    @musings = Musing.all
  end

  def popular
    @sort = "popular"
    @musings = Musing.all
  end

  def local
    @sort = "local"
    @musings = Musing.all
  end

end
