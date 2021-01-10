module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    link_to "#{title} #{if css_class.present?
                          content_tag(:i, '', class: "fa fa-chevron-#{direction == 'asc' ? 'up' : 'down'}")
                        end}".html_safe,
            current_page_params.merge({ sort: column, direction: direction }), { class: css_class }
  end

  def current_page_params
    request.params.slice('songs.title',
                         'songs.artist',
                         'songs.genre',
                         'leaders.name',
                         'followers.name',
                         'leaders_videos.name',
                         'followers_videos.name',
                         'channels_videos.title',
                         'songs_videos.genre',
                         'youtube_id',
                         'channel.title',
                         'upload_date',
                         'view_count',
                         'videotypes.name',
                         'query',
                         'sort',
                         'direction')
  end

  def format_value(value)
    value ||= 'N/A'
  end
end
