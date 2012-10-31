class MusingsController < ApplicationController
  before_filter :authenticate_user!, :only => [:create]
  before_filter :set_timezone

  def show
    @musing = Musing.find(params[:id])
    @comment = Comment.new

  end

  def new
    @musing = Musing.new
  end

  def create
    # @musing = Musing.new(params[:musing])
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
