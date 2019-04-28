document.addEventListener("turbolinks:load", function() {
  var clock = document.querySelector('.clock')
  if (clock) { 
    $(".clock").countdown(clock.dataset.endAt, function(event) {
      $(this).text(
        event.strftime('%M:%S')
      );
    }).on('finish.countdown', function() {
      window.location = '/test_passages/' + clock.dataset.testPassageId + '/result'
    });
  }
})
