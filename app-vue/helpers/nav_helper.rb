module NavHelper
  def nav_link_to(name = nil, options = {}, html_options = {}, &block)
    name, options, html_options = block, name, options if block

    url = url_for(options)
    starts_with = html_options.delete(:starts_with)
    html_options[:class] ||= []
    active_class = html_options.delete(:active_class) || 'is-active'
    inactive_class = html_options.delete(:inactive_class) || ''

    active = Array.wrap(starts_with).any? { |path| request.path.start_with?(path) } || request.path == url
    html_options[:class] << (active ? " #{active_class}" : " #{inactive_class}")

    html_options.except!(:class) if html_options[:class].empty?

    link_to(name, url, html_options, &block)
  end


end
