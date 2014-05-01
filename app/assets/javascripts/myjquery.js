$(document).ready( function() {
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
  
  /*$(".dropelem").mouseleave( function(){
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
  */

  $(".resumeButton").mouseleave( function() {
    fullalpha(this)
    $(this).stop().animate({
    width:'200px',
    height: '30px',
    fontSize: '17px'
  }, 200)
  })
})
