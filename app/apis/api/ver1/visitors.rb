module API
  module Ver1
    class Visitors < Grape::API
      resource :visitors do

        # GET /api/v1/visitors
        desc 'Return all visitors. This will set deprecated in future.'
        get do
          @visitors = Visitor.all
          present @visitors
        end

        # GET /api/v1/products/{:world_id}
        desc 'Returns world_id'
        params do
          requires :world_id, type: String, desc: 'VRChat World id'
        end

        get ':world_id' do
          Visitor.where(world_id:params[:world_id])
        end
      end
    end
  end
end



