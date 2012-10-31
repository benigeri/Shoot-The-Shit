class PagesController < ApplicationController
  before_filter :set_timezone
  before_filter :authenticate_user!

  def musings
    @musings = Musing.all
  end
end
