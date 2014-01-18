module EventbriteGateway
  module APIError
    class NotFound < RuntimeError; end;
    class AuthenticationError < RuntimeError; end;
    class ApplicationKeyError < RuntimeError; end;
    class RequestError < RuntimeError; end;
    # Errors not previously known about from the API
    class UndefinedError < RuntimeError; end;
  end
end
