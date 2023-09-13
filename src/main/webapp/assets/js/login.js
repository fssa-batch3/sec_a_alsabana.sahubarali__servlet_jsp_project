
let loginPop = document.getElementById("login_btn");
loginPop.addEventListener("click", (event) => {
   // Your code here
   event.preventDefault();
   let loginpop = document.getElementById("pop");
   loginpop.classList.add("open-popup");


 });
 
 let closepop = document.getElementById("close");
  let loginpop2 = document.getElementById("pop");
closepop.addEventListener("click", (event) => {
   // Your code here
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

