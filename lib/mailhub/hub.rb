require 'postmark'
require 'mailhub/helper'

module Mailhub
  class Hub
    attr_accessor :settings

    def initialize(settings)
      @settings = settings
    end

    def deliver!(mail)
      vendors.each do |vendor|
        vendor.deliver_message(mail)
        break if mail.delivered?
      end
      mail
    end

    def vendors
      settings[:vendors]
    end
  end
end
