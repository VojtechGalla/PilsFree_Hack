$source = 'C:\Users\Vojtěch\Desktop\script\ip-hash.txt'
$output = 'C:\Users\Vojtěch\Desktop\script\hash.txt'
$delka = (Get-Content $source).Length

for($i = 0;$i -le ($delka-1); $i++ )
{
    $ip = (Get-Content $source)[$i]
    $ipp = "C:\Users\Vojtěch\Desktop\John179\Hashe\"+$ip
    If (Test-Path $ipp){
        $hash = (Get-Content $ipp)
        $hash>>$output
    }else{
        echo $ip"Neexistuje" 
    }
}
