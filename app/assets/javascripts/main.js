$( document ).ready(function() {
  addReadButtons();
  addUnreadButtons();
})

function addReadButtons() {
  $("table").on("click", ".read", function() {
    var linkNumber = this.id.slice(5)
    markRead(linkNumber)
    changeStatus(linkNumber, true)
  })
}

function markRead(linkNumber) {
  $("#" + linkNumber).html("true")
}

function addUnreadButtons() {
  $("table").on("click", ".unread", function() {
    var linkNumber = this.id.slice(7)
    markUnread(linkNumber)
    changeStatus(linkNumber, false)
  })
}

function markUnread(linkNumber) {
  $("#" + linkNumber).html("false")
}

function changeStatus(linkNumber, value) {
  
}
