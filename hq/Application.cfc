<cfcomponent>

	<!--- Application settings --->
	<cfset this.name = "bugLogHQ">
	<cfset this.sessionManagement = true> 
	<cfset this.sessionTimeout = "#CreateTimeSpan(0,1,0,0)#">

	<!--- create an application mapping to the main bugLog directory (parent dir of this template) --->
	<cfset this.rootDir = GetDirectoryFromPath(GetDirectoryFromPath(GetCurrentTemplatePath()).ReplaceFirst( "[\\\/]{1}$", "" ))>
	<cfset this.mappings[ "/bugLog" ] = left(this.rootDir,len(this.rootDir)-1)>

	<cffunction name="onRequestStart" returntype="boolean" access="public">
		<cfargument name="pageName" type="string" required="false" default="">

		<cfscript>
			if(structKeyExists(url, "reinit")) {
            	applicationStop();
            	location(url="./");
        	}
		</cfscript>

		<!--- see if this is a request for a named instance.
			A "named instance" is a separate deployment of buglog under a different directory other than /buglog or web root.
			A single server can host multiple named instances at the same time.

			Note: Named instances must have an application name different than bugLogHQ.
 				  The name of the named instance is given by its containing folder.
		 --->
		<cfif this.name neq "bugLogHQ">
			<cfset request.bugLogInstance = replace(getDirectoryFromPath(cgi.script_name), "/", "", "ALL")>
		</cfif>
		<cfreturn true/>
	</cffunction>

</cfcomponent>

