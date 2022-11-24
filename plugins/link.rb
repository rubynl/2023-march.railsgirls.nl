module Link
  def link_to_active(label, path, selector = nil)
    options = {}
    options[:class] = "active" if current_path?(selector || path)
    # Only on full match mark it as active
    options["aria-current"] = "page" if current_path?(path)
    link_to label, path, options
  end

  def current_path
    return unless view.resource.destination

    view.resource.destination.relative_url
  end

  def current_path?(selector)
    if selector.is_a? Regexp
      current_path =~ selector
    else
      current_path == selector
    end
  end
end

Bridgetown::RubyTemplateView::Helpers.include Link
