# frozen_string_literal: true

# == Schema Information
#
# Table name: couple_videos
#
#  id         :bigint           not null, primary key
#  video_id   :bigint           not null
#  couple_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CoupleVideo < ApplicationRecord
  belongs_to :video
  belongs_to :couple
end
