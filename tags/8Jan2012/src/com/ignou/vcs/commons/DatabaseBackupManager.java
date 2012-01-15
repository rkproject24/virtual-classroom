package com.ignou.vcs.commons;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author Pradeepthi S
 * source: http://stackoverflow.com/questions/5793385/how-can-i-backup-and-restore-date-from-mysql-data-base
 **/

public class DatabaseBackupManager 
{
	private static final String DATABASE = "vcs_schema";
	private static final String DB_USER_NAME = "root";
	private static final String DB_PASSWORD = "root";
	private static final String MY_SQL_DUMP_PATH = "C://Program Files//MySQL//MySQL Server 5.0//bin";
	private static final String DB_BACKUP_PATH = "D://";
	
	public static String backupName = "";
	//for windows vista don't take file path in C drive as C-drive will be restricting to write files.
	
	public static boolean takeBackUp() 
	{
		boolean status = false;
		String backupFileName = DATABASE;
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("ddMMMyyhhmmss");
		String backupPath = DB_BACKUP_PATH +backupFileName+sdf.format(dt)+".sql";
		backupName = backupPath;
		
		String command =  MY_SQL_DUMP_PATH + "//mysqldump -u " + DB_USER_NAME + " -p" + DB_PASSWORD + " " + DATABASE + " -r " + backupPath;
		
		try 
		{
			Process runtimeProcess = Runtime.getRuntime().exec(command);
			int processComplete = runtimeProcess.waitFor();
			if (processComplete == 0) 
			{
				System.out.println("DatabaseManager.backup: Backup Successfull");
				status = true;
			} 
			else 
			{
				System.out.println("DatabaseManager.backup: Backup Failure!");
			}
		} 
		catch (IOException ioe) 
		{
			System.out.println("Exception IO");
			ioe.printStackTrace();
		} 
		catch (Exception e) 
		{
			System.out.println("Exception");
			e.printStackTrace();
		}
		return status;
	}

	public static boolean restore(String filePath) 
	{
		boolean status = false;
		String[] command = new String[]{MY_SQL_DUMP_PATH + "/mysql", DATABASE, "-u" + DB_USER_NAME, "-p" + DB_PASSWORD, "-e", " source "+filePath }; 
		try {
			Process runtimeProcess = Runtime.getRuntime().exec(command);
			int processComplete = runtimeProcess.waitFor();
			if (processComplete == 0) 
			{
				System.out.println("DatabaseManager.restore: Restore Successfull");
				status = true;
			} 
			else 
			{
				System.out.println("DatabaseManager.restore: Restore Failure!");
			}
		} 
		catch (IOException ioe) 
		{
			System.out.println("Exception IO");
			ioe.printStackTrace();
		} 
		catch (Exception e) 
		{
			System.out.println("Exception");
			e.printStackTrace();
		}
		return status;
	} // for testing

	public static void main(String args[]) 
	{
		String backupName = "D://vcs_schema19Dec11104032.sql";
		//DatabaseBackupManager.backup(DATABASE);
		DatabaseBackupManager.restore(backupName);
	}
}
