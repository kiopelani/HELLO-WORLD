$(document).ready(function() {
    $('#alarm-button').click(function(e) {
      e.preventDefault();

      convertAlarmDate($('#alarm-date').val());
      convertAlarmTime($('#alarm-time').val());

      // convertAlarmTime($('#alarm-input').val());
    });
});


  function convertAlarmDate(date){
    console.log('in converted alarm date')
    console.log(date)
  };

  function convertAlarmTime(time){
    console.log('in converted alarm time')
    console.log(time)
  };

  function currentDate(){
    console.log('in current date')
    var today = new Date().toLocaleString()
    console.log(today)
  }

  function currentTime(){
    console.log('in current time')
    var rightNow = (new Date()).getTime()
    console.log(rightNow)
  }




// function convertCurrentTime(){
//   var now = new Date();
//   var ok = (new Date()).getTime()
  // console.log(ok)
  // var hour = now.getHours();
  // var minutes = now.getMinutes();
  // var timeString = hour + ":" + minutes
  // console.log('pooop')
  // console.log(minutes)
  // if(minutes < 10){
  //   minutes << "0"
  // }
  // console.log(minutes)
  // var currentConvertedTime = (Number(hour)*60+Number(minutes))*1000
  // console.log(currentConvertedTime)
//   return ok
// }

// var convertAlarmTime = function(time){
//   var d = new Date(time)
//   // var alarmTime=(Number(time.split(':')[0])*60+Number(time.split(':')[1]))*1000
//   console.log('cosajd')
//   console.log(d)
//   var alarmTime = d.getTime();
//   console.log('mcpoop')
//   console.log(alarmTime)
//   var currentTime = convertCurrentTime();
//   // console.log(convertedTime);
//   // currentTime();
//   // delayedAlert();
//   console.log('alarm time')
//   console.log(alarmTime)
//   console.log('current time')
//   console.log(currentTime)
//   console.log(currentTime - alarmTime);
//   omg = currentTime - alarmTime
//   delayedAlert(omg)
// };

// var setAlarm = function(){
//   console.log(convertAlarmTime - convertCurrentTime)
// }

// function slowAlert() {
//   console.log('in slow alert')
//   alert("YES");
// }

// function delayedAlert(milliseconds) {
//   console.log('in delayed alert')
//   time = Number(milliseconds)
//   console.log(milliseconds)
//   var a = 2000
//   setTimeout(slowAlert, milliseconds);
// }



// var myVar = setInterval(function(){myTimer()}, 1000);

// function myTimer() {
//     var d = new Date();
//     var t = d.toLocaleTimeString();
//     document.getElementById("demo").innerHTML = t;
// }