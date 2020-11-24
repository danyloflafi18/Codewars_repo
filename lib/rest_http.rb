require 'json'
require 'rest_client'

class RestHttp
  URL = "http://localhost:8083/chalyi".freeze

  def get_request(endpoint, headers = {content_type: 'application/json'})
    RestClient.get(URL + endpoint, headers)
  end

  def post_request(endpoint, payload, headers = {content_type: 'application/json'})
    RestClient.post(URL + endpoint, payload, headers)
  end

  def put_request(endpoint, payload, headers = {content_type: 'application/json'})
    RestClient.put(URL + endpoint, payload, headers)
  end

  def delete_request(endpoint, headers = {content_type: 'application/json'})
    RestClient.delete(URL + endpoint, headers)
  end
end