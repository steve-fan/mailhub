require 'postmark'
require 'mailhub/helper'

module Mailhub
  class Hub
    attr_accessor :settings

    # TODO: pass vendor as parameters
    def initialize(settings)
      @settings = settings
      @postmark_client = ::Postmark::ApiClient.new(settings[:postmark_api_token])
    end

    def deliver!(mail)
      vendors.each do |vendor|
        send(:"deliver_by_#{vendor}", mail)
        break if mail.delivered?
      end
      mail
    end

    def vendors
      [:postmark]
    end

    def deliver_by_postmark(mail)
      @postmark_client.deliver_message(mail)
    end
  end
end
