namespace :cleanup do
  desc "Remove disabled channel videos from database"
  task :remove_disabled_channel_videos do
    Channel.where(active: false).each do |channel|
      channel.videos.find_each do |video|
        DestroyVideoJob.perform_async(video.youtube_id)
      end
    end
  end
end
