var _loginUrl = "https://www.myclick123.com/eng/web/tt/authenticate.cfm";
var _registerUrl = "https://www.myclick123.com/eng/web/tt/signup.cfm";
var _loginClass = "authenticate-login";
var _loginClass1 = "authenticate-login1";
var _registerClass = "authenticate-register";
var _logoutClass = "authenticate-logout";
var _cookieName = "authenticate-cookie";
var _popupHeight = 500;
var _popupWidth = 700;
document.addEventListener('DOMContentLoaded',function() {
    document.body.addEventListener('click', function (event) {
        if (event.target.classList.contains(_loginClass)) {
            _openPopup(_loginUrl);
        }
    });
});
document.addEventListener('DOMContentLoaded',function() {
    document.body.addEventListener('click', function (event) {
        if (event.target.classList.contains(_loginClass1)) {
            _openPopup1(_loginUrl);
        }
    });
});
// Create IE + others compatible event handler
var eventMethod = window.addEventListener ? "addEventListener" : "attachEvent";
var eventer = window[eventMethod];
var messageEvent = eventMethod == "attachEvent" ? "onmessage" : "message";
// Listen to message from child window
eventer(messageEvent,function(e) {
    if ('status' in e.data) {
        if(e.data.status == "success"){
            
        } else {
            alert(e.data);
        }
    }
}, false);
function _openPopup(_url) {
    var left = (screen.width/2)-(_popupWidth/2);
    var top = (screen.height/2)-(_popupHeight/2);
    var html = '<div id="modal"><div class="modal-content"><span class="close-button">&times;</span><iframe width="'+_popupWidth+'" height="'+_popupHeight+'" src="'+_url+'" frameborder="0" allowfullscreen></iframe></div></div><style>#modal{position: fixed;left: 0;top: 0;width: 100%;height: 100%;background-color: rgba(0, 0, 0, 0.5);opacity: 0;visibility: hidden;transform: scale(1.1);transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s;}#modal .modal-content {position: absolute;top: 50%;left: 50%;transform: translate(-50%, -50%);background-color: white;padding: 1rem 1.5rem;width: auto;}#modal .close-button{float: right;width: 2.5rem;line-height: 2.5rem;text-align: center;cursor: pointer;border-radius: 0.25rem;background-color: #007bff;font-size: 25px;color: #fff;font-weight: bold;}#modal .close-button:hover{background-color: darkgray;}#modal.show-modal {opacity: 1;visibility: visible;transform: scale(1.0);transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s;}</style>';
    appendHtml(document.body, html);
    var closeButton = document.querySelector(".close-button");
    closeButton.addEventListener("click", _toggleModal);
    var modal = document.getElementById("modal");
    modal.classList.toggle("show-modal");
}
function _openPopup1(_url){
    var left = (screen.width/2)-(_popupWidth/2);
    var top = (screen.height/2)-(_popupHeight/2);
    var _popup = window.open(_url, "Register", 'toolbar=no, menubar=no, width='+_popupWidth+', height='+_popupHeight+', top='+top+', left='+left);
    return false;
}
function _hideElementsByClass(className){
    var elements = document.getElementsByClassName(className);
    for (i = 0; i < elements.length; i++) {
        elements[i].style.visibility = 'hidden';
    }
}
function _showElementsByClass(className){
    var elements = document.getElementsByClassName(className);
    for (i = 0; i < elements.length; i++) {
        elements[i].style.visibility = 'visible';
    }
}
function _changeContentByClass(className,content){
    var elements = document.getElementsByClassName(className);
    for (i = 0; i < elements.length; i++) {
        elements[i].innerHTML = content;
    }
}
function appendHtml(el, str) {
    var div = document.createElement('div');
    div.innerHTML = str;
    while (div.children.length > 0) {
      el.appendChild(div.children[0]);
    }
  }
  
function _toggleModal() {
var modal = document.getElementById("modal");
modal.classList.toggle("show-modal");
modal.remove();
}

function _windowOnClick(event) {
var modal = document.getElementById("modal");
if (event.target === modal) {
    _toggleModal();
}
}
window.addEventListener("click", _windowOnClick);
