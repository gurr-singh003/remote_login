<cfcomponent displayname="Authenticate">
<cfinclude template="../../../app_globals.cfm"> 
    <cffunction  name="isAuthenticated">
        <cfreturn "true">
    </cffunction>

    <cffunction  name="authenticate">
        <cfargument  name="username">
        <cfargument  name="password">
        <!---     Validate username/password into the database     --->
        <CFQUERY NAME="GetuserInfo" datasource="#request.db_dsn#">
            SELECT *
            FROM user_test
            WHERE username = '#arguments.username#' AND password = '#arguments.password#'
        </CFQUERY>
        <cfif GetuserInfo.RecordCount GT 0>
            <cfreturn true>
        </cfif>
        <cfreturn false>
    </cffunction>

    <cffunction  name="signup">
        <cfargument  name="username">
        <cfargument  name="email">
        <cfargument  name="password">
        <!---     Validate username/password into the database     --->
        <CFQUERY NAME="CheckuserInfo" datasource="#request.db_dsn#">
            SELECT *
            FROM user_test
            WHERE username = '#arguments.username#' OR email = '#arguments.email#'
        </CFQUERY>
        <cfif CheckuserInfo.RecordCount EQ 0>
            <cfquery name="userInsert" result="UserInresult" datasource="#request.db_dsn#">
                INSERT INTO user_test (username, email , password) VALUES('#arguments.username#','#arguments.email#','#arguments.password#')
            </cfquery>
            <cfreturn true>
        </cfif>
        <cfreturn false>
    </cffunction>

</cfcomponent>
