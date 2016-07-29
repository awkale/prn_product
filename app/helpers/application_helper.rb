module ApplicationHelper
  def title(page_title)
    content_for(:title) {page_title}
  end

  def ap_boolean(boolean)
    boolean ? 'AP' : 'not AP'
  end
end
