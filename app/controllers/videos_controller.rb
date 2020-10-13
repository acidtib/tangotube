class VideosController < ApplicationController
  # before_action :authenticate_user!

  NUMBER_OF_VIDEOS_PER_PAGE = 25.freeze
  HERO_YOUTUBE_ID = 's6iptZdCcG0'.freeze

  helper_method :sort_column, :sort_direction

  def index
    @videos_sorted = Video.search(params[:q])
                          .includes(:song, :leader, :follower, :videotype, :event)
                          .references(:song, :leader, :follower, :videotype, :event)
                          .order(sort_column + " " + sort_direction)

    @videos_filtered = @videos_sorted
    @videos_filtered = @videos_filtered.videotype(params[:videotype]) if params[:videotype].present?
    @videos_filtered = @videos_filtered.genre(params[:genre]) if params[:genre].present?
    @videos_filtered = @videos_filtered.leader(params[:leader]) if params[:leader].present?
    @videos_filtered = @videos_filtered.follower(params[:follower]) if params[:follower].present?
    @videos_filtered = @videos_filtered.event(params[:event]) if params[:event].present?
    @videos_filtered = @videos_filtered.channel(params[:channel]) if params[:channel].present?

    @videos_paginated = @videos_filtered.paginate( page, NUMBER_OF_VIDEOS_PER_PAGE )

    first_youtube_id ||= if @videos_sorted.empty?
                          HERO_YOUTUBE_ID
                         else
                          @videos_sorted.first.youtube_id 
                         end

    @active_youtube_id ||= params[:youtube_id] || first_youtube_id
    
    @active_video = Video.find_by(youtube_id: @active_youtube_id)

    # Populate Filters 
    @videotypes  = @videos_filtered.pluck(:"videotypes.name").compact.uniq.sort
    @leaders     = @videos_filtered.pluck(:"leaders.name").compact.uniq.sort
    @followers   = @videos_filtered.pluck(:"followers.name").compact.uniq.sort
    @events      = @videos_filtered.pluck(:"events.name").compact.uniq.sort
    @channels    = @videos_filtered.pluck(:channel).compact.uniq.sort
    @genres      = @videos_filtered.pluck(:"songs.genre").compact.uniq.sort

  end

  private

  def sort_column
    acceptable_cols = [ "songs.title",
                        "songs.artist",
                        "songs.genre",
                        "leaders.name",
                        "followers.name",
                        "channel",
                        "upload_date",
                        "view_count",
                        "videotypes.name",
                        "events.name"]
    acceptable_cols.include?(params[:sort]) ? params[:sort] : "upload_date"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

  def page
    @page ||= params.permit(:page).fetch(:page, 0).to_i
  end
end
