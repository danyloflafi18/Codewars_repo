describe 'clients API' do
  before(:all) do
    @api_functionality = RestHttp.new
  end

  context 'simple GET request' do
    it 'should return all clients via GET request' do
      response = @api_functionality.get_request('/clients')
      expect(response.code).to eq(200)
    end
  end

  context 'validate creating a new client' do
    before(:each) do
      @count_of_sending = 0
      @count_of_getting = 0
    end

    it 'should create new client via POST request' do
      response = @api_functionality.post_request('/clients', API.client_payload)
      @count_of_sending += 1 if expect(response.code).to eq(200)
      response = @api_functionality.get_request('/clients')
      expect(response.code).to eq(200)
      parse = JSON.parse(response.body, symbolize_names: true)
      parse.each do |client|
        client.each { |_key, value| @count_of_getting += 1 if value == 'Orest1' }
      end
      expect(@count_of_getting).to eq(@count_of_sending)
    end
  end
end
