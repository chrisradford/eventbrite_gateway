require_relative '../spec_helper'
require 'eventbrite-client'

describe EventbriteGateway::Client do
  before do
    @client = EventbriteClient.new(access_token: 'TESTING').
      extend(EventbriteGateway::Client)
  end

  it "takes and extends an EventbriteClient" do
      @client.must_be_instance_of EventbriteClient
  end

  it "raises AuthenticationError for bad access tokens" do
    lambda do
      VCR.use_cassette 'AuthenticationError' do
        @client.user_list_events
      end
    end.must_raise EventbriteGateway::APIError::AuthenticationError
  end

  it "raises RequestError for invalid API endpoints" do
    lambda do
      VCR.use_cassette 'RequestError' do
        @client.not_an_endpoint
      end
    end.must_raise EventbriteGateway::APIError::RequestError
  end

  it "raises x for invalid application key" do
    lambda do
      VCR.use_cassette 'NotFound' do
        EventbriteClient.new(access_token: ENV['EB_ACCESS_TOKEN']).
          extend(EventbriteGateway::Client).
          event_get '123456789'
      end
    end.must_raise EventbriteGateway::APIError::NotFound
  end
end
