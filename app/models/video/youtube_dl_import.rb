class Video::YoutubeDlImport
  class << self
    def from_video(youtube_id)
      Video.import(youtube_id)
    end
  end
end