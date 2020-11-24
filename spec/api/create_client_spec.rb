describe 'create client' do
  before(:all) do
    @api_functionality = RestHttp.new
  end

  it 'should create client via POST request' do
    result = @api_functionality.post_request('/clients', API.client_payload)
    expect(result.code).to eq(200)
  end
end