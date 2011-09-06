class AboutController < ApplicationController
  before_filter :get_recent_posts

  def index
    @about = Aboutme.first
  end


  def edit 
    @aboutme = Aboutme.first
    render :action => "edit" 
  end

  def update
    @aboutme = Aboutme.first

    if @aboutme.update_attributes(params[:aboutme])
      format.html { redirect_to(:action => "index") }
      format.xml  { head :ok }
    else
      format.html { render :action => "edit" }
      format.xml  { render :xml => @aboutme.errors, :status => :unprocessable_entity }
    end
  end

end
