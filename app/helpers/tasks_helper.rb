module TasksHelper

  def sort_link_helper(text, param)
    key = param
    key += '_reverse' if params[:sort] == param
    url = { action: 'sort', sort: key }
    link_to(text, url, class: 'glyphicon glyphicon-sort')
  end
end
