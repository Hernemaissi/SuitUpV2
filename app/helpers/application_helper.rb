module ApplicationHelper
  #creates drop-down navigation links
  def nav_link_single(link_text, link_path)
    class_name = link_selected(link_path) ? "current" : ""
    link_to link_path, :class => class_name do
      content_tag(:div, t(link_text).downcase)
    end
  end
  
  #checks if the given path is the currently selected
  def link_selected(link_path)
    current_controller = params[:controller]
    if current_controller == "pages"
      current_page?(link_path)
    else
      link_controller = ""
      begin
        link_controller = Rails.application.routes.recognize_path(link_path)[:controller]
      rescue ActionController::RoutingError
      end
      current_controller == link_controller
    end
  end
  
end
