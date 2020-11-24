describe 'return all clients' do
  before(:all) do
    @api_functionality = RestHttp.new
  end

  it 'should return all clients via GET request' do
    result = @api_functionality.get_request('/clients')
    expect(result.code).to eq(200)
  end
end