$source = 'C:\Users\Vojtěch\Desktop\script\ip.txt'
$output = 'C:\Users\Vojtěch\Desktop\script\outip.txt'
$strFileName = 'C:\Users\Vojtěch\Desktop\script\web1.html'
$delka = (Get-Content $source).Length

for($i = 0;$i -le ($delka-1); $i++ )
{
    If (Test-Path $strFileName){
   	Remove-Item $strFileName
    }
    $ip = (Get-Content $source)[$i]
    $ipd = $ip + "/admin.cgi/sd.css"
    try{
    wget $ipd -OutFile C:\Users\Vojtěch\Desktop\script\web1.html -TimeoutSec 1
    }catch{
    #Write-Warning "$($error[0])"
    }
    sleep(0.3)
    If (Test-Path $strFileName){
    try {
       $size = (Get-Item C:\Users\Vojtěch\Desktop\script\web1.html).length
    }catch [ItemNotFoundException] {
    $size = 0
    }
    }
 
    if($size -gt 1000)
    {
        echo $ip"  ANO "$i
        $ip>>$output
    }else{
        echo $ip"  NE "$i
    }
    If (Test-Path $strFileName){
   	Remove-Item $strFileName
    }
$size = 0
 }