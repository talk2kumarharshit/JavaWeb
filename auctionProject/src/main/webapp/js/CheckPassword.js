function checkPassword()
{
	pass1=document.signupForm.password.value;
	pass2=document.signupForm.password2.value;
	if(pass1==pass2)
	{
		document.getElementById("msg").innerHTML = "Password Match";
		document.getElementById("msg").style.color = "green";
	}
	else 
	{
		document.getElementById("msg").innerHTML = "Password Mismatch";
		document.getElementById("msg").style.color = "red";
	}
}