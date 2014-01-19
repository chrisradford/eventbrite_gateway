module EventbriteGateway
  class Gateway
    COLLECTION_METHODS = {
      organizer_list_events: 'events',
      user_list_events: 'events',
      user_list_tickets: 'user_tickets',
      user_list_venues: 'user_venues',
      user_list_organizers: 'organzers',
    }

    def initialize client
      @client = client.extend EventbriteGateway::Client
    end

    def collection_method method_name, *args, &block
      response = @client.send(method_name, *args, &block)
      key = COLLECTION_METHODS.fetch(method_name) do
        method_name.split('_')[-1].to_s
      end
      response[key]
    rescue RuntimeError => e
      []
    end

    def object_method method_name, *args, &block
      response = @client.call(method_name, *args, &block)
      key = method_name.to_s.split('_')[0]
      response[key]
    rescue RuntimeError => e
      {}
    end

    def method_missing method_name, *args, &block
      if COLLECTION_METHODS.keys.include? method_name
        collection_method method_name, *args, &block
      else
        object_method method_name, *args, &block
      end
    end
  end
end
