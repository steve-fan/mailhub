require 'active_support/rescuable'
require 'action_mailer'
require 'mailhub/version'
require 'mailhub/hub'

module Mailhub
  extend self

  def install
    ActionMailer::Base.add_delivery_method :mailhub, Mailhub::Hub
  end
end

if defined?(Rails)
  require 'mailhub/railtie'
else
  Mailhub.install
end
