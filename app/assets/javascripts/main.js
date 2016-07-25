$( document ).ready(function() {
  addReadButtons();
  addUnreadButtons();
  addSearch();
  addReadFilter();
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

function addSearch() {
  $("#search").keyup(function(){
    var links = $(".link");

    var searchTerm = $.trim(this.value);
    if (searchTerm === ""){
      links.show();
    } else {
      links.hide();
      links.has("td.title:contains(" + searchTerm + ")").show();
    }
  });
}

function addReadFilter() {
  var links = $(".link");

  $("#filter").on("click", "#show-read", function() {
    links.hide();
    links.has("td.read-status:contains('true')").show();
  })

  $("#filter").on("click", "#show-unread", function() {
    links.hide();
    links.has("td.read-status:contains('false')").show();
  })

  $("#filter").on("click", "#show-all", function() {
    links.show();
  })
}
