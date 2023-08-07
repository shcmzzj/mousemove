$Signature = @'
  [DllImport("user32.dll")]
  public static extern void mouse_event(long dwFlags, long dx, long dy, long cButtons, long dwExtraInfo);
'@
$MouseEvent = Add-Type -MemberDefinition $Signature -Name "Win32MouseEvent" -Namespace Win32Functions -PassThru
while ($true) {
    Start-Sleep -s 60
    $MouseEvent::mouse_event(0x00000001, 10, 0, 0, 0)
    Start-Sleep -s 60
    $MouseEvent::mouse_event(0x00000001, -10, 0, 0, 0)
}
