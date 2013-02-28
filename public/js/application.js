$(document).ready( function (){
  $('.post-votes').click(function (e) {
    var id = $(this).attr('id')
    $.post('/upvote/post', {id: id}).done(function(data){
      $('#' +id+ '.post-votes').text(data.postvotes);
    }); 
  });
  $('.comment-votes').click(function (e) {
    var id = $(this).attr('id')
    $.post('/upvote/comment', {id: id}).done(function(data){
      $('#' +id+ '.comment-votes').text(data.commentvotes);
    }); 
  });
});
