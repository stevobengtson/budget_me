# frozen_string_literal: true
module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = 'Budget Me'
    return base_title if page_title.empty?
    base_title + ' - ' + page_title
  end

  def bootstrap_class_for(flash_type)
    {success: 'alert-success', error: 'alert-danger', alert: 'alert-warning', notice: 'alert-info'}[flash_type.to_sym] || flash_type.to_s
  end

  def active_link?(controller)
    ' class="active"' if params[:controller] == controller
  end
end
