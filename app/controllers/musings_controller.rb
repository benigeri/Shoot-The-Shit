class MusingsController < ApplicationController
  def show
    @musing = Musing.find(params[:id])
  end

  def new
    @musing = Musing.new
  end

  def create
    @musing = Musing.new(params[:musing])

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