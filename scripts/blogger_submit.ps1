<#
.SYNOPSIS
    blogger_submit.ps1 - Automated submission helper for Blogger comment iframes.
.DESCRIPTION
    Interacts with the Blogger comment iframe in an active Chrome session, pastes
    the prepared comment (with HTML bold backlink), and clicks the PUBLISH button.
#>

param(
    [string]$CommentText,
    [int]$IframeClickX = 2220,
    [int]$IframeClickY = 700,
    [int]$PublishButtonX = 2090,
    [int]$PublishButtonY = 950
)

Add-Type -AssemblyName System.Windows.Forms
Add-Type @"
using System;
using System.Runtime.InteropServices;

public class BloggerAutomator {
    [DllImport("user32.dll")]
    public static extern bool SetForegroundWindow(IntPtr hWnd);

    [DllImport("user32.dll")]
    public static extern void mouse_event(uint dwFlags, uint dx, uint dy, uint dwData, UIntPtr dwExtraInfo);

    [DllImport("user32.dll")]
    public static extern bool SetCursorPos(int X, int Y);

    [DllImport("user32.dll")]
    public static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, UIntPtr dwExtraInfo);

    public const uint MOUSEEVENTF_LEFTDOWN = 0x0002;
    public const uint MOUSEEVENTF_LEFTUP = 0x0004;

    public static void Click(int x, int y) {
        SetCursorPos(x, y);
        System.Threading.Thread.Sleep(80);
        mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, UIntPtr.Zero);
        System.Threading.Thread.Sleep(80);
        mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, UIntPtr.Zero);
    }

    public static void Paste() {
        keybd_event(0x11, 0, 0, UIntPtr.Zero); // Ctrl
        System.Threading.Thread.Sleep(50);
        keybd_event(0x56, 0, 0, UIntPtr.Zero); // V
        System.Threading.Thread.Sleep(50);
        keybd_event(0x56, 0, 0x0002, UIntPtr.Zero);
        System.Threading.Thread.Sleep(50);
        keybd_event(0x11, 0, 0x0002, UIntPtr.Zero);
        System.Threading.Thread.Sleep(100);
    }
}
"@

if ($CommentText) {
    Set-Clipboard -Value $CommentText
}

Write-Output "[*] Focusing target Chrome session..."
$procs = Get-Process chrome | Where-Object { $_.MainWindowHandle -ne 0 }
if ($procs) {
    [BloggerAutomator]::SetForegroundWindow($procs[0].MainWindowHandle)
    Start-Sleep -Milliseconds 400
}

Write-Output "[*] Clicking comment editor textarea..."
[BloggerAutomator]::Click($IframeClickX, $IframeClickY)
Start-Sleep -Milliseconds 400

Write-Output "[*] Pasting comment content..."
[BloggerAutomator]::Paste()
Start-Sleep -Milliseconds 600

Write-Output "[*] Clicking PUBLISH button..."
[BloggerAutomator]::Click($PublishButtonX, $PublishButtonY)
Start-Sleep -Milliseconds 1000

Write-Output "[+] Comment submission sequence completed."
