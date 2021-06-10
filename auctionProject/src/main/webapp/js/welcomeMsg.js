function welcomeMsg() 
		{
			var val =  document.getElementById("id1").value;
			/* alert("welcome " + val) */
			if(window.confirm("Signup Successfully "+ val +" Do You Want To Login  Click 'ok' "))
			{
				window.location.href="index.jsp";	
			}
		}