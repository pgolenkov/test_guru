document.addEventListener("turbolinks:load", function() {
  var control = document.querySelector(".sort-by-title")

  if (control) { control.addEventListener("click", sortRowsByTitle) }
})

function sortRowsByTitle() {
  var table = document.querySelector(".table")

  var rows = table.querySelectorAll(".row")
  var sortedRows = []

  for (var i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  var arrowUp = this.querySelector(".octicon-arrow-up")
  var arrowDown = this.querySelector(".octicon-arrow-down")

  if (arrowUp.classList.contains("hide")) {
    sortedRows.sort(compareRowsAsc)
    arrowUp.classList.remove("hide")
    arrowDown.classList.add("hide")
  } else {
    sortedRows.sort(compareRowsDesc)
    arrowUp.classList.add("hide")
    arrowDown.classList.remove("hide")
  }

  var sortedTable = document.createElement("div")
  sortedTable.classList.add("table")
  sortedTable.appendChild(rows[0])

  for (var i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i])
  }

  table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
  var testTitle1 = row1.querySelector(".title").textContent;
  var testTitle2 = row2.querySelector(".title").textContent;

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

function compareRowsDesc(row1, row2) {
  var testTitle1 = row1.querySelector(".title").textContent;
  var testTitle2 = row2.querySelector(".title").textContent;

  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0
}
