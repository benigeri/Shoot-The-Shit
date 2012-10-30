class PagesController < ApplicationController
  def musings
    @musings = Musing.all
  end
end
