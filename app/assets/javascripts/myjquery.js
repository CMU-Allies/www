$(document).ready( function() {
/*
  $("#About").hide()
  $("#Projects").hide()
  $("#Resume").hide()
  $("#Links").hide()
  $("#Contact").hide()
  $(".Resume").hide()
*/

  function fullalpha(item){
    var hxcolor = $(item).css("background-color")
    var red = hxcolor.substring(5,8)
    var blu = hxcolor.substring(10,13)
    var gre = hxcolor.substring(15,18)
    var nrgba = "rgba(" + red + ", " + blu + ", " + gre + ",1)"
    return $(item).css("background-color", nrgba)
  }
  function brightalpha(item){
    var itcolor = $(item).css("background-color")
    var red = itcolor.substring(4,7)
    var blu = itcolor.substring(9,12)
    var gre = itcolor.substring(14,17)
    var nrgba = "rgba(" + red + ", " + blu + ", " + gre + ",.5)"
    return $(item).css("background-color", nrgba)
  }

/*  var selectTab = $("div#Home")
  function tabSelect(item) {
    var newSelect = $(item).text()
    selectTab.stop().slideToggle()
    selectTab = $("div#" + newSelect)
    selectTab.stop().css('z-index', '1').fadeToggle('slow')
  }
*/

  $(window).scroll(function() {
    if($("body").scrollTop() > 240) {
      $(".topnavbar").css({"position" : "fixed", "left" : "0%", "background" : "white", "height" : "40px", "width" : "100%"})
      $(".topnavbar").children().css({"margin-top" : "0px"/*, "vertical-align" : "top"*/})
    }
    if($("body").scrollTop() < 240) {
      $(".topnavbar").css({"position" : "static", "margin-left" : "auto", "background" : "none"})
      $(".topnavbar").children().css({"margin-top" : "0px"/*, "vertical-align" : "top"*/})
    }
  })
  $("div#dropdown").hide()
  $(".morecontent").hide()
  $("div.topnav").mouseover( function(){
    brightalpha(this)
    $(this).animate({
      width:'120px',
      height: '40px',
      fontSize: '22px',
      marginTop: '0px'
    }, {duration: "fast", queue: false}, "linear")
  })
  
  $("div.wrapper").mouseleave( function(){
    var that = $(this).find(".topnav")
    fullalpha(that)
    $(this).find("div.topnav").animate({
      width:'100px',
      height: '30px',
      fontSize: '17px',
      marginTop: '5px'
    }, {duration: "fast", queue: false}, "linear")
  })
  
  $("#d3").mouseover( function(){
    $("#dropdown").slideDown(500)
    $(this).animate({
      width:'120px',
      height: '40px',
      marginTop: '0px'
    }, "fast")
  })
  $(".wrapper").mouseleave( function(){
    $("#dropdown").stop().slideUp(100)
  })
  $(".dropelem").mouseover( function(){
    brightalpha(this)
    $(this).mousedown( function (){
      fullalpha(this)
      $(this).mouseup( function (){
          brightalpha(this)
      })
    })
  })
  $(".topnav").mouseover( function(){
    brightalpha(this)
    $(this).mousedown( function (){
      fullalpha(this)
      tabSelect(this)
      $('.Tab').css('z-index', 'auto')
      $(this).mouseup( function (){
          brightalpha(this)
      })
    })
  })
  $(".dropelem").mouseleave( function(){
    fullalpha(this)
  })
  
  $(".showmore").click( function(){
    if($(this).prev().is(":hidden")) {$(this).text("Show Less")}
    if($(this).prev().is(":visible")) {$(this).text("Show More")}
    $(this).prev().toggle()
    console.log("weeee")
  })
  
  $("#showless").click( function(){
    console.log("whyyyyy")
    $("#biotext").css("height", "300px")
    $("#showless").text("Show more").attr("id", "showmore")
    
  })
  
  //$("canvas#drawhead").drawArc({
  //  fillStyle: "red",
  //  x: 300, y: 200,
  //  radius: 30,
  //  // start and end angles in degrees
  //}).drawArc({
  //  fillStyle: "blue",
  //  x: 100, y: 50,
  //  radius: 30,
  //  // start and end angles in degrees
  //}).drawArc({
  //  fillStyle: "orange",
  //  x: 500, y: 150,
  //  radius: 30,
  //  // start and end angles in degrees
  //}).drawArc({
  //  fillStyle: "purple",
  //  x: 30, y: 160,
  //  radius: 30,
  //  // start and end angles in degrees
  //}).drawArc({
  //  fillStyle: "green",
  //  x: 670, y: 100,
  //  radius: 30,
  //  // start and end angles in degrees
  //}).drawText({
  //  fillStyle: "black",
  //  x: 350,
  //  y: 120,
  //  align: "center",
  //  fontSize: 90,
  //  fontFamily: "Galindo, Viga, Cabin, sans-serif",
  //  fontStyle: "bold",
  //  text: "Colin Meret" 
  //})
  $(".resumeButton").mouseleave( function() {
    fullalpha(this)
    $(this).stop().animate({
    width:'200px',
    height: '30px',
    fontSize: '17px'
  }, 200)
  })
  $(".resumeButton").mouseover( function(){
    brightalpha(this)
    $(this).stop().animate({
      width:'240px',
      height: '40px',
      fontSize: '22px'
    }, 200)
  })
  $(".resumeButton").mouseup( function (){
    brightalpha(this)
  })
  $(".resumeButton").mousedown( function (){
    fullalpha(this)
    $(this).next().next().stop().slideToggle(200)
  })
})
