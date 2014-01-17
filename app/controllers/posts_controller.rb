class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  def index
    @post = Post.all
    @post.each do |post|
      if(post.popularity == 0)
        post.recentness = 10000000/(Time.now.to_i - post.created_at.to_i)
        post.save
      else
        post.recentness = (post.popularity * 50) * (10000000/(Time.now.to_i - post.created_at.to_i))
        post.save
      end
    end
   if session[:admin] == true
    @posts = Post.find(:all, :conditions => {:category_id => params[:cat_id]}, :order => "recentness DESC")
   else
    @posts=Post.all(:order => "recentness DESC")
   end
    @username = session[:username]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end


  def show_search
    @value = params[:search_by]
    if (@value == "unityid")
    user = User.find_by_unityid(params[:search])
    @post = Post.where(user_id: user.id).all
    elsif (@value == "category")
    category = Category.find_by_name(params[:search])
    @post = Post.where(category_id: category.id).all
    elsif (@value == "tag")
           @post = Array.new
           @postall = Post.all
           @postall.each do |post|
             if (!post.tag.nil?)
             st = post.tag
             arr = st.split('#')

             if (arr.include?params[:search])
               @post << post
             end
             end
           end
    elsif (@value == "content")
            @post = Array.new
            @postall = Post.all
            @postall.each do |post|
              if (!post.description.nil?)
                st = post.description
                if (st.include?params[:search])
                  @post << post
                end
              end
            end

end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @post }
    end
  end


  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json

  def add_vote
    @post = Post.find(params[:id])
    @count = 0
    @count = @post.votes
    @count+=1
    @post.votes = @count
    @vote = PostVote.new
    @vote.user_id = session[:id1]
    @vote.post_id=@post.id
    @vote.save
    @post.popularity += 1
    @post.save

    redirect_to :action=>'index'
  end

  def subtract_vote
    @post = Post.find(params[:id2])
    @count1 = @post.votes
    @count1 -=1
    @post.votes = @count1
    @post.popularity -= 1
    @post.save
    #@vote = PostVote.find(:all, :conditions => {:post_id=>params[:id2] , :user_id=> session[:id1]})
    PostVote.destroy_all(post_id: params[:id2], user_id: session[:id1])
    redirect_to :action=>'index'
  end

  def add_comment_vote
    @comm = Comm.find(params[:id3])
    @post = Post.find(params[:id4])
    @post.popularity += 1
    @count = 0
    @count = @comm.votes
    @count+=1
    @comm.votes = @count
    @vote = CommVote.new
    @vote.user_id = session[:id1]
    @vote.comm_id=@comm.id
    @vote.save
    @comm.save
    @post.save
    redirect_to :action=>'show', :id => params[:id4]
  end

  def subtract_comment_vote
    @comm = Comm.find(params[:id3])
    @post = Post.find(params[:id5])
    @count1 = @comm.votes
    @count1 -=1
    @post.popularity -=1
    @comm.votes = @count1
    @comm.save
    @post.save
    #@vote = PostVote.find(:all, :conditions => {:post_id=>params[:id2] , :user_id=> session[:id1]})
    CommVote.destroy_all(comm_id: params[:id3], user_id: session[:id1])
    redirect_to :action=>'show', :id =>params[:id5]
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = session[:id1]
    @post.votes = 0
    @post.popularity = 0
    @post.save

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def report
    respond_to do |format|
      format.html
  end
  end

  def report_generate
    days = params[:days]
    days1 = days.to_i
    @posts = Post.all
    @postresult = Array.new
    @posts.each do |post|
      if (Time.now.to_i - post.created_at.to_i < days1*86400)
        @postresult << post
      end
    end

  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end