<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="/WEB-INF/lib/struts-html-el.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/lib/struts-nested.tld" prefix="nested" %>
<%@ taglib uri="/WEB-INF/lib/c.tld" prefix="c" %>
<%--
/*
*  Created for Part 2, by Ken Cochrane
*  http://KenCochrane.net , http://CampRate.com , http://PopcornMonsters.com
*/
--%>
<script language="javascript">
function upload(){
    parent.startProgress();
}
</script>

<html:form action="upload.do" enctype="multipart/form-data" method="post" onsubmit="upload();">

    <p>
        <nested:file styleId="file1" property="file1" styleClass="default"  /><br />
        <nested:file styleId="file2" property="file2" styleClass="default"  /><br />
        <nested:file styleId="file3" property="file3" styleClass="default"  /><br />
        <nested:file styleId="file4" property="file4" styleClass="default"  /><br />
        <html:submit value="begin upload" styleId="uploadbutton" />
        <br />
    </p>
</html:form>

<c:if test="${(not empty uploadLog )}">
<script language="javascript">
window.onload = function () {
            parent.updateStatusMessage("<c:out value="${uploadLog}" escapeXml="false" />");
            parent.hideProgressBar();
}
</script>
</c:if>