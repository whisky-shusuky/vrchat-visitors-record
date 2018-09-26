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
          visitor = Visitor.world_visitor_list(params[:world_id])
          #[WIP] error handling
          #  (example) get no array. 
          world_image_url = visitor[0].world_image_url
          occupants_sum = visitor.sum {|hash| hash[:occupants]}
          occupants_average = occupants_sum / visitor.count
          foramated_info = []
          for visit in visitor
            foramated_info.push({
              world_id: visit.world_id ,
              world_name: visit.world_name, 
              occupants: visit.occupants,
              visit_time: visit.created_at
            })
          end

          @result = {
            total_visitor: occupants_sum,
            occupants_average: occupants_average,
            world_image_url: world_image_url,
            total: foramated_info
          }
        end
      end
    end
  end
end



