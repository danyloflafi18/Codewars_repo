require 'atlassian/jwt'
require 'active_support/time'
require 'date'

require 'uri'
require 'net/http'

# The URL of the API call, must include the query string, if any
url = 'https://prod-api.zephyr4jiracloud.com/connect/public/rest/api/1.0/cycle'
base_url = 'https://prod-api.zephyr4jiracloud.com/connect/'
# The key of the app as defined in the app description
issuer = 'MjA1NDAyYjAtMWQ2YS0zYzk4LWE1NzktY2Q2ODEwNGM1OWNiIDVjZjY4NGQ3ZDlmNmI5MGYzZDRiMTRkNCBVU0VSX0RFRkFVTFRfTkFNRQ'
# The HTTP Method (GET, POST, etc) of the API call
http_method = 'post'
# The shared secret returned when the app is installed
shared_secret = 'UzrlAZxg1F5KEe-MYiNvPfAUW4Cpqo-L-lQW1gyGvMg'

claim = Atlassian::Jwt.build_claims(
  issuer,
  url,
  http_method,
  base_url,
  (Time.now - 60.seconds).to_i,
  (Time.now + 1.day).to_i
=begin
  claim={:iat => Time.at(Time.now - 60.seconds),
         :exp => Time.at(Time.now + 1.day)}
=end
)

jwt = JWT.encode(claim, shared_secret)
require 'pry'
binding.pry
puts jwt

uri = URI(url)
http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Post.new(uri.request_uri)
headers = {
  content_type: 'application/json',
  authorization: jwt,
  zapiaccesskey: issuer
}
request.initialize_http_header(headers)
response = http.request(request)

