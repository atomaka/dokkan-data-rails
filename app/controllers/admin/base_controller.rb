class Admin::BaseController < ApplicationController
  layout 'admin'

  private

  def undo_link(item)
    view_context.link_to('Undo this change',
                         admin_revert_version_path(id: item.versions.last),
                         method: :post)
  end
end
