var _hash = window.location.hash;


const uri = "http://rocket-elevator-api.azurewebsites.net";

// init all tables hide
$("#elevator, #building, #column, #lead, #battery").hide()

// show battery table
function show_table_bat(){
    $("#elevator, #building, #column, #lead").hide()
    $("#battery").show()
}
// show elevator table
function show_table_ele(){
    $("#battery, #building, #column, #lead").hide()
    $("#elevator").show()
}
// show column table 
function show_table_col(){
    $("#elevator, #building, #battery, #lead").hide()
    $("#column").show()
}
// show lead table
function show_table_lead(){
    $("#elevator, #building, #column, #battery").hide()
    $("#lead").show()
}
//show building table 
function show_table_buil(){
    $("#elevator, #battery, #column, #lead").hide()
    $("#building").show()
}


function getDataElev() {

  $.ajax({
    type: "GET",
    url: uri+"/api/elevator",
    cache: false,
    success: function(data) {
      const tBody = $("#elev");

      $(tBody).empty();

    //   getCount(data.length);

      $.each(data, function(key, item) {
        const tr = $("<tr></tr>")
          .append($("<td></td>").text(item.id))
          .append($("<td></td>").text(item.column_id))
          .append($("<td></td>").text(item.serial_number))
          .append($("<td></td>").text(item.model_type))
          .append($("<td></td>").text(item.building_type))
          .append($("<td></td>").text(item.status))
          .append($("<td></td>").text(item.date_of_install))
          .append($("<td></td>").text(item.date_of_inspect))
          .append($("<td></td>").text(item.inspect_certificate))

        tr.appendTo(tBody);
      });

      todos = data;
    }
  })
  show_table_ele()
}

function getDataCol() {
    $.ajax({
      type: "GET",
      url: uri+"/api/column",
      cache: false,
      success: function(data) {
        const tBody = $("#col");

        $(tBody).empty();
  
      //   getCount(data.length);
  
        $.each(data, function(key, item) {
          const tr = $("<tr></tr>")
            .append($("<td></td>").text(item.id))
            .append($("<td></td>").text(item.battery_id))
            .append($("<td></td>").text(item.building_type))
            .append($("<td></td>").text(item.status))
            .append($("<td></td>").text(item.number_of_floors))

          tr.appendTo(tBody);
        });
  
        todos = data;
      }
    })
    show_table_col()
  }

  function getDataBat() {
    $.ajax({
      type: "GET",
      url: uri+"/api/battery",
      cache: false,
      success: function(data) {
        const tBody = $("#bat");

        $(tBody).empty();
  
        $.each(data, function(key, item) {
          const tr = $("<tr></tr>")
            .append($("<td></td>").text(item.id))
            .append($("<td></td>").text(item.building_id))
            .append($("<td></td>").text(item.user_id))
            .append($("<td></td>").text(item.building_type))
            .append($("<td></td>").text(item.status))
            .append($("<td></td>").text(item.date_of_install))
            .append($("<td></td>").text(item.date_of_inspect))
            .append($("<td></td>").text(item.inspect_certificate))
  
          tr.appendTo(tBody);
        });
  
        todos = data;
      }
    })
    show_table_bat();
  }

  function getDataBuil() {
    $.ajax({
      type: "GET",
      url: uri+"/api/building",
      cache: false,
      success: function(data) {
        const tBody = $("#buil");
  
        $(tBody).empty();
  
        $.each(data, function(key, item) {
          const tr = $("<tr></tr>")
            .append($("<td></td>").text(item.id))
            .append($("<td></td>").text(item.address_id))
            .append($("<td></td>").text(item.full_name_admin_person))
            .append($("<td></td>").text(item.email_admin_person))
            .append($("<td></td>").text(item.phone_number_admin_person))
            .append($("<td></td>").text(item.full_name_tech_person))
            .append($("<td></td>").text(item.email_tech_person))
            .append($("<td></td>").text(item.phone_number_tech_person))
  
          tr.appendTo(tBody);
        });
  
        todos = data;
      }
    })
    show_table_buil();
  }

  function getDataLead() {
    $.ajax({
      type: "GET",
      url: uri+"/api/lead",
      cache: false,
      success: function(data) {
        const tBody = $("#lea");
  
        $(tBody).empty();

  
        $.each(data, function(key, item) {
          const tr = $("<tr></tr>")
            .append($("<td></td>").text(item.id))
            .append($("<td></td>").text(item.customer_id))
            .append($("<td></td>").text(item.full_name))
            .append($("<td></td>").text(item.company_name))
            .append($("<td></td>").text(item.email))
            .append($("<td></td>").text(item.phone_number))
            .append($("<td></td>").text(item.project_name))
            .append($("<td></td>").text(item.department_in_charge))
            .append($("<td></td>").text(item.created_at))
            .append($("<td></td>").text(item.updated_at))
  
          tr.appendTo(tBody);
        });
  
        todos = data;
      }
    })
    show_table_lead();
  }

function editItem(id) {
  $.each(todos, function(key, item) {
    if (item.id === id) {
      $("#edit-name").val(item.name);
      $("#edit-id").val(item.id);
      $("#edit-isComplete")[0].checked = item.isComplete;
    }
  });
  $("#spoiler").css({ display: "block" });
}

$(".my-form").on("submit", function() {
  const item = {
    name: $("#edit-name").val(),
    isComplete: $("#edit-isComplete").is(":checked"),
    id: $("#edit-id").val()
  };


  $.ajax({
    url: uri + "/" + $("#edit-id").val(),
    type: "PUT",
    accepts: "application/json",
    contentType: "application/json",
    data: JSON.stringify(item),
    success: function(result) {
      getData();
    }
  });

  closeInput();
  return false;
});

function closeInput() {
  $("#spoiler").css({ display: "none" });
}

/**
	BROWSER HASH - from php/contact.php redirect!

	#alert_success 		= email sent
	#alert_failed		= email not sent - internal server error (404 error or SMTP problem)
	#alert_mandatory	= email not sent - required fields empty
**/	jQuery(_hash).show();