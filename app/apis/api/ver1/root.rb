module API
  module Ver1
    class Root < Grape::API
      version 'v1'
      format :json

      mount API::Ver1::Visitors
    end
  end
end
