class Visitor < ApplicationRecord
  scope :world_visitor_list, lambda {|world_id| where(world_id: world_id) }
end
