class MusingsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_timezone

  before_filter :set_globals
  def set_globals
    @secondary_navbar = true
  end

  def show
    @musing = Musing.find(params[:id])
    @comment = Comment.new
    @back_button = true
    @back_link = '/'
    @title = @musing.title
    @show_musing_title = true
  end

  def new
    @musing = Musing.new
    @secondary_navbar = true
    @back_button = true
    @new_musing_title = true
    @back_link = '/'
  end

  def create
    @back_button = true
    @back_link = '/'
    @musing = current_user.musings.create(params[:musing])


    respond_to do |format|
      if @musing.save
        format.html { redirect_to @musing, :notice => 'Musing was successfully created.' }
        format.json { render :json => @musing }
      else
        format.html { render :action => "new" }
        format.json { render :json => @product.errors, :status => :unprocessable_entity }
      end
    end
  end

end
