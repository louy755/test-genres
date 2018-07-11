module GenresHelper
  def selected(id)
    'chosen' if session["#{id}"].present?
  end

  def reveal_name(id)
    'hidden' if session["#{id}"].present?
  end

  def chosen(id)
    'hidden' unless session["#{id}"].present?
  end
end
