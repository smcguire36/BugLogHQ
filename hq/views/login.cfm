<cfparam name="request.requestState.versionTag" default="">
<cfparam name="username" default="">

<cfset versionTag=request.requestState.versionTag>
<cfset lstNoPassKeys="event,view,layout,resetApp,versionTag,_modelsPath,applicationTitle,hostName">
<cfset qs=replaceNoCase(cgi.QUERY_STRING,"event=login","")>

<link href="includes/style.css" rel="stylesheet" type="text/css">
  <style type="text/css">
    .tblLogin {
      width: 400px;
      margin-top: 200px;
      margin-bottom: 100px;
	  margin-left: auto;
	  margin-right: auto;
    }
    #logo {
      color: red;
      text-decoration: none;
      font-size: 22px;
      font-weight: bold;
    }
    #versionTag {
      font-size: 10px;
    }
    #resetApp {
      font-size: 10px;
      margin-top: 15px;
      color: #333;
    }
  </style>
  <br>

<cfoutput>
	<div class="container">
    <form name="frmLogin" action="index.cfm?#qs#" method="post" class="form-horizontal tblLogin">
	 	<input type="hidden" name="event" value="doLogin">

		<div style="justify-content:center;">
        <div class="row" class="tblLogin">
            <div class="col-sm-6 text-center" style="border-right:1px solid ##ccc;">
                <div id="logo">
					BugLog<span style="color:black;">HQ</span>
                </div>
                <div id="versionTag">
                  Version:
                  <strong>#versionTag#</strong>
                </div>
                <div id="resetApp">
                  <a href="index.cfm?resetApp=1" style="color:##333;" alt="Resetting the application will force a reload of any configuration settings" title="Resetting the application will force a reload of any configuration settings">Reset BugLogHQ</a>
                </div>
            </div>
            <div class="col-sm-6">
				<div class="form-group">
					<label for="username" class="col-sm-4 control-label">Username:</label>
					<div class="col-sm-8">
						<input type="text" name="username" autofocus="autofocus" required="yes" message="Your username is required" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="password" class="col-sm-4 control-label">Password:</label>
					<div class="col-sm-8">
						<input type="password" name="password" required="yes" message="Your password is required" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-4"></div>
					<div class="col-sm-8">
						<button type="submit" class="btn btn-primary">Login</button>
					</div>
				</div>
			</div>
		</div>
		</div>
    </form>
	</div>
</cfoutput>
