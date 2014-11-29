$(document).ready(function() {
    $('#alarm-button').click(function(e) {
      e.preventDefault();
      setAlarm($('#alarm-input').val());
    });
});

var setAlarm = function(time){
  console.log(time);
  delayedAlert();
};

function slowAlert() {
  console.log('in slow alert')
  alert("That was really slow!");
}

function delayedAlert() {
  console.log('in delayed alert')
  setTimeout(slowAlert, 2000);
}




// var myVar = setInterval(function(){myTimer()}, 1000);

// function myTimer() {
//     var d = new Date();
//     var t = d.toLocaleTimeString();
//     document.getElementById("demo").innerHTML = t;
// }