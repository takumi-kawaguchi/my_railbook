module ViewHelper
  def yobareru
    "yobareru"
  end

  def list_tag(collection, prop)
    content_tag(:ul) do
      collection.each do |element|
        concat content_tag(:li, element.attributes[prop])
      end
    end
  end

  def blockquote_tag(cite, citetext, options = {}, &block)
    options.merge! cite: cite

    quote_tag = content_tag(:blockquote, capture(&block), options)

    p_tag = content_tag(:p) do
      concat '出典: '
      concat content_tag(:cite, citetext)
    end

    quote_tag.concat(p_tag)
  end
end
