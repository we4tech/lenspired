module ApplicationHelper
  def body_style
    content_for(:body_style).presence || "background: url(#{image_path('banner/kite.jpg')}) 30% 0 no-repeat"
  end
end
