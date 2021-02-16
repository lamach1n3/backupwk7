$("#number-of-apartments").hide();
$("#number-of-floors").hide();
$("#number-of-basements").hide();
$("#number-of-companies").hide();
$("#number-of-parking-spots").hide();
$("#number-of-elevators").hide();
$("#number-of-corporations").hide();
$("#maximum-occupancy").hide();
$("#business-hours").hide();
$("#RecoElev").hide();
$("#InstaCost").hide();
$("#PricePerElevator").hide();
$("#TotalCostforElev").hide();
$("#PriceTotal").hide();
$("#Building_option").on('change', function (){

    var chooses = $("#Building_option option:selected").val();
    console.log("select");
    if (chooses == "select" ){
        console.log("select");
        $("#number-of-apartments").hide();
        $("#number-of-floors").hide();
        $("#number-of-basements").hide();
        $("#number-of-companies").hide();
        $("#number-of-parking-spots").hide();
        $("#number-of-elevators").hide();
        $("#number-of-corporations").hide();
        $("#maximum-occupancy").hide();
        $("#business-hours").hide(); 
        $("#RecoElev").hide();
        $("#InstaCost").hide();
        $("#PricePerElevator").hide();
        $("#TotalCostforElev").hide();
        $("#PriceTotal").hide();
    };
    if(chooses == "residential" ){
        $("#number-of-apartments").show();
        $("#number-of-floors").show();
        $("#number-of-basements").show();
        $("#number-of-companies").hide();
        $("#number-of-parking-spots").hide();
        $("#number-of-elevators").hide();
        $("#number-of-corporations").hide();
        $("#maximum-occupancy").hide();
        $("#business-hours").hide();
        $("#RecoElev").show();
        $("#InstaCost").show();
        $("#PricePerElevator").show();
        $("#TotalCostforElev").show();
        $("#PriceTotal").show();
    };
    if(chooses == "commercial" ){
        $("#number-of-apartments").hide();
        $("#number-of-floors").show();
        $("#number-of-basements").show();
        $("#number-of-companies").show();
        $("#number-of-parking-spots").show();
        $("#number-of-elevators").show();
        $("#number-of-corporations").hide();
        $("#maximum-occupancy").hide();
        $("#business-hours").hide();
        $("#RecoElev").show();
        $("#InstaCost").show();
        $("#PricePerElevator").show();
        $("#TotalCostforElev").show();
        $("#PriceTotal").show();
    };
    if(chooses == "corporate" ){
        $("#number-of-apartments").hide();
        $("#number-of-floors").show();
        $("#number-of-basements").show();
        $("#number-of-companies").hide();
        $("#number-of-parking-spots").show();
        $("#number-of-elevators").hide();
        $("#number-of-corporations").show();
        $("#maximum-occupancy").show();
        $("#business-hours").hide();
        $("#RecoElev").show();
        $("#InstaCost").show();
        $("#PricePerElevator").show();
        $("#TotalCostforElev").show();
        $("#PriceTotal").show();
    };
    if(chooses == "hybrid" ){
        $("#number-of-apartments").hide();
        $("#number-of-floors").show();
        $("#number-of-basements").show();
        $("#number-of-companies").show();
        $("#number-of-parking-spots").show();
        $("#number-of-elevators").hide();
        $("#number-of-corporations").hide();
        $("#maximum-occupancy").show();
        $("#business-hours").show();
        $("#RecoElev").show();
        $("#InstaCost").show();
        $("#PricePerElevator").show();
        $("#TotalCostforElev").show();
        $("#PriceTotal").show();
    };
    console.log(chooses);
  });
    var NumberOfAppartment = document.getElementById("number-of-apartments_input");
    var NumberOfFloors = document.getElementById("number-of-floors_input");
    var NumberOfBasement = document.getElementById("number-of-basements");
    var NumberOfBusinesses = document.getElementById("number-of-companies_input");
    var NumberOfParking = document.getElementById("number-of-parking-spots_input");
    var NumberOfElevatorCages = document.getElementById("number-of-elevators_input");
    var NumberOfTenantCompanies = document.getElementById("number-of-corporations_input");
    var NumberOfOccupentsPerFloors = document.getElementById("maximum-occupancy_input");
    var NumberOfHoursOfActivityInTheBuilding = document.getElementById("business-hours_input");
    var RecommendedElevator = document.getElementById("ElevatorRec_input");
    var InstaCost = document.getElementById("InstaCost_input");
    var PricePerElevator = document.getElementById("PricePerElevator_input");
    var TotalCostforElev = document.getElementById("TotalCostforElev_input");
    var PriceTotal = document.getElementById("PriceTotal_input");



    function commercial () {
        RecommendedElevator.value = NumberOfElevatorCages.value
    };

    function residential () {
      var AverageOfApartment = NumberOfAppartment.value / NumberOfFloors.value;
      console.log(AverageOfApartment + " taf")
      var elevCage = Math.ceil(AverageOfApartment / 6);
      console.log(elevCage + " elevCage")
      var numer_colon = Math.ceil(NumberOfFloors.value / 20);
      console.log(numer_colon)
      var ElevatorPerColon =  numer_colon * elevCage;
      console.log(ElevatorPerColon)
      RecommendedElevator.value = ElevatorPerColon
    };

    function Corporate_Hybrid () {
    var total_Floors = parseInt(NumberOfFloors.value) + parseInt(NumberOfBasement.value);
    console.log(total_Floors + " total_Floors");
    var totalPersonnes =  NumberOfOccupentsPerFloors.value * total_Floors;
    console.log(totalPersonnes + " totalPersonnes");
    var Number_elevator = Math.ceil(totalPersonnes / 1000);
    console.log(Number_elevator + " Number_elevator");
    var number_colone = Math.ceil(total_Floors / 20);
    console.log(number_colone + " number_colone");
    var elevator_per_colone = Math.ceil(Number_elevator / number_colone);
    console.log(elevator_per_colone + " elevator_per_colone");
    var total =  elevator_per_colone * number_colone;
    console.log(total + " total");
    RecommendedElevator.value = total;
    };

    $("input[type='radio']").on('click', function(){
        var type = $("input[name='services']:checked").val();
        if(type == "7565"){
            PricePerElevator.value = type;
            TotalCostforElev.value = PricePerElevator.value * RecommendedElevator.value
        }
        if(type == "12345"){
            PricePerElevator.value = type;
        }
        if(type == "15400"){
            PricePerElevator.value = type;
        }
    });
    
    $("input").on('keyup click',function () {
        var TypeValue = $("#Building_option option:selected").val();
       if(TypeValue=="residential"){
        residential();
       }
       if(TypeValue=="commercial"){
        commercial();
       }
       if(TypeValue=="corporate"){
        Corporate_Hybrid();
       }
       if(TypeValue=="hybrid"){
        Corporate_Hybrid();
       }
    });
    
    / HIDE AND SHOW Selection
    $(document).ready(function(){
      $("#building-type").on('change', function(){
          $(".data").hide();
          $("#" + $(this).val()).fadeIn(300);
      }).change
    })
    // HIDE AND SHOW Radio Button
    $(function() {
      $("input[name='service']").click(function() {
      if ($("#standard-radio").is(":checked")) {
      $("#elevator-unit-price-s").show();
      $("#label-unit-s").show();
      $("#elevator-total-price-s").show();
      $("#label-total-s").show();
      $("#installation-fees-s").show();
      $("#label-fee-s").show();
      $("#final-price-s").show();
      $("#label-final-s").show();
      } else {
      $("#elevator-unit-price-s").hide();
      $("#label-unit-s").hide();
      $("#elevator-total-price-s").hide();
      $("#label-total-s").hide();
      $("#installation-fees-s").hide();
      $("#label-fee-s").hide();
      $("#final-price-s").hide();
      $("#label-final-s").hide();
      }
    });
    });
    $(function() {
      $("input[name='service']").click(function() {
      if ($("#premium-radio").is(":checked")) {
      $("#elevator-unit-price-p").show();
      $("#label-unit-p").show();
      $("#elevator-total-price-p").show();
      $("#label-total-p").show();
      $("#installation-fees-p").show();
      $("#label-fee-p").show();
      $("#final-price-p").show();
      $("#label-final-p").show();
      } else {
      $("#elevator-unit-price-p").hide();
      $("#label-unit-p").hide();
      $("#elevator-total-price-p").hide();
      $("#label-total-p").hide();
      $("#installation-fees-p").hide();
      $("#label-fee-p").hide();
      $("#final-price-p").hide();
      $("#label-final-p").hide();
      }
    });
    });
    $(function() {
      $("input[name='service']").click(function() {
      if ($("#excelium-radio").is(":checked")) {
      $("#elevator-unit-price-e").show();
      $("#label-unit-e").show();
      $("#elevator-total-price-e").show();
      $("#label-total-e").show();
      $("#installation-fees-e").show();
      $("#label-fee-e").show();
      $("#final-price-e").show();
      $("#label-final-e").show();
      } else {
      $("#elevator-unit-price-e").hide();
      $("#label-unit-e").hide();
      $("#elevator-total-price-e").hide();
      $("#label-total-e").hide();
      $("#installation-fees-e").hide();
      $("#label-fee-e").hide();
      $("#final-price-e").hide();
      $("#label-final-e").hide();
      }
    });
    });
    //INPUT FIELDS
    // Residendial
    var numberAppartments = "number-of-apartments"
    var numberFloors = "number-of-floors"
    var numberBasements = "number-of-basements"
    // Commercial
    var numberCompanies = "number-of-companies"
    var numberParking = "number-of-parking-spots"
    var numberElevators = "number-of-elevators"
    // Corporate
    var numberCorporation = "number-of-corporations"
    var numberOccupancy = "maximum-occupancy"
    // Hybrid
    var numberHours = "business-hours"
    //RESULT INPUT
    //var totalOccupant = "total-number-of-occupant"
    //var elevatorAmount = "elevator-amount"
    //var elevatorRequire = "elevator-require"
    //var numberColumnsRequire = "number-of-columns-require"
    //var numberElevatorColumns = "number-of-elevator-columns"
    var totalElevator = "total-elevator"
    //BUDGET INPUT
    var elevatorUnitPriceS = "elevator-unit-price-s"
    var elevatorTotalPriceS = "elevator-total-price-s"
    var installationFeesS = "installation-fees-s"
    var finalPriceS = "final-price-s"
    var elevatorUnitPriceP = "elevator-unit-price-p"
    var elevatorTotalPriceP = "elevator-total-price-p"
    var installationFeesP = "installation-fees-p"
    var finalPriceP = "final-price-p"
    var elevatorUnitPriceE = "elevator-unit-price-e"
    var elevatorTotalPriceE = "elevator-total-price-e"
    var installationFeesE = "installation-fees-e"
    var finalPriceE = "final-price-e"
    // FUNCTION TO CALCULATE QUOTE
    // Residential
    function residential() { 
        numberAppartments = document.getElementById("number-of-apartments").value;
        numberFloors = document.getElementById("number-of-floors").value;
        var averageDoors = Math.ceil((numberAppartments / numberFloors) / 6);
        var numberColumns = Math.ceil(numberFloors / 20);
        totalElevator = averageDoors * numberColumns;
        document.getElementById("total-elevator").value = Math.ceil(totalElevator);
        //Unit price
        elevatorUnitPriceS = 7565;
        document.getElementById("elevator-unit-price-s").value = elevatorUnitPriceS;
        elevatorUnitPriceP = 12345;
        document.getElementById("elevator-unit-price-p").value = elevatorUnitPriceP;
        elevatorUnitPriceE = 15400;
        document.getElementById("elevator-unit-price-e").value = elevatorUnitPriceE;
        //Total price
        elevatorTotalPriceS = (totalElevator * elevatorUnitPriceS);
        document.getElementById("elevator-total-price-s").value = new Intl.NumberFormat("en-US", {
                                                                      style: "currency",
                                                                      currency: "USD",
                                                                      }).format(elevatorTotalPriceS);
        elevatorTotalPriceP = (totalElevator * elevatorUnitPriceP);
        document.getElementById("elevator-total-price-p").value = elevatorTotalPriceP;
        elevatorTotalPriceE = (totalElevator * elevatorUnitPriceE);
        document.getElementById("elevator-total-price-e").value = elevatorTotalPriceE;
        //Installation fee
        installationFeesS = (elevatorTotalPriceS * 0.1);
        document.getElementById("installation-fees-s").value = installationFeesS;
        installationFeesP = (elevatorTotalPriceP * 0.13);
        document.getElementById("installation-fees-p").value = installationFeesP;
        installationFeesE = (elevatorTotalPriceE * 0.16);
        document.getElementById("installation-fees-e").value = installationFeesE;
        //Final price
        finalPriceS = elevatorTotalPriceS + installationFeesS
        document.getElementById("final-price-s").value = finalPriceS;
        finalPriceP = elevatorTotalPriceP + installationFeesP
        document.getElementById("final-price-p").value = finalPriceP;
        finalPriceE = elevatorTotalPriceE + installationFeesE
        document.getElementById("final-price-e").value = finalPriceE;
    }
    //Commercial
    function commercial() { 
        numberElevators = document.getElementById("number-of-elevators").value;
        totalElevator = numberElevators
        document.getElementById("total-elevator").value = Math.ceil(totalElevator);
        //Unit price
        elevatorUnitPriceS = 7565;
        document.getElementById("elevator-unit-price-s").value = elevatorUnitPriceS;
        elevatorUnitPriceP = 12345;
        document.getElementById("elevator-unit-price-p").value = elevatorUnitPriceP;
        elevatorUnitPriceE = 15400;
        document.getElementById("elevator-unit-price-e").value = elevatorUnitPriceE;
        //Total price
        elevatorTotalPriceS = (totalElevator * elevatorUnitPriceS);
        document.getElementById("elevator-total-price-s").value = elevatorTotalPriceS;
        elevatorTotalPriceP = (totalElevator * elevatorUnitPriceP);
        document.getElementById("elevator-total-price-p").value = elevatorTotalPriceP;
        elevatorTotalPriceE = (totalElevator * elevatorUnitPriceE);
        document.getElementById("elevator-total-price-e").value = elevatorTotalPriceE;
        //Installation fee
        installationFeesS = (elevatorTotalPriceS * 0.1);
        document.getElementById("installation-fees-s").value = installationFeesS;
        installationFeesP = (elevatorTotalPriceP * 0.13);
        document.getElementById("installation-fees-p").value = installationFeesP;
        installationFeesE = (elevatorTotalPriceE * 0.16);
        document.getElementById("installation-fees-e").value = installationFeesE;
        //Final price
        finalPriceS = elevatorTotalPriceS + installationFeesS
        document.getElementById("final-price-s").value = finalPriceS;
        finalPriceP = elevatorTotalPriceP + installationFeesP
        document.getElementById("final-price-p").value = finalPriceP;
        finalPriceE = elevatorTotalPriceE + installationFeesE
        document.getElementById("final-price-e").value = finalPriceE;
    }
    //Corporate
    function coporate() { 
        numberFloors = document.getElementById("number-of-floors").value;
        numberBasements = document.getElementById("number-of-basements").value;
        numberOccupancy = document.getElementById("maximum-occupancy").value;
        var totalOccupant = Math.ceil(numberOccupancy * (numberFloors + numberBasements));
        var elevatorRequire = Math.ceil(totalOccupant / 1000);
        var numberColumnsRequire = Math.ceil((numberFloors + numberBasements) / 20);
        var numberElevatorColumns = elevatorRequire / numberColumnsRequire;
        totalElevator = numberElevatorColumns * numberColumnsRequire;
        document.getElementById("total-elevator").value = Math.ceil(totalElevator);
        //Unit price
        elevatorUnitPriceS = 7565;
        document.getElementById("elevator-unit-price-s").value = elevatorUnitPriceS;
        elevatorUnitPriceP = 12345;
        document.getElementById("elevator-unit-price-p").value = elevatorUnitPriceP;
        elevatorUnitPriceE = 15400;
        document.getElementById("elevator-unit-price-e").value = elevatorUnitPriceE;
        //Total price
        elevatorTotalPriceS = (totalElevator * elevatorUnitPriceS);
        document.getElementById("elevator-total-price-s").value = elevatorTotalPriceS;
        elevatorTotalPriceP = (totalElevator * elevatorUnitPriceP);
        document.getElementById("elevator-total-price-p").value = elevatorTotalPriceP;
        elevatorTotalPriceE = (totalElevator * elevatorUnitPriceE);
        document.getElementById("elevator-total-price-e").value = elevatorTotalPriceE;
        //Installation fee
        installationFeesS = (elevatorTotalPriceS * 0.1);
        document.getElementById("installation-fees-s").value = installationFeesS;
        installationFeesP = (elevatorTotalPriceP * 0.13);
        document.getElementById("installation-fees-p").value = installationFeesP;
        installationFeesE = (elevatorTotalPriceE * 0.16);
        document.getElementById("installation-fees-e").value = installationFeesE;
        //Final price
        finalPriceS = elevatorTotalPriceS + installationFeesS
        document.getElementById("final-price-s").value = finalPriceS;
        finalPriceP = elevatorTotalPriceP + installationFeesP
        document.getElementById("final-price-p").value = finalPriceP;
        finalPriceE = elevatorTotalPriceE + installationFeesE
        document.getElementById("final-price-e").value = finalPriceE;
    }
    //Hybrid
    / HIDE AND SHOW Selection
$(document).ready(function(){
  $("#building-type").on('change', function(){
      $(".data").hide();
      $("#" + $(this).val()).fadeIn(300);
  }).change
})
// HIDE AND SHOW Radio Button
$(function() {
  $("input[name='service']").click(function() {
  if ($("#standard-radio").is(":checked")) {
  $("#elevator-unit-price-s").show();
  $("#label-unit-s").show();
  $("#elevator-total-price-s").show();
  $("#label-total-s").show();
  $("#installation-fees-s").show();
  $("#label-fee-s").show();
  $("#final-price-s").show();
  $("#label-final-s").show();
  } else {
  $("#elevator-unit-price-s").hide();
  $("#label-unit-s").hide();
  $("#elevator-total-price-s").hide();
  $("#label-total-s").hide();
  $("#installation-fees-s").hide();
  $("#label-fee-s").hide();
  $("#final-price-s").hide();
  $("#label-final-s").hide();
  }
});
});
$(function() {
  $("input[name='service']").click(function() {
  if ($("#premium-radio").is(":checked")) {
  $("#elevator-unit-price-p").show();
  $("#label-unit-p").show();
  $("#elevator-total-price-p").show();
  $("#label-total-p").show();
  $("#installation-fees-p").show();
  $("#label-fee-p").show();
  $("#final-price-p").show();
  $("#label-final-p").show();
  } else {
  $("#elevator-unit-price-p").hide();
  $("#label-unit-p").hide();
  $("#elevator-total-price-p").hide();
  $("#label-total-p").hide();
  $("#installation-fees-p").hide();
  $("#label-fee-p").hide();
  $("#final-price-p").hide();
  $("#label-final-p").hide();
  }
});
});
$(function() {
  $("input[name='service']").click(function() {
  if ($("#excelium-radio").is(":checked")) {
  $("#elevator-unit-price-e").show();
  $("#label-unit-e").show();
  $("#elevator-total-price-e").show();
  $("#label-total-e").show();
  $("#installation-fees-e").show();
  $("#label-fee-e").show();
  $("#final-price-e").show();
  $("#label-final-e").show();
  } else {
  $("#elevator-unit-price-e").hide();
  $("#label-unit-e").hide();
  $("#elevator-total-price-e").hide();
  $("#label-total-e").hide();
  $("#installation-fees-e").hide();
  $("#label-fee-e").hide();
  $("#final-price-e").hide();
  $("#label-final-e").hide();
  }
});
});
//INPUT FIELDS
// Residendial
var numberAppartments = "number-of-apartments"
var numberFloors = "number-of-floors"
var numberBasements = "number-of-basements"
// Commercial
var numberCompanies = "number-of-companies"
var numberParking = "number-of-parking-spots"
var numberElevators = "number-of-elevators"
// Corporate
var numberCorporation = "number-of-corporations"
var numberOccupancy = "maximum-occupancy"
// Hybrid
var numberHours = "business-hours"
//RESULT INPUT
//var totalOccupant = "total-number-of-occupant"
//var elevatorAmount = "elevator-amount"
//var elevatorRequire = "elevator-require"
//var numberColumnsRequire = "number-of-columns-require"
//var numberElevatorColumns = "number-of-elevator-columns"
var totalElevator = "total-elevator"
//BUDGET INPUT
var elevatorUnitPriceS = "elevator-unit-price-s"
var elevatorTotalPriceS = "elevator-total-price-s"
var installationFeesS = "installation-fees-s"
var finalPriceS = "final-price-s"
var elevatorUnitPriceP = "elevator-unit-price-p"
var elevatorTotalPriceP = "elevator-total-price-p"
var installationFeesP = "installation-fees-p"
var finalPriceP = "final-price-p"
var elevatorUnitPriceE = "elevator-unit-price-e"
var elevatorTotalPriceE = "elevator-total-price-e"
var installationFeesE = "installation-fees-e"
var finalPriceE = "final-price-e"
// FUNCTION TO CALCULATE QUOTE
// Residential
function residential() { 
    numberAppartments = document.getElementById("number-of-apartments").value;
    numberFloors = document.getElementById("number-of-floors").value;
    var averageDoors = Math.ceil((numberAppartments / numberFloors) / 6);
    var numberColumns = Math.ceil(numberFloors / 20);
    totalElevator = averageDoors * numberColumns;
    document.getElementById("total-elevator").value = Math.ceil(totalElevator);
    //Unit price
    elevatorUnitPriceS = 7565;
    document.getElementById("elevator-unit-price-s").value = elevatorUnitPriceS;
    elevatorUnitPriceP = 12345;
    document.getElementById("elevator-unit-price-p").value = elevatorUnitPriceP;
    elevatorUnitPriceE = 15400;
    document.getElementById("elevator-unit-price-e").value = elevatorUnitPriceE;
    //Total price
    elevatorTotalPriceS = (totalElevator * elevatorUnitPriceS);
    document.getElementById("elevator-total-price-s").value = elevatorTotalPriceS;
    elevatorTotalPriceP = (totalElevator * elevatorUnitPriceP);
    document.getElementById("elevator-total-price-p").value = elevatorTotalPriceP;
    elevatorTotalPriceE = (totalElevator * elevatorUnitPriceE);
    document.getElementById("elevator-total-price-e").value = elevatorTotalPriceE;
    //Installation fee
    installationFeesS = (elevatorTotalPriceS * 0.1);
    document.getElementById("installation-fees-s").value = installationFeesS;
    installationFeesP = (elevatorTotalPriceP * 0.13);
    document.getElementById("installation-fees-p").value = installationFeesP;
    installationFeesE = (elevatorTotalPriceE * 0.16);
    document.getElementById("installation-fees-e").value = installationFeesE;
    //Final price
    finalPriceS = elevatorTotalPriceS + installationFeesS
    document.getElementById("final-price-s").value = finalPriceS;
    finalPriceP = elevatorTotalPriceP + installationFeesP
    document.getElementById("final-price-p").value = finalPriceP;
    finalPriceE = elevatorTotalPriceE + installationFeesE
    document.getElementById("final-price-e").value = finalPriceE;
}
//Commercial
function commercial() { 
    numberElevators = document.getElementById("number-of-elevators").value;
    totalElevator = numberElevators
    document.getElementById("total-elevator").value = Math.ceil(totalElevator);
    //Unit price
    elevatorUnitPriceS = 7565;
    document.getElementById("elevator-unit-price-s").value = elevatorUnitPriceS;
    elevatorUnitPriceP = 12345;
    document.getElementById("elevator-unit-price-p").value = elevatorUnitPriceP;
    elevatorUnitPriceE = 15400;
    document.getElementById("elevator-unit-price-e").value = elevatorUnitPriceE;
    //Total price
    elevatorTotalPriceS = (totalElevator * elevatorUnitPriceS);
    document.getElementById("elevator-total-price-s").value = elevatorTotalPriceS;
    elevatorTotalPriceP = (totalElevator * elevatorUnitPriceP);
    document.getElementById("elevator-total-price-p").value = elevatorTotalPriceP;
    elevatorTotalPriceE = (totalElevator * elevatorUnitPriceE);
    document.getElementById("elevator-total-price-e").value = elevatorTotalPriceE;
    //Installation fee
    installationFeesS = (elevatorTotalPriceS * 0.1);
    document.getElementById("installation-fees-s").value = installationFeesS;
    installationFeesP = (elevatorTotalPriceP * 0.13);
    document.getElementById("installation-fees-p").value = installationFeesP;
    installationFeesE = (elevatorTotalPriceE * 0.16);
    document.getElementById("installation-fees-e").value = installationFeesE;
    //Final price
    finalPriceS = elevatorTotalPriceS + installationFeesS
    document.getElementById("final-price-s").value = finalPriceS;
    finalPriceP = elevatorTotalPriceP + installationFeesP
    document.getElementById("final-price-p").value = finalPriceP;
    finalPriceE = elevatorTotalPriceE + installationFeesE
    document.getElementById("final-price-e").value = finalPriceE;
}
//Corporate
function coporate() { 
    numberFloors = document.getElementById("number-of-floors").value;
    numberBasements = document.getElementById("number-of-basements").value;
    numberOccupancy = document.getElementById("maximum-occupancy").value;
    var totalOccupant = Math.ceil(numberOccupancy * (numberFloors + numberBasements));
    var elevatorRequire = Math.ceil(totalOccupant / 1000);
    var numberColumnsRequire = Math.ceil((numberFloors + numberBasements) / 20);
    var numberElevatorColumns = elevatorRequire / numberColumnsRequire;
    totalElevator = numberElevatorColumns * numberColumnsRequire;
    document.getElementById("total-elevator").value = Math.ceil(totalElevator);
    //Unit price
    elevatorUnitPriceS = 7565;
    document.getElementById("elevator-unit-price-s").value = elevatorUnitPriceS;
    elevatorUnitPriceP = 12345;
    document.getElementById("elevator-unit-price-p").value = elevatorUnitPriceP;
    elevatorUnitPriceE = 15400;
    document.getElementById("elevator-unit-price-e").value = elevatorUnitPriceE;
    //Total price
    elevatorTotalPriceS = (totalElevator * elevatorUnitPriceS);
    document.getElementById("elevator-total-price-s").value = elevatorTotalPriceS;
    elevatorTotalPriceP = (totalElevator * elevatorUnitPriceP);
    document.getElementById("elevator-total-price-p").value = elevatorTotalPriceP;
    elevatorTotalPriceE = (totalElevator * elevatorUnitPriceE);
    document.getElementById("elevator-total-price-e").value = elevatorTotalPriceE;
    //Installation fee
    installationFeesS = (elevatorTotalPriceS * 0.1);
    document.getElementById("installation-fees-s").value = installationFeesS;
    installationFeesP = (elevatorTotalPriceP * 0.13);
    document.getElementById("installation-fees-p").value = installationFeesP;
    installationFeesE = (elevatorTotalPriceE * 0.16);
    document.getElementById("installation-fees-e").value = installationFeesE;
    //Final price
    finalPriceS = elevatorTotalPriceS + installationFeesS
    document.getElementById("final-price-s").value = finalPriceS;
    finalPriceP = elevatorTotalPriceP + installationFeesP
    document.getElementById("final-price-p").value = finalPriceP;
    finalPriceE = elevatorTotalPriceE + installationFeesE
    document.getElementById("final-price-e").value = finalPriceE;
}
//Hybrid

    var ehekelelelelel = sdjshkdhfk
