$source = 'C:\Users\Vojtěch\Desktop\PilsFree_Hack\John179\run\Hashe_IP'
$output = 'C:\Users\Vojtěch\Desktop\PilsFree_Hack\h.txt'
$ls = 'C:\Users\Vojtěch\Desktop\PilsFree_Hack\ls.txt'
ls -name $source > $ls
$delka = (ls $source).Count
for($i = 0;$i -le $delka; $i++ )
{
   $ip = (Get-Content $ls)[$i] 
   $ans = C:\Users\Vojtěch\Desktop\PilsFree_Hack\John179\run\john.exe --show C:\Users\Vojtěch\Desktop\PilsFree_Hack\John179\run\Hashe_IP\$ip
   if($ans -notlike "*0 password hash*")
   {
      $heslo =   " "+$ans
      $heslo>>$output  
   }
}
rm $ls