module API
  def self.courier_payload
    "{\r\n    \"address\": \"ggg\",\r\n    \"birthday\": \"2021-03-10\",\r\n    \"departmentId\": 1,\r\n    \"id\": 11,\r\n    \"name\": \"valera\",\r\n    \"phone\": 1000000000,\r\n    \"surname\": \"valerych\"\r\n}\r\n "
  end

  def self.client_payload
    "{\r\n    \"id\": \"12\",\r\n    \"name\": \"Orest\",\r\n    \"surname\": \"Valera\",\r\n    \"phone\": \"380665542333\",\r\n    \"address\": \"nil\"\r\n}"
  end

  def self.department_payload
    "{\r\n    \"id\": 3,\r\n    \"departmentTypeSize\": \" COOL \",\r\n    \"cityName\": \" LVIV \",\r\n    \"number\": 4,\r\n    \"address\": \" Slovatskoho, 100 \"\r\n}"
  end
end