module PostsHelper
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
