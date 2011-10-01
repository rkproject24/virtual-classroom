
package com.ignou.vcs.commons.database;
import java.lang.*;
import java.sql.*;

import com.ibm.db2.jcc.DB2Driver;

class AdmCmdOnlineBackup 
{
  public static void main(String argv[])
  {    
   
    System.out.print("THIS SAMPLE SHOWS HOW TO DO ONLINE BACKUP ");
    System.out.println("USING ADMIN_CMD.");
    Connection con = null;
    CallableStatement callStmt = null;
    ResultSet rs = null;
 
    if (argv.length < 1)
    {
      System.out.print("\n Usage: java AdmCmdOnlineBackup <absolute path"); 
      System.out.println(" for backup>\n");
    }
    else
    {           
      try
      {
        // initialize DB2Driver and establish database connection.
        DB2Driver db2Driver =
          (DB2Driver)
            Class.forName("com.ibm.db2.jcc.DB2Driver").newInstance();
        con = DriverManager.getConnection("jdbc:db2:VCS");

        // prepare the CALL statement for ADMIN_CMD
        String sql = "CALL SYSPROC.ADMIN_CMD(?)";
        callStmt = con.prepareCall(sql);
        
        // execute database backup to the specified path
        String param = "BACKUP DB VCS";

        // set the input parameter  
        callStmt.setString(1, param);

        System.out.println("\nCALL ADMIN_CMD('" + param + "')");
        // call the stored procedure
        callStmt.execute();
      
        // get the result set       
        rs = callStmt.getResultSet();
   
        if (rs.next())
        { 
          // getting the time taken for the database backup 
//          String backupTime = rs.getString(1); 
//          System.out.print("\nTimestamp for the backup image is = ");
//          System.out.println(backupTime);
        }
 
        System.out.println("\nOnline backup completed successfully");        
      }
      catch(Exception e)
      {
        e.printStackTrace();
      }
      finally
      {
        try
        {
          // close the resultset and callStmt
          rs.close();
          callStmt.close();

          // roll back any changes to the database made by this sample
          con.rollback();                                   

          // closing the connection
          con.close();
        }
        catch (Exception x)
        { 
          System.out.print("\n Unable to Rollback/Disconnect ");
          System.out.println("from 'sample' database");  
        }
      }
    } // else
  } // main
} // AdmCmdOnlineBackup 
