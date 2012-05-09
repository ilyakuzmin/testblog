module PostsHelper
  def order_by_created_at_link(name, direction)
    if params[:order] == direction
      content_tag(:a, right_arrow_icon + name)
    else
      link_to name, params.merge({:order => direction}), :remote => true
    end
  end

  def options_for_select_category
    categories = Category.arrange
    build_sub_categories(categories)
  end

  def categories_list(posts)
    posts_categories_id = posts.map(&:category_id)

    result = "".html_safe
    options_for_select_category.each do |option|

      result += content_tag :li do
        if params[:category].to_i == option[1]
          name = right_arrow_icon + option[0].gsub(/&nbsp/, "")
          link_to name, params.merge({:category => nil}), :remote => true
        else
          link_to option[0], params.merge({:category => option[1]}), :remote => true
        end

      end

    end
    result
  end

  def link_to_tag(name, css_class)
    splited_tags = params[:tags] ? params[:tags].split(",") : []

    if splited_tags.include? name
      splited_tags.delete(name)
      result = content_tag(:a, name, :class => css_class)
      result += link_to '&times'.html_safe, params.merge({:tags => splited_tags.join(",")}), :class => 'close', :remote => true
    else
      splited_tags << name
      result = link_to name, params.merge({:tags => splited_tags.join(",")}), :remote => true
    end
    result
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

  def right_arrow_icon
    (content_tag :i, '', :class => "icon-arrow-right").html_safe
  end
end
