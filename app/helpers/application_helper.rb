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
    ' active' if params[:controller] == controller
  end

  def active_transaction_link?(account_id = nil)
    return if params[:controller] != 'transactions'
    return ' active' if account_id == nil && !params.key?(:account_id)
    ' active' if params.key?(:account_id) && params[:account_id].to_i == account_id
  end

  def delete_button(object, placement = 'top')
    return unless policy(object).destroy?
    data_hash = { confirm: "Are you sure you want to delete this #{object_name(object)}?", toggle: 'tooltip', placement: placement}
    title = "Delete #{object_name(object)}"
    link_to(object, method: :delete, data: data_hash, title: title, class: 'btn btn-sm btn-danger', role: 'button') do
      '<i class="fa fa-trash-o"></i>'.html_safe
    end.html_safe
  end

  def edit_button(object, placement = 'top')
    return unless policy(object).update?
    data_hash = {toggle: 'tooltip', placement: placement}
    title = "Edit #{object_name(object)}"
    edit_id = "edit_#{object.class.name}_#{object.id}"
    link_to(url_for([:edit, object]), title: title, data: data_hash, class: 'btn btn-sm btn-warning', role: 'button', id: edit_id) do
      '<i class="fa fa-pencil"></i>'.html_safe
    end.html_safe
  end

  def new_button(object, placement = 'bottom')
    return unless policy(object).create?
    data_hash = {toggle: 'tooltip', placement: placement}
    title = "Create new #{object_name(object)}"
    link_to(url_for("/#{object.class.name.downcase.pluralize}/new"), title: title, data: data_hash, class: 'btn btn-success', role: 'button') do
      "<i class=\"fa fa-plus\"></i> #{object_name(object)}".html_safe
    end.html_safe
  end

  private

  def object_name(object)
    object.class.name.humanize
  end
end
