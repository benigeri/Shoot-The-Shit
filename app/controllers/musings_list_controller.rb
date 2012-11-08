class MusingsListController < ApplicationController
  # before_filter :authenticate_user!
  before_filter :set_timezone
  before_filter :set_globals
  def set_globals
    @secondary_navbar = true
    @pillbox_sorter = true
    @highlight_musings = true
    @global_navbar = true
  end

  def recent
    @sort = "recent"
    @musings = Musing.order("created_at DESC")
  end

  def popular
    @sort = "popular"
    @musings = Musing.where(:created_at => (Time.now - 7.day)..Time.now).order("votecount DESC")
  end

  def local
    radius = 10;
    @sort = "local"
    @locationName = params[:locationName]
    @locationLongitude = params[:locationLongitude].to_f
    @locationLatitude = params[:locationLatitude].to_f
    @musings = Musing.where(:longitude => (@locationLongitude - radius)..(@locationLongitude + radius), :latitude => (@locationLatitude - radius)..(@locationLatitude + radius)).order("created_at DESC")
  end
end
