require 'uri'
require 'bigdecimal'

class ApiController < ActionController::Base
  def create_short_url
    requested_url = params['requested_url']
    response_obj = {}

    if requested_url.scan(URI.regexp).present?

      short_url = ShortUrl.find_by_short_id(ShortUrl.get_short_id(requested_url))

      if short_url.blank?
        short_url = ShortUrl.create!({
                                         :full_url => requested_url
                                     })
      end

      response_obj = {
        "status" => "success",
        "requested_resource" => requested_url,
        "short_id" => short_url.short_id
      }
    else
      response_obj = {
        "status" => "error",
        "reason" => "Bad format"
      }
    end

    render :json => response_obj
  end

  def track_short_url_stats
    short_url = ShortUrl.find_by_short_id(params['short_id'])

    Activity.create!({
                        :short_url => short_url,
                        :lat => BigDecimal.new(params['latitude'], 10),
                        :long => BigDecimal.new(params['longitude'], 10),
                        :ip_address => request.remote_ip,
                        :user_agent => request.user_agent
                     })

    render :json => {
        "status" => "success"
    }
  end

  def get_short_url_stats
    short_url = ShortUrl.find_by_short_id(params['short_id'])

    if short_url.blank?
      render plain: '404 Short ID not found', status: 404
    else
      render :json => {
          "activities" => short_url.activities
      }
    end

  end
end