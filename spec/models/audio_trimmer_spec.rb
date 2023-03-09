# frozen_string_literal: true

require "rails_helper"

RSpec.describe AudioTrimmer do
  fixtures :all

  describe "#trim" do
    it "takes an audio file and creates a 15s snippet" do
      audio_file = Tempfile.new
      audio_file.binmode
      audio_file.write file_fixture("audio.mp3").read
      audio_file.rewind

      expected_trimmed_file = Tempfile.new
      expected_trimmed_file.binmode
      expected_trimmed_file.write file_fixture("audio_snippet.mp3").read
      expected_trimmed_file.rewind

      trimmed_file = AudioTrimmer.new.trim(audio_file)
      expect(trimmed_file.read).to eq expected_trimmed_file.read
      expect(File.size(trimmed_file)).to eq 320926
      expect(File.extname(trimmed_file)).to eq ".mp3"
    end
  end
end
