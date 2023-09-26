
let loginPop = document.getElementById("login_btn");
loginPop.addEventListener("click", (event) => {
   
   event.preventDefault();
   let loginpop = document.getElementById("pop");
   loginpop.classList.add("open-popup");


 });
 
 let closepop = document.getElementById("close");
  let loginpop2 = document.getElementById("pop");
closepop.addEventListener("click", (event) => {
  
   event.preventDefault();
  
  loginpop2.classList.remove("open-popup");


 });
 

let signup = document.getElementById("signupOp");
let signForm = document.getElementById("popup");
signup.addEventListener("click",(e)=>{
	e.preventDefault();
		signForm.classList.add("sign-block");
	loginpop2.classList.remove("open-popup");
})


 let closeSignUp = document.getElementById("closeSign");
 let exitPop = document.querySelector(".signup-pop");
closeSignUp.addEventListener("click", (event) => {
  exitPop.classList.remove("sign-block");


 });

  const passwordInput = document.getElementById('confirm-password');
    const eyeIcon = document.getElementById('eyeIcon');

    eyeIcon.addEventListener('click', function() {
        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            eyeIcon.classList.remove('fa-eye-slash');
            eyeIcon.classList.add('fa-eye');
        } else {
            passwordInput.type = 'password';
            eyeIcon.classList.remove('fa-eye');
            eyeIcon.classList.add('fa-eye-slash');
        }
    });
    
    
    
    	
				const passwordInput1 = document.getElementById('loginPassword');
				const eyeIcon1 = document.getElementById('logineyeIcon');

				eyeIcon1.addEventListener('click', function() {
					if (passwordInput1.type === 'password') {
						passwordInput1.type = 'text';
						eyeIcon1.classList.remove('fa-eye-slash');
						eyeIcon1.classList.add('fa-eye');
					} else {
						passwordInput1.type = 'password';
						eyeIcon1.classList.remove('fa-eye');
						eyeIcon1.classList.add('fa-eye-slash');
					}
				});
			