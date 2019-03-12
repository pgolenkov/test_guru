document.addEventListener("turbolinks:load", function() {
  var password_fields = document.querySelectorAll('input[autocomplete="new-password"]')

  password_fields.forEach(function(input) {
    input.addEventListener("input", checkPasswordIdentity)
  })
})

function checkPasswordIdentity() {
  var password_field = document.querySelector('#user_password')
  var password_confirmation_field = document.querySelector('#user_password_confirmation')

  var x_icon = document.querySelector(".check-icons .octicon-x")
  var check_icon = document.querySelector(".check-icons .octicon-check")

  if (!password_confirmation_field.value) {
    x_icon.classList.add('hide')
    check_icon.classList.add('hide')
    return
  }

  if (password_field.value === password_confirmation_field.value) {
    x_icon.classList.add('hide')
    check_icon.classList.remove('hide')
  } else {
    x_icon.classList.remove('hide')
    check_icon.classList.add('hide')
  }
}
