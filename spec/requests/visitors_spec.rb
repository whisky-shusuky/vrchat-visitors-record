require 'rails_helper'
require 'json_expressions/rspec'

RSpec.describe "Visitors", type: :request do
  FactoryBot.create(:visitor)
  describe "GET /visitors" do
    it "returns status 200" do
      get "/api/v1/visitors"
      expect(response).to have_http_status(200)
    end

    it "returns json" do
      pattern = 
        [
          {
            id: Integer,
            world_id: String,
            world_name: String,
            occupants: Integer,
            world_image_url: String,
            created_at: String,
            updated_at: String
          },
        ].forgiving!
      get "/api/v1/visitors"
      expect(response.body).to match_json_expression(pattern)
    end
  end
end
