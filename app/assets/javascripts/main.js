$( document ).ready(function() {
  addReadButtons();
  addUnreadButtons();
})

function addReadButtons() {
  $("table").on("click", ".read", function() {
    var linkNumber = this.id.slice(5)
    markRead(linkNumber)
    changeStatus(linkNumber, {read: "true"})
  })
}

function markRead(linkNumber) {
  $("#" + linkNumber + " :nth-child(2)").html("true")
  $("#" + linkNumber).removeClass("false").addClass("true")
}

function addUnreadButtons() {
  $("table").on("click", ".unread", function() {
    var linkNumber = this.id.slice(7)
    markUnread(linkNumber)
    changeStatus(linkNumber, {read: "false"})
  })
}

function markUnread(linkNumber) {
  $("#" + linkNumber + " :nth-child(2)").html("false")
  $("#" + linkNumber).removeClass("true").addClass("false")
}

function changeStatus(linkNumber, params) {
  $.ajax({
    url: "api/v1/links/" + linkNumber,
    type: 'PATCH',
    data: params,
  });
}
