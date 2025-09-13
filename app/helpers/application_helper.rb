module ApplicationHelper
  def debug_info(object = nil)
    return unless Rails.env.development?

    content_tag :div, class: 'debug-info bg-gray-100 p-4 my-4 rounded border-l-4 border-blue-500' do
      content = content_tag(:h4, 'Debug Information', class: 'font-bold text-blue-700 mb-2')

      if object
        content += content_tag(:pre, JSON.pretty_generate(object.as_json), class: 'text-sm bg-white p-2 rounded overflow-auto')
      else
        content += content_tag(:p, "Current User: #{current_user&.email || 'None'}", class: 'text-sm')
        content += content_tag(:p, "Current Path: #{request.path}", class: 'text-sm')
        content += content_tag(:p, "Request Method: #{request.method}", class: 'text-sm')
        content += content_tag(:p, "Rails Environment: #{Rails.env}", class: 'text-sm')
      end

      content
    end
  end

  def development_only(&block)
    yield if Rails.env.development?
  end
end
