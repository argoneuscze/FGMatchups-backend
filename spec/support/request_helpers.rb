module Request
  module JsonHelpers
    def json
      @response_json ||= JSON.parse(response.body)
    end
  end
end
