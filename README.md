# TImeTrackingApplication
*********************************************

Versions used:

tomcat version: 9.0.31
npm: 6.13.6
Angular CLI: 9.1.0
Node: 12.16.1
@angular-devkit/architect:    0.901.0
@angular-devkit/core:         9.1.0
@angular-devkit/schematics:   9.1.0
@schematics/angular:          9.1.0
@schematics/update:           0.901.0
rxjs:                         6.5.4

**********************************************

Steps to run Time Tracking Application.

STEP 1 : download project zip folder from below google drive link.
         https://drive.google.com/file/d/1FT0sVTV0_l3Nu42MJb2RkDmYYjUBq69N/view?usp=sharing


STEP 2 : unzip zip folder "Pratiti (Project_Prathmesh).zip"

(Note   : In zip folder, "TimeTrackingApplication" is Angular project folder,
	 "TimetTrackingJavaApplication" is Spring boot project folder and 
	 "Mysql DB backup.sql" is MySQL database backup file.)

STEP 3 : Make sure angular and node.js is installed. If yes, then navigate to angular folder "TimeTrackingApplication" via CMD/powershell.
	 then use command -> "npm install".
	 then run server using command -> "ng serve".
	 Open Chrome browser on url :"http://localhost:4200/"

STEP 4 : import database backup file "Mysql DB backup.sql" to mysql database.

STEP 5 : Import "TimetTrackingJavaApplication" Spring boot project in Eclipse as Existing Maven project.
	 Open "application.properties" file available in Spring boot project at location "TimetTrackingJavaApplication\src\main\resources\application.properties".
	 change property "spring.datasource.password= YOUR DATABASE PASSWORD". (set your MySQL db password as value to this property.)
 	 
STEP 6 : Make sure tomcat server is available in eclipse.(tomcat version used: 9.0.31)

STEP 7 : Right click on project name -> Maven -> Update Project...
 	 Right click on project name -> Run As -> Maven install.
	 Right click om project name -> Run As -> Maven build -> set Goal field as "clean install".
	 Right click on project name -> Run As -> Run on server.
	 Local tomcat server will start and application Login page running on "http://localhost:4200/" will be able to atttempt the login operation.
