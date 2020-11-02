<cfinclude  template="header.cfm">
<div class="row-container text-center" style="margin-top:100px">
    <h2>Popup Layer</h2>
    <br/>
    <cfif isDefined("cookie.auth_cookie") AND (cookie.auth_cookie EQ True AND cookie.auth_cookie EQ 1) >
        <div>You're already Logged in</div>
<!---         <button type="button" class="btn btn-default" onclick="_toggleModal();" style="background: #000; color: #fff;">Close</button> --->
        <script type="text/javascript">
            function closePopup() {
                var parentWindow = window.parent; 
                parentWindow.postMessage({status: 'success', message: 'Logged in successfully!'}, 'http://ec2-54-81-224-145.compute-1.amazonaws.com:8080/');
            }
        </script>
    <cfelse>
        <div>You're not logged in</div>
        <a href="signin.cfm"><button type="button" class="btn btn-default" style="background: #000; color: #fff;">Login/Register to get Started</button></a>
    </cfif>
</div>
