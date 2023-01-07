class ManifestsController < ApplicationController
  skip_after_action :verify_authorized

  # @route GET /:locale/manifest (manifest)
  def show
    render json: {
      name: "tangotube",
      short_name: "tangotube",
      start_url: "/",
      theme_color: "#D3D3D9",
      display: "standalone",
      background_color: "#000000",
      icons: [
        {
          src: asset_path("tangotube_logo_512w.png"),
          sizes: "144x144",
          type: "image/png",
          purpose: "any maskable"
        }
      ]
    }
  end

  private

  def helper_proxy
    ActionController::Base.helpers
  end

  delegate :asset_path, to: :helper_proxy
end
