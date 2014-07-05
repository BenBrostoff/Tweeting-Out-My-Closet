

// randomize radio buttons
$.fn.randomize = function(selector){
    (selector ? this.find(selector) : this).parent().each(function(){
        $(this).children(selector).sort(function(){
            return Math.random() - 0.5;
        }).detach().appendTo(this);
    });

    return this;
};

$(document).ready(function() {
  $('#shuffle').randomize("li");
  var tweet_id = $("p:first").text()
  var user_id = $("p.hidden_answer:first").text()
  $('.hidden_vote').hide()
  $('.hidden_answer').hide()

  //functionality for voting
  $(".first_button").on('click', function(e) {
    e.preventDefault();
    var ajaxRequest = $.ajax({
      url: 'play/vote/'+tweet_id+'',
      type: "POST",
      data: $('form').serialize(),
    });
    ajaxRequest.done(function(data) {
      console.log("YAY");
      console.log(tweet_id);
      console.log(user_id);
      console.log("TEST");
      $("p:first").text(data).css("background-color", "green").css("text-align", "center")
      $('.hidden_vote').show()
    });
    ajaxRequest.fail(function(response){
      console.log("Fail");
    });
  });

    // functionality for guessing tweet
    $(".second_button").on('click', function(e) {
    e.preventDefault();
    var ajaxRequest = $.ajax({
      url: 'play/guess/'+user_id+'',
      type: "POST",
      data: $('form').serialize(),
      dataType: "json"
    });
    ajaxRequest.done(function(data) {
      console.log("success");
      console.log(tweet_id);
      $('.hidden_answer').show()
      $('p.hidden_answer:first').text(data.message).css("background-color", data.color).css("text-align", "center")
    });
    ajaxRequest.fail(function(response){
      console.log("Fail");
    });
  });

});

