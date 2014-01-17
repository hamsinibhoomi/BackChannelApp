class CommsController < ApplicationController
  # GET /comms
  # GET /comms.json
  def index
    @comms = Comm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comms }
    end
  end

  # GET /comms/1
  # GET /comms/1.json
  def show
    @comm = Comm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comm }
    end
  end

  # GET /comms/new
  # GET /comms/new.json
  def new
    @comm = Comm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comm }
    end
  end

  # GET /comms/1/edit
  def edit
    @comm = Comm.find(params[:id])
  end

  # POST /comms
  # POST /comms.json
  def create
    @comm = Comm.new(params[:comm])
    @post = Post.find(params[:post_id])
    @comm = @post.comms.create(params[:comm])
    @comm.votes = 0
    @comm.user_id = session[:id1]
    @comm.save
    redirect_to post_path(@post)
=begin
    respond_to do |format|
      if @comm.save
        format.html { redirect_to @comm, notice: 'Comm was successfully created.' }
        format.json { render json: @comm, status: :created, location: @comm }
      else
        format.html { render action: "new" }
        format.json { render json: @comm.errors, status: :unprocessable_entity }
      end
    end
=end
  end

  # PUT /comms/1
  # PUT /comms/1.json
  def update
    @comm = Comm.find(params[:id])

    respond_to do |format|
      if @comm.update_attributes(params[:comm])
        format.html { redirect_to @comm, notice: 'Comm was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comms/1
  # DELETE /comms/1.json
  def comm_delete
    @comm = Comm.find(params[:id7])
    @comm.destroy
    redirect_to :controller => 'posts', :action => 'show', :id => params[:id6]
  end
  def destroy
    @comm = Comm.find(params[:id])
    @comm.destroy

    respond_to do |format|
      format.html { redirect_to :controller => 'posts', :action => 'show', :id => params[:id6] }
      format.json { head :no_content }
    end
  end
end
