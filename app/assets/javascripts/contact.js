/**	CONTACT FORM
*************************************************** **/
var _hash = window.location.hash;

//-------------------------------------------------------------------------
$(".row-1, .row-2, .row-3, .row-4").hide()
$("input").keyup(function() {	
		calculMain();
		radioButton();
		$("input[name='quote[service_level]']").change(function() {
			radioButton();
		})
    });	

    $( document ).ready(function() {
        var choice = document.getElementById('quote_department');
        choice.addEventListener("change", department);
        choice.addEventListener("change", clear);
    });

// Function Choice of sector ---------------------------------------------------
var department = function(){
    var choice = document.getElementById('quote_department').value;
    
    
	if (choice === "Residential") {
		$(".row-1").show();
		$(".row-2, .row-3, .row-4").hide();
	}
	else if (choice === "Commercial"){
		$(".row-2").show();
		$(".row-1, .row-3, .row-4").hide();
	}
	else if (choice === "Corporate"){
		$(".row-3").show();
		$(".row-1, .row-2, .row-4").hide();	
	}
	else if (choice === "Hybrid"){
		$(".row-4").show();
		$(".row-1, .row-2, .row-3").hide();
	}
	else if (choice === "-"){
		$(".row-1, .row-2, .row-3, .row-4").hide()
	}	
}
//  Main fonction ----------------------------------------------------------------	
// check if all inputs are not empty and call the right function for right sector

var calculMain = function() {

	$(".form-control-1, .form-control-2, .form-control-3, .form-control-4").each(function(){
		if ($(this).val() === ""){
			clearPrice();
		}})

	if (document.getElementById('quote_department').value === "Residential"){

		if(document.getElementById('resi-app').value !== "" && document.getElementById('resi-floor').value !== ""){
			var residentiel = calculResi();
			calculPrix(residentiel);

			$("input[name='quote[service_level]']").change(function() {
				if(document.getElementById('resi-app').value !== "" && document.getElementById('resi-floor').value !== ""){
				calculPrix(residentiel);
			}})	
		}
		else {
			clearPrice();
		}
	}	

	else if (document.getElementById('quote_department').value === "Corporate"){

		if(document.getElementById('cor-floor').value !== "" && document.getElementById('cor-quar').value !== "" 
		&& document.getElementById('cor-occu').value !== ""){
			var corpo = calculCorpo();
			calculPrix(corpo);

			$("input[name='quote[service_level]']").change(function() {
				if(document.getElementById('cor-floor').value !== "" && document.getElementById('cor-quar').value !== "" 
				&& document.getElementById('cor-occu').value !== ""){
				calculPrix(corpo);
			}})	
		}
		else{
			clearPrice();
		}
	}
	else if (document.getElementById('quote_department').value === "Hybrid"){

		if(document.getElementById('hyb-floor').value !== "" && document.getElementById('hyb-quar').value !== "" 
		&& document.getElementById('hyb-occu').value !== ""){
			var corpo = calculCorpo();
			calculPrix(corpo);

			$("input[name='quote[service_level]']").change(function() {
				if(document.getElementById('hyb-floor').value !== "" && document.getElementById('hyb-quar').value !== "" 
				&& document.getElementById('hyb-occu').value !== ""){
				calculPrix(corpo);
			}})	
		}
		else {
			clearPrice();

		}
	}
	else if (document.getElementById('quote_department').value === "Commercial"){

		if (document.getElementById('com-asce').value !== ""){
			var comm = calculCommerce();
			calculPrix(comm);

			$("input[name='quote[service_level]']").change(function() {
				if (document.getElementById('com-asce').value !== ""){
					var comm = calculCommerce();
					calculPrix(comm);
				}
			})
		}
		else {
			clearPrice();
		}
	}
}
// Function that reset all inputs and prices-----------------------------------------------------
var clear = function(){
	clearPrice();
	$(".form-control-1, .form-control-2, .form-control-3, .form-control-4").each(function(){
		$(this).val("");
	})
}
// Function that reset all prices-----------------------------------------------------
var clearPrice = function(){
	document.getElementById('fees').innerHTML = "";
	document.getElementById('float-right-2').innerHTML ="";
	document.getElementById('float-right-1').innerHTML = "";
	document.getElementById('float-right-3').innerHTML = "";
}

/* Function calcul Commerce -------------------------------------------------------------
	return and show number of elevator needed for commerce
*/
var calculCommerce = function(){

	var nbr_ascen = parseInt(document.getElementById('com-asce').value);

	if (isNaN(nbr_ascen)){
		alert("One of your field is not a number. Try again")
		var list = document.getElementsByClassName('form-control-4');
		var i;
		for(i = 0; i < list.length; i++){
			list[i].value = "";
		}
	}
	else{
		if(!isNaN(nbr_ascen)){
			document.getElementById('float-right-1').innerHTML = nbr_ascen;
			$("#quote_number_of_elevators").val(nbr_ascen);
		}
	}
	return nbr_ascen;
}

/*Function calcul Corporate/Hybrid-----------------------------------------------------
	return and show number of elevator needed for corpo/hybrid
*/
var calculCorpo = function(){

	if (document.getElementById('quote_department').value === 'Corporate'){
		var floor = parseInt(document.getElementById('cor-floor').value);
		var quar = parseInt(document.getElementById('cor-quar').value);
		var occu = parseInt(document.getElementById('cor-occu').value);
	}
	else if (document.getElementById('quote_department').value === 'Hybrid'){
		var floor = parseInt(document.getElementById('hyb-floor').value);
		var quar = parseInt(document.getElementById('hyb-quar').value);
		var occu = parseInt(document.getElementById('hyb-occu').value);
	}

	if (isNaN(floor) || isNaN(occu) || isNaN(quar)){
		alert("One of your field is not a number. Try again")
		var list = document.getElementsByClassName('form-control-2');
		var i;
		for(i = 0; i < list.length; i++){
			list[i].value = "";
		}
	}
	else {
		var floor_quar = floor + quar;
		var nbr_ascen = Math.ceil((occu * floor_quar) / 1000);
		var colonnes = Math.ceil(floor_quar / 20);

		var total = Math.ceil(nbr_ascen / colonnes);
		var total = total * colonnes;

		if(!isNaN(total)){
			document.getElementById('float-right-1').innerHTML = total;
			$("#quote_number_of_elevators").val(total);
			}
		return total;
	}
}
/* Calcul for Residential ---------------------------------------------
	return and show number of elevator needed for residential
*/
var calculResi = function(){

		var app = parseInt(document.getElementById('resi-app').value);
		var floor = parseInt(document.getElementById('resi-floor').value);	

	if (isNaN(app) || isNaN(floor)) {
		alert("One of your field is not a number. Try again");	
		var list = document.getElementsByClassName('form-control-1');
		var i;
		for(i = 0; i < list.length; i++){
			list[i].value = "";
	}}

	else {
		var nbr_ascen = app / floor;
		nbr_ascen = (nbr_ascen / 6);
		var nbr_cages = (floor / 20);

		if( nbr_ascen < 1 ) {
			nbr_ascen = 1;
		}
		nbr_cages = Math.ceil(nbr_cages);
		nbr_ascen = Math.ceil(nbr_ascen);

		var total = (nbr_ascen * nbr_cages);

		if(!isNaN(total)){
		document.getElementById('float-right-1').innerHTML = total;
		$("#quote_number_of_elevators").val(total);
		}
		return total;
	}
		}		

/*  Function for radio-button for standard/premium/excelium-------------------------------------------------
		calcul final price for elevators and show it
 		param : le total d'ascensors 
 */
var calculPrix = function(totalAscensor){

	var radioValue = $("input[name='quote[service_level]']:checked").val();
	$("input[name='quote[service_level]']").change(function() {
		var radioValue = $("input[name='quote[service_level]']:checked").val();
		return radioValue;
	})
	var finalPrice;
	if (radioValue === "Standard"){
		finalPrice = (totalAscensor * 7565) * 1.1;
	}

	else if (radioValue === "Premium"){
		finalPrice = (totalAscensor * 12345) * 1.13;
	}

	else if (radioValue === "Excelium"){
		finalPrice = (totalAscensor * 15400) * 1.16;
	}

	if(!isNaN(finalPrice)){
		document.getElementById('float-right-3').innerHTML = finalPrice.toFixed(2) + " $";
		$("#quote_total_cost").val(finalPrice);
	}
}
// Function to show radio-button value-------------------------------------------------
var radioButton = function(){
	var radioValue = $("input[name='quote[service_level]']:checked").val();
	if (radioValue === "Standard"){

		document.getElementById('fees').innerHTML = "10%";
		document.getElementById('float-right-2').innerHTML = 7565 + " $";
	}
	else if (radioValue === "Premium"){

		document.getElementById('fees').innerHTML = "13%";
		document.getElementById('float-right-2').innerHTML = 12345 + " $";
	}
	else if (radioValue === "Excelium"){

		document.getElementById('fees').innerHTML = "16%";
		document.getElementById('float-right-2').innerHTML = 15400 + " $";
	}
}


/**
	BROWSER HASH - from php/contact.php redirect!
	#alert_success 		= email sent
	#alert_failed		= email not sent - internal server error (404 error or SMTP problem)
	#alert_mandatory	= email not sent - required fields empty
**/	jQuery(_hash).show();