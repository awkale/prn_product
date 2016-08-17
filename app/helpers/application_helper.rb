module ApplicationHelper
  def title(page_title)
    content_for(:title) {page_title}
  end

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    link_to "#{title} <i class='#{css_class == "current asc" ? "bts bt-caret-up" : ""} #{css_class == "current desc" ? "bts bt-caret-down" : ""}'></i>".html_safe, {:sort => column, :direction => direction}, {:class => css_class}
  end

  def ap_boolean(boolean)
    boolean ? 'AP' : 'not AP'
  end

  def nested_ul(objects, &block)
    objects = objects.order(:lft) if objects.is_a? Class

    return '' if objects.size == 0

    output = '<ul><li>'
    path = [nil]

    objects.each_with_index do |o, i|
      if o.parent_id != path.last
        # We are on a new level, did we descend or ascend?
        if path.include?(o.parent_id)
          # Remove the wrong trailing path elements
          while path.last != o.parent_id
            path.pop
            output << '</li></ul>'
          end
          output << '</li><li>'
        else
          path << o.parent_id
          output << '<ul><li>'
        end
      elsif i != 0
        output << '</li><li>'
      end
      output << capture(o, path.size - 1, &block)
    end

    output << '</li></ul>' * path.length
    output.html_safe
  end

  def sorted_nested_ul(objects, order, &block)
    nested_ul sort_list(objects, order), &block
  end

  private

  def sort_list(objects, order)
    objects = objects.order(:lft) if objects.is_a? Class

   # Partition the results
    children_of = {}
    objects.each do |o|
      children_of[ o.parent_id ] ||= []
      children_of[ o.parent_id ] << o
    end

    # Sort each sub-list individually
    children_of.each_value do |children|
      children.sort_by! &order
    end

    # Re-join them into a single list
    results = []
    recombine_lists(results, children_of, nil)

    results
  end

  def recombine_lists(results, children_of, parent_id)
    if children_of[parent_id]
      children_of[parent_id].each do |o|
        results << o
        recombine_lists(results, children_of, o.id)
      end
    end
  end
end
