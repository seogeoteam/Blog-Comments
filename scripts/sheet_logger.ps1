<#
.SYNOPSIS
    sheet_logger.ps1 - Google Sheets tracking helper for Blog Comments.
.DESCRIPTION
    Automates logging published comment URLs into the "blog comment" Google Sheet tab,
    applying yellow divider rows and sequential Column E allocation.
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$PublishedUrl,
    [int]$YellowRowHeaderX = 1940,
    [int]$YellowRowHeaderY = 704,
    [int]$BucketIconX = 2675,
    [int]$BucketIconY = 235,
    [int]$YellowPaletteX = 2736,
    [int]$YellowPaletteY = 328,
    [int]$TargetCellX = 2620,
    [int]$TargetCellY = 744
)

Add-Type -AssemblyName System.Windows.Forms
Add-Type @"
using System;
using System.Runtime.InteropServices;

public class SheetLoggerNav {
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

    public static void PressEnter() {
        keybd_event(0x0D, 0, 0, UIntPtr.Zero);
        System.Threading.Thread.Sleep(50);
        keybd_event(0x0D, 0, 0x0002, UIntPtr.Zero);
        System.Threading.Thread.Sleep(100);
    }

    public static void PressEscape() {
        keybd_event(0x1B, 0, 0, UIntPtr.Zero);
        System.Threading.Thread.Sleep(50);
        keybd_event(0x1B, 0, 0x0002, UIntPtr.Zero);
        System.Threading.Thread.Sleep(100);
    }
}
"@

Write-Output "[*] Copying URL to clipboard..."
Set-Clipboard -Value $PublishedUrl

Write-Output "[*] Selecting row to apply yellow divider..."
[SheetLoggerNav]::Click($YellowRowHeaderX, $YellowRowHeaderY)
Start-Sleep -Milliseconds 400

Write-Output "[*] Opening fill color palette..."
[SheetLoggerNav]::Click($BucketIconX, $BucketIconY)
Start-Sleep -Milliseconds 500

Write-Output "[*] Applying yellow color..."
[SheetLoggerNav]::Click($YellowPaletteX, $YellowPaletteY)
Start-Sleep -Milliseconds 500

Write-Output "[*] Selecting target cell in Column E on the next row..."
[SheetLoggerNav]::Click($TargetCellX, $TargetCellY)
Start-Sleep -Milliseconds 400

Write-Output "[*] Pasting published URL..."
[SheetLoggerNav]::Paste()
Start-Sleep -Milliseconds 400

Write-Output "[*] Committing entry..."
[SheetLoggerNav]::PressEnter()
Start-Sleep -Milliseconds 300
[SheetLoggerNav]::PressEscape()

Write-Output "[+] URL logged successfully in Google Sheets."
