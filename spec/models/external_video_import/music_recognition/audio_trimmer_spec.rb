# frozen_string_literal: true

require "rails_helper"

RSpec.describe ExternalVideoImport::MusicRecognition::AudioTrimmer do
  let(:audio_file) { file_fixture("audio.mp3").open }

  describe "#trim" do
    it "takes an audio file and creates a 20s snippet" do
      ExternalVideoImport::MusicRecognition::AudioTrimmer.new.trim(audio_file) do |trimmed_file|
        expect(FFMPEG::Movie.new(trimmed_file.path).duration.round).to eq 20
      end
    end
  end
end
