
$WebResponse = Invoke-WebRequest "https://learning.oreilly.com/signup/"
$price = $WebResponse.AllElements | where data-cy -eq "plan-price"  | select innertext | Select -Last 1 -ExpandProperty innertext 
$username = '<email address>'  
$password = "<password>" 
$sec = ConvertTo-SecureString $password -AsPlainText -Force 
$cred = New-Object System.Management.Automation.PSCredential ($username, $sec) 
Send-MailMessage -from $username -to <email> -subject "O'Reilly Price (Monthly): $price" -Body "$price" -SmtpServer smtp.gmail.com -Credential $cred -UseSsl
