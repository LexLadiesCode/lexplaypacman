class StandingsController < ApplicationController
  before_action :set_standing, only: [:show, :edit, :update, :destroy]
  def top
  @standings = Standing.all.order("score DESC").limit(10)
  end
  # GET /standings
  # GET /standings.json
  helper_method :sort_column, :sort_direction, :sort_time
  def index
    if sort_column == 'initials'
      @standings = Standing.with_locations.
                          order("lower(initials) " + sort_direction).where('standings.created_at > ?', sort_time)
    elsif sort_column == 'location_id'
      @standings = Standing.with_locations.
                          order("locations.name " + sort_direction).where('standings.created_at > ?', sort_time)
    else
      @standings = Standing.with_locations.
                          order(sort_column + " " + sort_direction).where('standings.created_at > ?', sort_time)
    end

  end

  # GET /standings/1
  # GET /standings/1.json
  def show
  end

  # GET /standings/new
  def new
    @standing = Standing.new
    @standing.build_player
  end

  # GET /standings/1/edit
  def edit
  end

  # POST /standings
  # POST /standings.json
  def create
    @standing = Standing.new(standing_params)
    # @image = Imgurruby::Imgur.new('4cd0e03b000be61')
    # @image.upload(params[:standing][:file])
    # @standing.image_URL = @image.url
    respond_to do |format|
      if @standing.save
        format.html { redirect_to @standing, notice: 'Standing was successfully created.' }
        format.json { render action: 'show', status: :created, location: @standing }
      else
        format.html {
          @standing.build_player unless @standing.player
          render action: 'new'
        }
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
      params.require(:standing).permit(:initials, :score, :location_id,
                                       player_attributes: [:email, :twitter])
    end

    def sort_location
      if Location.column_names.include?(params[:sort])
        params[:sort]
      else
        'name'
      end
    end

    def sort_column
      if Standing.column_names.include?(params[:sort])
        params[:sort]
      else
        'score'
      end
      # Standing.column_names.include?(params[:sort]) ? params[:sort] :  "score"
    end

    def sort_direction
      # ['asc', 'desc']
      if %w[asc desc].include?(params[:direction])
        params[:direction]
      else
        'desc'
      end
      # %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def sort_time
      if params[:time] == nil
        100.years.ago
      else
        params[:time]
      end
#      %w[1000.days.ago 7.days.ago 0.days.ago].include?(params[:time]) ? params[:time] : 7.days.ago
    end
end
