class BlogsController < ApplicationController
  before_filter :get_recent_posts
  before_filter :validate_user,:except => [:index,:show,:comment]
  
  def blogs_list
    @blogs = Blog.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @blogs }
    end
  end

  def index
    @tag = params[:tag]

    @blogs = Blog.where('tag_name like ?','%'+params[:tag].to_s+'%').order('updated_at DESC').paginate(:page => params[:page]||1,:per_page => 50)

    respond_to do |format|
      format.html
      format.xml { render :xml => @blogs}
    end
  end

  # GET /blogs/1
  # GET /blogs/1.xml
  def show
    @blog = Blog.find(params[:id])
    @message = Message.new
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @blog }
    end
  end

  # GET /blogs/new
  # GET /blogs/new.xml
  def new
    @blog = Blog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @blog }
    end
  end

  # GET /blogs/1/edit
  def edit
    @blog = Blog.find(params[:id])
  end

  # POST /blogs
  # POST /blogs.xml
  def create
    @blog = Blog.new(params[:blog])
    create_tag params[:blog][:tag_name]
    respond_to do |format|
      if @blog.save
        format.html { redirect_to(@blog, :notice => 'Blog was successfully created.') }
        format.xml  { render :xml => @blog, :status => :created, :location => @blog }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /blogs/1
  # PUT /blogs/1.xml
  def update
    @blog = Blog.find(params[:id])
    create_tag params[:blog][:tag_name]
    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        format.html { redirect_to(@blog, :notice => 'Blog was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.xml
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to('/blogs/blogs_list') }
      format.xml  { head :ok }
    end
  end

  def comment
    @message = Message.new(params[:message])

    respond_to do |format|
      if @message.save
        format.html { redirect_to('/blogs/'+@message.blog_id.to_s+'#message_content')}
      else
        format.html { render "/messages/comment"} 
      end
    end
  end

  private

  def create_tag tag_names
    tags = tag_names.split(",")
    tags.each do |tag|
      Tag.create(:tag_name => tag) unless Tag.find_by_tag_name(tag)
    end
  end
end
