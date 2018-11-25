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
public class GetSalaryDetailsAction extends Action{
	
     boolean booleanValue=false;

	  public GetSalaryDetailsAction() {
		
		
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
	        Statement st1=null;
	        ResultSet rs1=null;
			String Query="";
			String Query1="";
		    boolean booleanValue=false,flag=false;
	 	    int result;
	 	   
	 	    List SalList=new ArrayList();
	 	    
	 	   
		    
		    String employeeNo=request.getParameter("employeeNo");
		 
		    
	      
		    
	     try
	     {
	    	
	    	 
	    	 conn=DataBaseUtils.getMySqlConnection();
	    	
	    	
	    	 Query="select start_date,gross_sal_mnt,currency from emp_salary_det a where a.version_no=(select max(version_no) from emp_salary_det b where b.emp_no=a.emp_no) and  emp_no="+"'"+employeeNo+"'";
	    	 
	    	 
	    	 
	    	
	    	   st=conn.createStatement();
			   rs=st.executeQuery(Query);
//			   int i=1;
			 
			
			   while(rs.next())
			   {
				  System.out.println("in first");
				  System.out.println("++++++++++++++"+rs.getString(1));
				  System.out.println("****************"+rs.getString(2));
				  String date=rs.getString(1);
				  date=date.substring(0,10);
				   SalList.add(date);
				   
				   SalList.add(rs.getString(2));
				   SalList.add(rs.getString(3));
			  
				  
			  
			   }
			   System.out.println("sise"+SalList.size());
			   request.setAttribute("SalList",SalList);
			   
			   try{
			 if(SalList.size()==0)
				{
				  Query1= "select doj from employee_master where emp_no="+"'"+employeeNo+"'";
				  st1=conn.createStatement();
				  rs1=st1.executeQuery(Query1);
				  System.out.println("if loop");
				}
		 	   
		      //System.out.println("Map Values :::::: "+moduleMap);
		      
			    /** 
		   		 * Execute the procedure
			     */
			   

			   // System.out.println("**** Procedure Executed for insert******");
			    /** 
			   	 * Log the Result
			   	 */
			   	   
			
			  while(rs1.next())
			   {
				
				   
				  String date1=rs1.getString(1);
				  date1=date1.substring(0,10);
				  SalList.add(date1);
				  
			       System.out.println("in second");
				   request.setAttribute("SalList",SalList);
				  System.out.println("list"+SalList);
			  
			   }
			   }
			   catch(Exception e)
			   {
				   e.printStackTrace();
			   }
	      
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
