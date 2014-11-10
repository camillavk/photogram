module PostsHelper

  def show_post(post)
    link_to "#{post.caption}", post_path(post), 'data-no-turbolink' => true
  end

  def edit_post(post)
    link_to "Edit #{post.caption}", edit_post_path(post) if can?(:update, post)
  end

  def delete_post(post)
    link_to "Delete #{post.caption}", post_path(post), method: :delete if can?(:destroy, post)
  end

  def post_price(post)
    "£#{'%.2f' % post.price}"
  end

  def buy_now(post)
    link_to "Buy Now", new_post_charge_path(post)
  end

end
