$(document).ready(function () {
  $('.likes_link').on('click', function(event){
    event.preventDefault();

    var likeCount = $(this).siblings('.likes_count');

    $.post(this.href, function(response){
      // debugger
      likeCount.text(response.new_likes_count);
    });
    $(this).hide();
  });
});
