class CommVotesController < ApplicationController
  # GET /comm_votes
  # GET /comm_votes.json
  def index
    @comm_votes = CommVote.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comm_votes }
    end
  end

  # GET /comm_votes/1
  # GET /comm_votes/1.json
  def show
    @comm_vote = CommVote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comm_vote }
    end
  end

  # GET /comm_votes/new
  # GET /comm_votes/new.json
  def new
    @comm_vote = CommVote.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comm_vote }
    end
  end

  # GET /comm_votes/1/edit
  def edit
    @comm_vote = CommVote.find(params[:id])
  end

  # POST /comm_votes
  # POST /comm_votes.json
  def create
    @comm_vote = CommVote.new(params[:comm_vote])

    respond_to do |format|
      if @comm_vote.save
        format.html { redirect_to @comm_vote, notice: 'Comm vote was successfully created.' }
        format.json { render json: @comm_vote, status: :created, location: @comm_vote }
      else
        format.html { render action: "new" }
        format.json { render json: @comm_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comm_votes/1
  # PUT /comm_votes/1.json
  def update
    @comm_vote = CommVote.find(params[:id])

    respond_to do |format|
      if @comm_vote.update_attributes(params[:comm_vote])
        format.html { redirect_to @comm_vote, notice: 'Comm vote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comm_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comm_votes/1
  # DELETE /comm_votes/1.json
  def destroy
    @comm_vote = CommVote.find(params[:id])
    @comm_vote.destroy

    respond_to do |format|
      format.html { redirect_to comm_votes_url }
      format.json { head :no_content }
    end
  end
end
