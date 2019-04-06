var _hash = window.location.hash;


const uri = "http://rocket-elevator-api.azurewebsites.net";

// init all tables hide
$("#elevator, #building, #column, #lead, #battery, #elevatorid, #buildingid, #columnid, #leadid, #batteryid").hide()

// show battery table
function show_table_bat(){
    $("#batteryid, #elevator, #building, #column, #lead, #elevatorid, #buildingid, #columnid, #leadid").hide()
    $("#battery").show()
}
// show elevator table
function show_table_ele(){
    $("#elevatorid, #battery, #building, #column, #lead, #batteryid, #buildingid, #columnid, #leadid").hide()
    $("#elevator").show()
}
// show column table 
function show_table_col(){
    $("#columnid, #elevator, #building, #battery, #lead, #elevatorid, #buildingid, #batteryid, #leadid").hide()
    $("#column").show()
}
// show lead table
function show_table_lead(){
    $("#leadid, #elevator, #building, #column, #battery, #elevatorid, #buildingid, #columnid, #batteryid").hide()
    $("#lead").show()
}
//show building table 
function show_table_buil(){
    $("#buildingid, #elevator, #battery, #column, #lead, #elevatorid, #batteryid, #columnid, #leadid").hide()
    $("#building").show()
}
//-------------------------------------------------------------------------------------

function show_table_bat_id(){
    $("#battery, #elevator, #building, #column, #lead, #elevatorid, #buildingid, #columnid, #leadid").hide()
    $("#batteryid").show()
}


function show_table_ele_id(){
    $("#elevator, #battery, #building, #column, #lead, #batteryid, #buildingid, #columnid, #leadid").hide()
    $("#elevatorid").show()
}

function show_table_col_id(){
    $("#column, #elevator, #building, #battery, #lead, #elevatorid, #buildingid, #batteryid, #leadid").hide()
    $("#columnid").show()
}


    $( document ).ready(function() {
        getElvetorId();
    });

    $( document ).ready(function() {
        getBatteryId();
    });

    $( document ).ready(function() {
        getColId();
    });

    function editItemEle() {
      var table_1 = $('#table_6').DataTable()
      var data = table_1.row(0).data()[0]

    var id = data.toString()
    $("#but-elev").on("submit", function(e) {
      e.preventDefault()
      const item = {
        status: $("#forme-1").val(), 
      }
      
      $.ajax({
        url: uri+"/api/elevator/"+id,
        type: "PUT",
        accepts: "application/json",
        contentType: "application/json",
        data: JSON.stringify(item),
        success: function(result) {
          getDataElev()
        }
      })
    })};

    // get elevator by id

function getElvetorId() {
    
        $('#table_1 tbody').on('click', 'tr', function () {
            var table = $('#table_1').DataTable();
            var data_table = table.row( this ).data();
            var id_ele = data_table[0]

        $.ajax({
            type: "GET",
            url: uri+"/api/elevator/"+id_ele,
            cache: false,
            success: function(data) {
              const tBody = $("#elevid");
              $(tBody).empty();
        
                const tr = $("<tr></tr>")
                  .append($("<td></td>").text(data.id))
                  .append($("<td></td>").text(data.column_id))
                  .append($("<td></td>").text(data.serial_number))
                  .append($("<td></td>").text(data.model_type))
                  .append($("<td></td>").text(data.building_type))
                  .append($("<td></td>").text(data.status))
                  .append($("<td></td>").text(data.date_of_install))
                  .append($("<td></td>").text(data.date_of_inspect))
                  .append($("<td></td>").text(data.inspect_certificate))
                  .append($("<td></td>").text(data.information))
                  .append($("<td></td>").text(data.notes))
        
                tr.appendTo(tBody);
                tatbl_1 = data;
            }
            
          })
          show_table_ele_id()

        }

        )}
//  get column by id 

        function getColId() {
            $('#table_2 tbody').on('click', 'tr', function () {
                var table = $('#table_2').DataTable();
                var data_table = table.row( this ).data();
                var id_ele = data_table[0]
            $.ajax({
                type: "GET",
                url: uri+"/api/column/"+id_ele,
                cache: false,
                success: function(data) {
                  const tBody = $("#colid");
                  $(tBody).empty();
            
                    const tr = $("<tr></tr>")
                      .append($("<td></td>").text(data.id))
                      .append($("<td></td>").text(data.battery_id))
                      .append($("<td></td>").text(data.building_type))
                      .append($("<td></td>").text(data.status))
                      .append($("<td></td>").text(data.number_of_floors))
                      .append($("<td></td>").text(data.notes))
                      .append($("<td></td>").text(data.informations))
            
                    tr.appendTo(tBody);
    
                  todos = data;
                  show_table_col_id()
 
                }
              })
            }
        )}

        // get battery by id 

            function getBatteryId() {
                $('#table_3 tbody').on('click', 'tr', function () {
                    var table = $('#table_3').DataTable();
                    var data_table = table.row( this ).data();
                    var id_ele = data_table[0]
                $.ajax({
                    type: "GET",
                    url: uri+"/api/battery/"+id_ele,
                    cache: false,
                    success: function(data) {
                      const tBody = $("#batid");
                      $(tBody).empty();
                
                        const tr = $("<tr></tr>")
                          .append($("<td></td>").text(data.id))
                          .append($("<td></td>").text(data.building_id))
                          .append($("<td></td>").text(data.user_id))
                          .append($("<td></td>").text(data.building_type))
                          .append($("<td></td>").text(data.status))
                          .append($("<td></td>").text(data.date_of_install))
                          .append($("<td></td>").text(data.date_of_inspect))
                          .append($("<td></td>").text(data.inspect_certificate))
                          .append($("<td></td>").text(data.information))
                
                        tr.appendTo(tBody);
        
  
                      todos = data;
                      show_table_bat_id()
 
                    }
                  })
               }
                
           )}

// get all elevator
function getDataElev() {

  $.ajax({
    type: "GET",
    url: uri+"/api/elevator",
    cache: false,
    success: function(data) {
      const tBody = $("#elev");

      $(tBody).empty();

      $.each(data, function(key, item) {
        const tr = $("<tr></tr>")
          .append($("<td></td>").text(item.id))
          .append($("<td></td>").text(item.column_id))
          .append($("<td></td>").text(item.serial_number))
          .append($("<td></td>").text(item.model_type))
          .append($("<td></td>").text(item.building_type))
          .append($("<td></td>").text(item.status))

        tr.appendTo(tBody);
      });

      todos = data;
    }
  })
  show_table_ele()
}

// get all column 

function getDataCol() {
    $.ajax({
      type: "GET",
      url: uri+"/api/column",
      cache: false,
      success: function(data) {
        const tBody = $("#col");

        $(tBody).empty();
  
        $.each(data, function(key, item) {
          const tr = $("<tr></tr>")
            .append($("<td></td>").text(item.id))
            .append($("<td></td>").text(item.battery_id))
            .append($("<td></td>").text(item.building_type))
            .append($("<td></td>").text(item.status))

          tr.appendTo(tBody);
        });
  
        todos = data;
      }
    })
    show_table_col()
  }


  // get all baterries
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
  
          tr.appendTo(tBody);
        });
  
        todos = data;
      }
    })
    show_table_bat();
  }
// get all building 

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
// get all leads

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
  
          tr.appendTo(tBody);
        });
  
        todos = data;
      }
    })
    show_table_lead();
  }




/**
	BROWSER HASH - from php/contact.php redirect!

	#alert_success 		= email sent
	#alert_failed		= email not sent - internal server error (404 error or SMTP problem)
	#alert_mandatory	= email not sent - required fields empty
**/	jQuery(_hash).show();