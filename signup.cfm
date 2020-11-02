<cfinclude  template="header.cfm">
<!------ Include the above in your HEAD tag ---------->

<div class="wrapper fadeInDown">
  <div id="formContent">
    <br/>
    <cfif isDefined('form.signup') >
      <cfset register = true >
      <cfif NOT(isDefined('form.username') AND form.username NEQ '')>
        <div class="col-md-12"><div class="alert alert-danger">Enter Username</div></div>
        <cfset register = false >
      </cfif>
      <cfif NOT(isDefined('form.email') AND form.email NEQ '')>
        <div class="col-md-12"><div class="alert alert-danger">Enter Email</div></div>
        <cfset register = false >
      </cfif>
      <cfif NOT(isDefined('form.password') AND form.password NEQ '')>
        <div class="col-md-12"><div class="alert alert-danger">Enter Password</div></div>
        <cfset register = false >
      </cfif>
      <cfif register >
        <cfobject name="auth" component="authenticate">
        <cfset response = auth.signup(form.username, form.email , form.password) >
        <cfif response >
        <cfcookie	name="auth_cookie" value="true" samesite="none" secure="yes" />
          <script type="text/javascript">
            var parentWindow = window.parent;
            parentWindow.postMessage({status: 'success', message: 'Registered and Logged in successfully!'}, 'http://ec2-54-81-224-145.compute-1.amazonaws.com:8080/');
            window.location = "https://www.myclick123.com/eng/web/tt/authenticate.cfm";
          </script>
        <cfelse>
          <div class="col-md-12"><div class="alert alert-danger">Username or email already exist.</div></div>
        </cfif>
      </cfif>
    </cfif>
    <!-- Login Form -->
    <form method="post" action="">
      <input type="text" id="login" class="fadeIn second" name="username" placeholder="Username">
      <input type="email" id="email" class="fadeIn fifth" name="email" placeholder="Email">
      <input type="password" id="password" class="fadeIn third" name="password" placeholder="password">
      <input type="submit" name="signup" class="fadeIn fourth" value="Register">
    </form>
  </div>
</div>
<style>

    /* BASIC */

    html {
    background-color: #56baed;
    }

    body {
    font-family: "Poppins", sans-serif;
    height: 100vh;
    }

    a {
    color: #92badd;
    display:inline-block;
    text-decoration: none;
    font-weight: 400;
    }

    h2 {
    text-align: center;
    font-size: 16px;
    font-weight: 600;
    text-transform: uppercase;
    display:inline-block;
    margin: 40px 8px 10px 8px; 
    color: #cccccc;
    }



    /* STRUCTURE */

    .wrapper {
    display: flex;
    align-items: center;
    flex-direction: column; 
    justify-content: center;
    width: 100%;
    min-height: 100%;
    padding: 20px;
    }

    #formContent {
    -webkit-border-radius: 10px 10px 10px 10px;
    border-radius: 10px 10px 10px 10px;
    background: #fff;
    padding: 30px;
    width: 90%;
    max-width: 450px;
    position: relative;
    padding: 0px;
    /*-webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
    box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);*/
    border: 1px solid #eee;
    text-align: center;
    }

    #formFooter {
    background-color: #f6f6f6;
    border-top: 1px solid #dce8f1;
    padding: 25px;
    text-align: center;
    -webkit-border-radius: 0 0 10px 10px;
    border-radius: 0 0 10px 10px;
    }



    /* TABS */

    h2.inactive {
    color: #cccccc;
    }

    h2.active {
    color: #0d0d0d;
    border-bottom: 2px solid #5fbae9;
    }



    /* FORM TYPOGRAPHY*/

    input[type=button], input[type=submit], input[type=reset]  {
    background-color: #56baed;
    border: none;
    color: white;
    padding: 15px 80px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    text-transform: uppercase;
    font-size: 13px;
    -webkit-box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
    box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
    -webkit-border-radius: 5px 5px 5px 5px;
    border-radius: 5px 5px 5px 5px;
    margin: 5px 20px 40px 20px;
    }

    input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover  {
    background-color: #39ace7;
    }

    input[type=button]:active, input[type=submit]:active, input[type=reset]:active  {
    -moz-transform: scale(0.95);
    -webkit-transform: scale(0.95);
    -o-transform: scale(0.95);
    -ms-transform: scale(0.95);
    transform: scale(0.95);
    }

    input[type=text], input[type=password] , input[type=email] {
    background-color: #f6f6f6;
    border: none;
    color: #0d0d0d;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 5px;
    width: 85%;
    border: 2px solid #f6f6f6;
    -webkit-border-radius: 5px 5px 5px 5px;
    border-radius: 5px 5px 5px 5px;
    }

    input[type=text]:focus, input[type=password]:focus {
    background-color: #fff;
    border-bottom: 2px solid #5fbae9;
    }

    input[type=text]:placeholder, input[type=password]:placeholder {
    color: #cccccc;
    }


    /* Simple CSS3 Fade-in Animation */
    .underlineHover:after {
    display: block;
    left: 0;
    bottom: -10px;
    width: 0;
    height: 2px;
    background-color: #56baed;
    content: "";
    }

    .underlineHover:hover {
    color: #0d0d0d;
    }

    .underlineHover:hover:after{
    width: 100%;
    }



    /* OTHERS */

    *:focus {
        outline: none;
    } 

    #icon {
    width:60%;
    }

</style>