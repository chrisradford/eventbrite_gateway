# EventbriteGateway

EventbriteGateway provides a gateway model to the eventbrite-client gem, converting the returned output into simple Ruby Hashes and Arrays, as well as improving the overall error handling by extending the provided eventbrite-client instances to use more meaningful exceptions.

## Installation

Add this line to your application's Gemfile:

    gem 'eventbrite_gateway'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install eventbrite_gateway

## Usage

```ruby
gateway = EventbriteGateway.new(eventbrite_client)
gateway.user_list_events
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
