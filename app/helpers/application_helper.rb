module ApplicationHelper
  def nav_link_to(text, path)
    options = current_controller?(path) ? { class: 'active' } : {}

    content_tag(:li, options) { link_to text, path }
  end

  def bootstrap_class_for(flash_type)
    bootstrap_classes[flash_type] || flash_type.to_s
  end

  def glyph(icon, options = {})
    options = options.reverse_merge(default_glyph_options)

    classes = options[:color] + " " + options[:classes]
    content_tag(:i, class: "glyphicon glyphicon-#{icon} " + classes) {}
  end

  def login_path(provider)
    "/auth/#{provider.to_s}"
  end

  private

  def bootstrap_classes
    {
      'alert'   => 'alert-warning',
      'error'   => 'alert-danger',
      'notice'  => 'alert-info',
      'success' => 'alert-success'
    }
  end

  def default_glyph_options
    {
      :color   => '',
      :classes => ''
    }
  end

  def current_controller?(path)
    path.split('/')[1] == params[:controller]
  end
end
