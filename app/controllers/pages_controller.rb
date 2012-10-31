class PagesController < ApplicationController
  before_filter :set_timezone


  def musings
    @musings = Musing.all
  end
end
