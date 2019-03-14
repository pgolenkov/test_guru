document.addEventListener("turbolinks:load", function() {
  var progressBar = document.querySelector('.progress-bar')
  if (progressBar) {
    var number = progressBar.dataset.number
    var count = progressBar.dataset.count

    if (number && count) {
      var width = (number - 1) / count * 100
      progressBar.setAttribute("style", "width:" + width.toString() + "%")
    }
  }
})
