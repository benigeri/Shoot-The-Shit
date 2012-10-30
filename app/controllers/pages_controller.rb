class PagesController < ApplicationController
  def index
    @musings = Musing.all
  end
end
