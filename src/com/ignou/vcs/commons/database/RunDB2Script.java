package com.ignou.vcs.commons.database;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;

public class RunDB2Script implements Runnable
{
   private static final SimpleDateFormat timestampFormat = 
      new SimpleDateFormat("yyyy-MM-dd HH.mm.ss.SSS");
   private static String osType = (System.getProperty("os.name").toUpperCase().
         startsWith("WIN")) ? "WIN" : (System.getProperty("os.name").toUpperCase()
               .startsWith("Z/OS")) ? "z/OS" : "OTHER";  
   private String db2ScriptName = "";

   public RunDB2Script(String db2ScriptName)
   {
      this.db2ScriptName = db2ScriptName;
   }
   
   public void run()
   {
      String line = null;
      Process p = null;
      BufferedReader stdInput = null, stdError = null;

      try
      {
         File f = new File(db2ScriptName);
         String dirName = f.getParent();
         if (osType.equalsIgnoreCase("win"))
         {
            p = Runtime.getRuntime().exec("db2cmd /c /i /w " + "cd " + dirName + 
                  " && db2 -tvf " + db2ScriptName);
            stdInput = new BufferedReader(new InputStreamReader(p.getInputStream()));
            stdError = new BufferedReader(new InputStreamReader(p.getErrorStream()));
            while ((line = stdInput.readLine()) != null)
            {
               if (!(line.equals("")))
                 log(line);
            }
            while ((line = stdError.readLine()) != null)
            {
               if (!(line.equals("")))
                  log(line);
            }
         } else
         {
            String cmd[] = {"/bin/ksh","-c", "cd " + dirName + 
                  " ; db2 -tvf " + db2ScriptName};
            p = Runtime.getRuntime().exec(cmd);
            stdInput = new BufferedReader(new InputStreamReader(p.getInputStream()));
            stdError = new BufferedReader(new InputStreamReader(p.getErrorStream()));
            while ((line = stdInput.readLine()) != null)
            {
               log(line);
            }
            while ((line = stdError.readLine()) != null)
            {
               if (!(line.equals("")))
                  log(line);
            }
         }
         stdInput.close();
         stdError.close();
         p.getInputStream().close();
         p.getErrorStream().close();
      } catch (Exception e) 
      {  
         e.printStackTrace();
      }
    }
   
    private static void log(String msg)
    {
      if (osType.equals("z/OS"))
      {
            System.out.println(timestampFormat.format(new Date()) + ":" + msg);        
      } else 
      {
            System.out.println("[" + timestampFormat.format(new Date()) + "] " + msg);          
      }
    } 
}
