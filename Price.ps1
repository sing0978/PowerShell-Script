
$WebResponse = Invoke-WebRequest "https://learning.oreilly.com/signup/"
$price = $WebResponse.AllElements | where data-cy -eq "plan-price"  | select innertext | Select -Last 1 -ExpandProperty innertext 
$username = 'dummyqdummy1@gmail.com'  
$password = "#Guru@123" 
$sec = ConvertTo-SecureString $password -AsPlainText -Force 
$cred = New-Object System.Management.Automation.PSCredential ($username, $sec) 
Send-MailMessage -from $username -to deepsimran7377@gmail.com -subject "O'Reilly Price (Monthly): $price" -Body "$price" -SmtpServer smtp.gmail.com -Credential $cred -UseSsl