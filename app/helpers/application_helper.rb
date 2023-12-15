module ApplicationHelper
  def require_admin
    unless  current_user.admin?
      render inline: "<h1>403 Forbidden</h1>", status: 403
    end
  end

  def not_require_admin
    if current_user.admin?
      render inline: "<h1>403 Forbidden</h1>", status: 403
    end
  end

  def record_not_found
    render plain: "404 Not Found", status: 404
  end


end
