module DancersHelper
  def dancer_avatar(dancer_id)
    dancer = Dancer.find(dancer_id)
    if dancer.profile_image.attached?
      dancer.profile_image
    else
      image_url "default_avatar.jpg"
    end
  end

  def dancer_cover(dancer_id)
    dancer = Dancer.find(dancer_id)
    if dancer.cover_image.attached?
      dancer.cover_image
    else
      "blank_cover.jpg"
    end
  end

  def filtering_params
    params.permit(
      :leader,
      :follower,
      :channel,
      :genre,
      :orchestra,
      :song,
      :hd,
      :event,
      :year,
      :watched,
      :liked,
      :id,
      :query,
      :dancer).to_h.flatten.join("_")
  end
end
