require_relative '../spec_helper'

describe EventbriteGateway::Gateway do
  it "cannot be created without an evenbrite-client" do
    lambda {EventbriteGateway::Gateway.new}.must_raise ArgumentError
  end

  it "takes an eventbrite-client on creation" do
    EventbriteGateway::Gateway.new(EBClient.new(nil)).
      must_be_instance_of EventbriteGateway::Gateway
  end

  describe "User API methods" do
    it "returns an Array for User events" do
      EventbriteGateway::Gateway.new(EBClient.new(:user_list_events)).
        user_list_events.must_be_instance_of Array
    end

    it "returns an empty Array for empty User events" do
      EventbriteGateway::Gateway.new(EBClient.new(nil)).
        user_list_events.must_be_instance_of Array
    end

    it "returns an Array for User tickets" do
      EventbriteGateway::Gateway.new(EBClient.new(:user_list_tickets)).
        user_list_tickets.must_be_instance_of Array
    end

    it "return an Arry for empty User tickets" do
      EventbriteGateway::Gateway.new(EBClient.new(nil)).
        user_list_tickets.must_be_instance_of Array
    end
  end
end
