module ApplicationHelper
  def active_class(controller)
    "active" if controller_name.to_sym == controller
  end
end
