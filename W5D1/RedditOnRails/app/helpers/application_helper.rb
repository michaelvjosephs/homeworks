module ApplicationHelper
  def auth_token
    "<input type=\"hidden\"
      name=\"authenticity_token\"
      value=\"#{form_authenticity_token}\"
    >".html_safe
  end

  def form_patch_action
    "<input
        type=\"hidden\"
        name=\"_method\"
        value=\"PATCH\"
      >".html_safe
  end

  def form_delete_action
    "<input
        type=\"hidden\"
        name=\"_method\"
        value=\"DELETE\"
      >".html_safe
  end
end
