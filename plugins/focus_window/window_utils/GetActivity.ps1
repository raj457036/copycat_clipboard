Add-Type @"
 using System;
 using System.Runtime.InteropServices;
 using System.Text;
 
 public class APIFuncs
   {
      [DllImport("user32.dll", SetLastError=true, CharSet=CharSet.Auto)]
         public static extern IntPtr GetForegroundWindow();
      [DllImport("user32.dll")]
         public static extern Int32 GetWindowThreadProcessId(IntPtr hWnd,out Int32 lpdwProcessId);
         
      public static  Int32 GetWindowProcessID(IntPtr hwnd)
      {
         Int32 pid;
         GetWindowThreadProcessId(hwnd, out pid);
         return pid;
      }
   }
"@

Add-Type -AssemblyName System.Drawing

$w = [APIFuncs]::GetForegroundWindow()
$p = [APIFuncs]::GetWindowProcessID($w)


$WH = get-process | Where-Object { $_.Id -eq $p }

@"
Company,CPU,Description,FileVersion,Id,MainWindowTitle,Name,Path,ProcessName,Product,StartTime
$($WH.Company),$($WH.CPU),$($WH.Description),$($WH.FileVersion),$($WH.Id),$($WH.MainWindowTitle),$($WH.Name),$($WH.Path),$($WH.ProcessName),$($WH.Product),$($WH.MainWindowHandle)
"@ | ConvertFrom-Csv | ConvertTo-Json