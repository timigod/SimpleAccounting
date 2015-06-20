module ApplicationHelper
  
  def is_selected_nav_item?(controller)
    if controller_name.downcase == controller.downcase
      return 'class = "active"'.html_safe
    end
  end
  
  def is_amount_in_the_red?(amount)
    if amount < 0
      return 'text-danger'.html_safe
    else
      return 'text-success'.html_safe
    end
  end
end
