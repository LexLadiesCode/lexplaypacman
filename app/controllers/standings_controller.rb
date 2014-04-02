class StandingsController < ApplicationController
  before_action :set_standing, only: [:show]
  helper_method :sort_column, :sort_direction, :sort_time

  def top
    @standings = Standing.all.order("score DESC").limit(10)
  end

  # GET /standings
  # GET /standings.json
  def index
    @standings = Standing.with_locations
    if sort_column == 'initials'
      @standings = @standings.order("LOWER(initials) " + sort_direction)
    elsif sort_column == 'location_id'
      @standings = @standings.order("locations.name " + sort_direction)
    else
      @standings = @standings.order(sort_column + " " + sort_direction)
    end
    @standings = @standings.where('standings.created_at > ?', sort_time)
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

  # POST /standings
  # POST /standings.json
  def create
    @standing = Standing.new(standing_params)
    file = params[:standing][:file]
    if file.present?
      photo_id = Flickr.upload(file, title: @standing.initials)
      photo = Flickr.photos.find(photo_id).get_info!
      photo.get_sizes!
      @standing.image_URL = photo.largest.source_url
    end
    respond_to do |format|
      if @standing.save
        format.html { redirect_to @standing, notice: 'Saved your high score!' }
        format.json {
          render action: 'show', status: :created, location: @standing
        }
      else
        @standing.build_player unless @standing.player
        format.html { render action: 'new' }
        format.json {
          render json: @standing.errors, status: :unprocessable_entity
        }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_standing
    @standing = Standing.find(params[:id])
  end

  def standing_params
    params.require(:standing).permit(:initials, :score, :location_id, :file,
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
  end

  def sort_direction
    # ['asc', 'desc']
    if %w[asc desc].include?(params[:direction])
      params[:direction]
    else
      'desc'
    end
  end

  def sort_time
    if params[:time] == nil
      100.years.ago
    else
      params[:time]
    end
  end
end
