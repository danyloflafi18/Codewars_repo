require 'rspec'
require_relative '../support/data'
require_relative '../../lib/rest_http'

describe 'create client' do
  it 'should create client via POST request' do
    @api_functionality = RestHttp.new
    result = @api_functionality.post_request('/clients', API.client_payload)
    expect(result.code).to eq(200)
  end

end