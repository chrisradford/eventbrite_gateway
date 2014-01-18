module EventbriteGateway
  module Client
    def method_request method, params
      querystring = @auth.merge( params.is_a?(Hash) ? params : {} )
      resp = self.class.get("/#{@data_type}/#{method.to_s}",{:query => querystring})
      if resp['error']
        handle_error resp
      end
      return resp
    end

    def handle_error resp
      class_name = "#{resp['error']['error_type'].gsub(/\s+/, '')}"
      if EventbriteGateway::APIError.const_defined?(class_name)
        klass = EventbriteGateway::APIError.const_get(class_name)
      else
        klass = EventbriteGateway::APIError::UnknownError
      end
      raise klass, resp['error']['error_message'], caller[1..-1]
    end
  end
end
