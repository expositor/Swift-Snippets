//document.getElementsByTagName('head')[0].innerHTML += '<style>a{font-size:100px}</style>';


var link

jQuery('a').click(function(e){
   e.preventDefault();
   link = jQuery(this).attr('href')
   callNativeApp("getLink")

})

function callNativeApp(message){
    
    
    if (message == "getLink") {
        
        webkit.messageHandlers.getLink.postMessage(
            link
        )
    }
}