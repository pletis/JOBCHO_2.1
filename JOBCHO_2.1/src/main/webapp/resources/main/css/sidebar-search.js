/*===== EXPANDER MENU  =====*/ 
$(document).ready(function(){
  $("#toggle-key-home").on("click",function(){
    console.log("집으로")
    $("#navbar-search").removeClass("expander-search")
    $("#navbar-search2").removeClass("expander-search")
    $("#navbar-search3").removeClass("expander-search")
  })


  $("#toggle-key").on("click",function(){
    console.log("눌러줘")
    $("#navbar-search2").removeClass("expander-search")
    $("#navbar-search3").removeClass("expander-search")
    $("#navbar-search").toggleClass("expander-search")
  })

  $("#toggle-key2").on("click",function(){
    console.log("눌러줘2")
    $("#navbar-search").removeClass("expander-search")
    $("#navbar-search3").removeClass("expander-search")
    $("#navbar-search2").toggleClass("expander-search")
  })

  $("#toggle-key3").on("click",function(){
    console.log("눌러줘3")
    $("#navbar-search").removeClass("expander-search")
    $("#navbar-search2").removeClass("expander-search")
    $("#navbar-search3").toggleClass("expander-search")
  })

  $("#toggle-key-member").on("click",function(){
    console.log("집으로")
    $("#navbar-search").removeClass("expander-search")
    $("#navbar-search2").removeClass("expander-search")
    $("#navbar-search3").removeClass("expander-search")
  })
})

