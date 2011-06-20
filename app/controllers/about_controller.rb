class AboutController < ApplicationController
  before_filter :get_recent_posts
  before_filter :validate_user,:except => [:index]

  def index
    @about = Aboutme.first
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @about }
    end
  end


  def edit 
    @aboutme = Aboutme.first

    render :action => "edit" 
  end

  # PUT /aboutmes/1
  # PUT /aboutmes/1.xml
  def update
    @aboutme = Aboutme.first

    respond_to do |format|
      if @aboutme.update_attributes(params[:aboutme])
        format.html { redirect_to(:action => "index") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @aboutme.errors, :status => :unprocessable_entity }
      end
    end
  end

end
