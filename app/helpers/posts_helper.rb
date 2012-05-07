module PostsHelper
  def order_by_created_at_link(name, direction)
    if params[:order] == direction
      content_tag(:a, content_tag(:i, '', :class => "icon-arrow-right").html_safe + name)
    else
      link_to name, params.merge({:order => direction}), :remote => true
    end
  end

  def options_for_select_category
    categories = Category.arrange
    build_sub_categories(categories)
  end

  private
  def build_sub_categories(categories, depth = 0)
    result = []
    categories.each do |key, value|
      result << [("&nbsp&nbsp&nbsp"*depth+key.name).html_safe, key.id]
      if value.present?
        result += build_sub_categories(value, depth + 1)
      end
    end
    result
  end
end
