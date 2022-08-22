class Dancer < ApplicationRecord
  include PgSearch::Model
  multisearchable against: [:name]

  belongs_to :user, optional: true
  has_many :dancer_videos, dependent: :destroy
  has_many :videos, through: :dancer_videos
  has_many :orchestras, through: :videos
  has_many :songs, through: :videos

  has_many :couples, dependent: :destroy
  has_many :partners, through: :couples

  has_one_attached :profile_image
  has_one_attached :cover_image
  enum gender: { male: 0, female: 1 }


  after_validation :set_slug, only: [:create, :update]
  after_save :find_videos

  def find_videos
    Video.with_dancer_name_in_title(name).each do |video|
      dancer_gender = gender
      role = if dancer_gender == :male
        :leader
      else
        :follower
      end
      DancerVideo.create(video:, role:, dancer: self)
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def to_param
    "#{id}-#{slug}"
  end

  def self.rebuild_pg_search_documents
    find_each { |record| record.update_pg_search_document }
  end

  private

  def set_slug
    self.slug = name.parameterize
  end
end
