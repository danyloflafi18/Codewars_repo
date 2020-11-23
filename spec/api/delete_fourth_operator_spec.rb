require 'rspec'
require_relative '../../lib/rest_http'
require_relative '../support/data'

describe 'delete operator' do
  @api_functionality = RestHttp.new
  it 'should delete fourth operator via DELETE request' do
    result = @api_functionality.delete_request('operators/id')
    expect(result.code).to eq(200)
  end
end