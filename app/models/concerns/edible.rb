module Edible
  extend ActiveSupport::Concern

  def type_and_id
    "#{model_name}//#{id}"
  end
end
