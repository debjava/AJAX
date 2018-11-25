<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/lib/struts-html-el.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/lib/struts-nested.tld" prefix="nested" %>
<%--
/* Licence:
*   Use this however/wherever you like, just don't blame me if it breaks anything.
*
* Credit:
*   If you're nice, you'll leave this bit:
*
*   Class by Pierre-Alexandre Losson -- http://www.telio.be/blog
*   email : plosson@users.sourceforge.net
*/
/*
*  Changed for Part 2, by Ken Cochrane
*  http://KenCochrane.net , http://CampRate.com , http://PopcornMonsters.com
*/
--%>
<html>
    <head>
        <title>Simple upload page 2.0</title>
        <script src='js/upload.js'> </script>
        <script src='dwr/interface/UploadMonitor.js'> </script>
        <script src='dwr/engine.js'> </script>
        <script src='dwr/util.js'> </script>
        <style type="text/css">
            body { font: 11px Lucida Grande, Verdana, Arial, Helvetica, sans serif; }
            #progressBar { padding-top: 5px; }
            #progressBarBox { width: 350px; height: 20px; border: 1px inset; background: #eee;}
            #progressBarBoxContent { width: 0; height: 20px; border-right: 1px solid #444; background: #9ACB34; }
        </style>
       <script language="javascript">
        function updateStatusMessage(message){
          DWRUtil.setValue('updateStatusMsg', message);
        }
     </script>
    </head>
<body>
<p>
        <h1>Web upload 2.0</h1>
</p>

<iframe src="showUploadForm.do" name="addFileFrame" id="addFileFrame" frameborder="0" scrolling='no'></iframe>
<br />
<p><span align='left' class='status-text' id='updateStatusMsg'></span>
<div id="progressBar" style="display: none;">

            <div id="theMeter">
                <div id="progressBarText"></div>

                <div id="progressBarBox">
                    <div id="progressBarBoxContent"></div>
                </div>
            </div>
 </div>
 </p>
</body>
</html>