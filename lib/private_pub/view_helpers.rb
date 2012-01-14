module PrivatePub
  module ViewHelpers
    def publish_to(channel, data = nil, &block)
      PrivatePub.publish_to(channel, data || capture(&block))
    end

    def subscribe_to(channel)
      subscription = PrivatePub.subscription(:channel => channel)
      subscription[:server] = PrivatePub.config[:server]
      content_tag "script", :type => "text/javascript" do
        raw("PrivatePub.sign(#{subscription.to_json});")
      end
    end
  end
end
