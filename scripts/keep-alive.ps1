#requires -Version 3.0
[CmdletBinding()]
param(
    [Parameter()]
    [ValidateRange(1, 86400)]
    [int]$IntervalSeconds = 240,

    [Parameter()]
    [ValidateRange(1, 50)]
    [int]$NudgePixels = 1
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$signature = @"
using System;
using System.Runtime.InteropServices;

public static class InputNudge {
    [StructLayout(LayoutKind.Sequential)]
    public struct POINT {
        public int X;
        public int Y;
    }

    [DllImport("user32.dll")]
    public static extern bool GetCursorPos(out POINT lpPoint);

    [DllImport("user32.dll")]
    public static extern bool SetCursorPos(int x, int y);
}
"@

Add-Type -TypeDefinition $signature -ErrorAction Stop

function Invoke-CursorNudge {
    $pos = New-Object InputNudge+POINT
    [InputNudge]::GetCursorPos([ref]$pos) | Out-Null
    [InputNudge]::SetCursorPos($pos.X + $NudgePixels, $pos.Y + $NudgePixels) | Out-Null
    Start-Sleep -Milliseconds 75
    [InputNudge]::SetCursorPos($pos.X, $pos.Y) | Out-Null
}

Write-Host "Keep-alive running. Nudging pointer by $NudgePixels px every $IntervalSeconds seconds. Ctrl+C to stop."

while ($true) {
    Invoke-CursorNudge
    Start-Sleep -Seconds $IntervalSeconds
}
