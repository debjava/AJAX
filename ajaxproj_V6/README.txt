Basic details
-------------
Developer Name		 : Debadatta Mishra
Application Title	 : ajaxproj_v6
Objective		 : ajax cart example
Technology Used		 : Ajax, Java, JSP,JSTL, JavaScript, Servlet,Apache Ant
Developement Environment : Java 1.5(Tiger),Eclipse 3.3(Europa),Ant 1.6.5,JBOSS Application Server 4.0.5,Internet Explorer 6, Windwos XP Service Pack2

Basic requirements for the application
--------------------------------------
To get the readymade efect of this application, you must have the followings
		1. Application server
		2. JDK 1.5 or higher
		3. Internet Explorer 6 or higher
		4. Apache Ant 1.6.5 or higher

How to run the application
--------------------------
1. If you have Jboss application server, please modify the build script ie. build.xml to give the path of your
   deploy directory of the Jboss server. Then open the command prompt come to the root directory of the application
   and type "ant". It will deploy as an directory having name as "applicationname.war" in the deploy directory
   of your Jboss server. Now start the Jboss server and provide the URL in the browser as
   http://localhost:8080/applicationname/page1.jsp. Now examine the application.

2. If you are using a different application server, please do not modify the build script. Open the command
   prompt and come to the root directory of the application. Then type "ant distribution". Now it will
   create a folder called dist. In that folder you will find a war file , please deploy that war file
   in your application server. Now start your application server and see the effect.

Contact
-------
Since this application is only meant for learning, in case any problem in running the application,
please contact in the email address debadattamishra@aol.com.