module TasksHelper
  def sort_link_helper(param)
    key = param
    key += '_reverse' if params[:sort] == param
    options = { url: { action: 'sort', sort: key } }
    html_options = { action: 'sort', sort: key }
    link_to(options, html_options, class: 'glyphicon glyphicon-sort')
  end
end
