class PagesController < ApplicationController
  before_filter :set_timezone
  def set_timezone
    Time.zone =  'Pacific Time (US & Canada)'
  end

  def musings
    @musings = Musing.all
  end
end
