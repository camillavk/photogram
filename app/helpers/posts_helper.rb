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

end
