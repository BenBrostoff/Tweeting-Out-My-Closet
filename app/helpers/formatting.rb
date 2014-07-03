helpers do
  def em(text)
    "<em>#{text}</em>"
  end

  def randomize_buttons(a, b, c, d, e)
    array = [a, b, c, d, e]
    array.shuffle
  end

end
