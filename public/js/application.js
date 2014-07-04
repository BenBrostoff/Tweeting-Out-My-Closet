
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

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
  var user_id = $("p:first").text()

  $("body").on('submit', function(e) {
    e.preventDefault();
    var ajaxRequest = $.ajax({
      url: 'play/guess/'+user_id+'',
      type: "POST",
      data: $('form').serialize()
    });
    ajaxRequest.done(function(data) {
      // Putting src file path into empty src= in the img div in the view
      console.log(data);
    });
    ajaxRequest.fail(function(response){
      console.log("Fail");
    });
  });
});

