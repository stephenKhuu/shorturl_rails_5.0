class HomeController < ApplicationController
  def index

    @requested_short_id = nil

    if params.present? && params[:short_id].present?
      @requested_short_id = params[:short_id]

      short_url = ShortUrl.find_by_short_id(@requested_short_id)

      if short_url.present?
        @requested_redirect_url = short_url.full_url
      else
        render plain: '404 Short ID not found', status: 404
      end

    end
  end

  def stats
    short_url = ShortUrl.find_by_short_id(params['short_id'])

    if short_url.blank?
      render plain: '404 Short ID not found', status: 404
    else
      @activities = short_url.activities
    end


  end

end
