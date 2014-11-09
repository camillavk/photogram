module CommentsHelper

  def add_comment(post)
    link_to "Comment on #{post.caption}", new_post_comment_path(post) if can?(:create, Comment)
  end

  def delete_comment(comment)
    link_to "Delete comment", comment_path(comment), method: :delete if can?(:destroy, comment)
  end

end
