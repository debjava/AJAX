package com.timesheet.action;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.lang.String;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.timesheet.Dao.MysqlShowTimesheetDAO;
import com.timesheet.Dao.ShowTimesheetDAO;
import com.timesheet.Exception.TimeSheetException;
import com.timesheet.bean.TimesheetApprovalStatusBean;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.timesheet.utility.DataBaseUtils;
public class GetWorkOrderValueOfProjectAction extends Action{
	
     boolean booleanValue=false;

	  public GetWorkOrderValueOfProjectAction() {
		
		
	} 
    public ActionForward execute(
	        ActionMapping mapping,
	        ActionForm form,
	        HttpServletRequest request,
	        HttpServletResponse response)
	        throws TimeSheetException
	        {
    	    
    	    String message="failed";
    	    Connection conn = null;
	        CallableStatement csmt=null;
	        Statement st=null;
	        ResultSet rs=null;
			String Query="";
		    boolean booleanValue=false,flag=false;
	 	    int result;
	 	   
	 	    List WorkOrderList=new ArrayList();
	 	    
	 	   
		    
		    String projectId=request.getParameter("projectId");
		 System.out.println("employeeNo"+projectId);
		    
	      
		    
	     try
	     {
	    	
	    	 
	    	 conn=DataBaseUtils.getMySqlConnection();
	    	
	    	
	    	 Query=" select work_order_no  from work_order_det a where a.project_id="+"'"+projectId+"' and a.version_no=(select max(b.version_no) from work_order_det b where b.project_id=a.project_id and b.work_order_no=a.work_order_no )";
	    	 
	    	
	    	   st=conn.createStatement();
			   rs=st.executeQuery(Query);
//			   int i=1;
			 
			 
			   
			   while(rs.next())
			   {
				
				   
			
				 
				   WorkOrderList.add(rs.getString(1));
				 
			  
				   
			  
			   }
		 	   
		      //System.out.println("Map Values :::::: "+moduleMap);
		      
			    /** 
		   		 * Execute the procedure
			     */
			   

			   // System.out.println("**** Procedure Executed for insert******");
			    /** 
			   	 * Log the Result
			   	 */
			   	   
			

				
	    	 
	          request.setAttribute("WorkOrderList",WorkOrderList);
	             
	       System.out.println("th list"+WorkOrderList);
             //System.out.println("the list is"+ModuleList);
	    	}
	     catch (SQLException sqlException) 
		  {
			  sqlException.printStackTrace();
		  }
		  
	     finally
	 	    {
	    	     DataBaseUtils.ensureClosed(csmt); // closing callable statement
				DataBaseUtils.ensureClosed(st);
				DataBaseUtils.ensureClosed(conn);  //closing connection
				
				conn=null;             // removing reference
		    }
	        return mapping.findForward("success");		
	        }
}
