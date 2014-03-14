class StandingsController < ApplicationController
  before_action :set_standing, only: [:show, :edit, :update, :destroy]
  def top
  @standings = Standing.all.order("score DESC").limit(10)
  end
  # GET /standings
  # GET /standings.json
  def index
    @standings = Standing.all
  end

  # GET /standings/1
  # GET /standings/1.json
  def show
  end

  # GET /standings/new
  def new
    @standing = Standing.new
  end

  # GET /standings/1/edit
  def edit
  end

  # POST /standings
  # POST /standings.json
  def create
    @standing = Standing.new(standing_params)

    respond_to do |format|
      if @standing.save
        format.html { redirect_to @standing, notice: 'Standing was successfully created.' }
        format.json { render action: 'show', status: :created, location: @standing }
      else
        format.html { render action: 'new' }
        format.json { render json: @standing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /standings/1
  # PATCH/PUT /standings/1.json
  def update
    respond_to do |format|
      if @standing.update(standing_params)
        format.html { redirect_to @standing, notice: 'Standing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @standing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /standings/1
  # DELETE /standings/1.json
  def destroy
    @standing.destroy
    respond_to do |format|
      format.html { redirect_to standings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_standing
      @standing = Standing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def standing_params
      params.require(:standing).permit(:initials, :score, :player_id, :location_id)
    end
end
