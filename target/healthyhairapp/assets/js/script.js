let forgot_email = document.getElementById("forgot_email").value;

function sendEmail() {
  const possibleChars = "0123456789";
  let OTP = "";
  for (let i = 0; i < 4; i++) {
    OTP += possibleChars.charAt(
      Math.floor(Math.random() * possibleChars.length)
    );
  }
  let set_otp = JSON.stringify(OTP);
  localStorage.setItem("otp", set_otp);
  let emailBody = `
   <h1>Healthy hair OTP Verfication</h1> <br>
   <h2>Your OTP Code is</h2>${OTP}
`;
  Email.send({
    SecureToken: "1a41faa9-e2a8-4c78-a568-0aa248c37e1b",
    To: "mowsabin@gmail.com",
    From: "healthyhair0412@gmail.com",
    Subject: "This is the subject",
    Body: emailBody,
  }).then((message) => alert(message));
}

// verify otp
let otp_btn = document.getElementById("verifyOtp");
otp_btn.addEventListener("submit", (e) => {
  e.preventDefault();
  verifyOtp();
});
function verifyOtp() {
  // let verify_btn = document.getElementById("OTP_btn")
  let otp_verified = 0;
  let getOtp = JSON.parse(localStorage.getItem("otp"));
  let otpverify = document.getElementById("enter_otp").value;
  console.log(otpverify);
  // verify_btn.addEventListener("submit",()=>{
  if (otpverify == getOtp) {
    otp_verified += 1;
    alert("Logged IN");
    window.location.href = "../index.html";
  } else {
    alert("Invalid OTP");
  }
  console.log(otpverify);
  let otp_verify = JSON.stringify(otp_verified);
  localStorage.setItem("today_logged", otp_verify);
}

//
// for nav
document.querySelector(".navbar-btn").onclick = function () {
  document.querySelector(".navbar-item").classList.toggle("hide");
};

document.querySelector(".navbar-btn").onclick = function () {
  document.querySelector(".navbar-item").classList.toggle("hide");
};


///my signup
let check = false;
const signup = document.getElementById("signUp");
signup.addEventListener("submit", function (event) {
  event.preventDefault();
  if (localStorage.getItem("userData") != null) {
    let arrayOfUserDetails = JSON.parse(localStorage.getItem("userData"));
  }
  let sign_type = document.getElementById("input_type").value;
  let userName = document.getElementById("username").value;
  let email = document.getElementById("email").value;
  let phoneNo = document.getElementById("phone-no").value;
  let password = document.getElementById("password").value;
  let confirmPassword = document.getElementById("confirm-password").value;
  let user_id = Date.now();

  let userDetails = {
    username: userName,
    email: email,
    phoneNo: phoneNo,
    password: password,
    confirmPassword: confirmPassword,
    user_id,
    sign_type,
    image:
      "https://png.pngtree.com/png-clipart/20200224/original/pngtree-avatar-icon-profile-icon-member-login-vector-isolated-png-image_5247852.jpg",
  };
  let check = checkUser(phoneNo, email);

  if (check == false) {
    if (userDetails.password == userDetails.confirmPassword) {
      if (userDetails.sign_type == "customer") {
        let customer = [];
        if (JSON.parse(localStorage.getItem("userData")) != null) {
          customer = JSON.parse(localStorage.getItem("userData"));
        }
        customer.push(userDetails);
        let stringArray = JSON.stringify(customer);
        localStorage.setItem("userData", stringArray);
        Notify.success(
          "You have successfully Registered Please login your account"
        );
        location.reload();
      }
      if (userDetails.sign_type == "seller") {
        let seller = [];
        if (JSON.parse(localStorage.getItem("seller")) != null) {
          seller = JSON.parse(localStorage.getItem("seller"));
        }
        seller.push(userDetails);
        let seller_str = JSON.stringify(seller);
        localStorage.setItem("seller", seller_str);
        Notify.success(
          "You have successfully Registered please login to your account"
        );
        location.reload();
      }
    } else {
      Notify.error("Please Check Your Details");
    }
  }
});
// function check user
function checkUser(phn, email) {
  let user = [];
  if (JSON.parse(localStorage.getItem("userData") != null)) {
    user = JSON.parse(localStorage.getItem("userData"));
  }
  let seller = [];
  if (JSON.parse(localStorage.getItem("seller") != null)) {
    seller = JSON.parse(localStorage.getItem("seller"));
  }
  let check = false;
  user.find((e) => {
    if (e["email"] == email) {
      check = true;
      Notify.error("Email already Exist");
      return true;
    }
    if (phn == e["phoneNo"]) {
      check = true;
      Notify.error("Phone number already exist");
      return true;
    }
  });

  seller.find((e) => {
    if (e["email"] == email) {
      check = true;
      Notify.error("Email already exist");
      return true;
    }
    if (phn == e["phoneNo"]) {
      check = true;
      Notify.error("Phone number Already exist");
    }
  });
  return check;
}
// MY LOGIN
let loginForm = document.getElementById("login_form");
loginForm.addEventListener("submit", function (event) {
  event.preventDefault();
  let email = document.getElementById("loginEmail").value;
  let password = document.getElementById("loginPassword").value;
  let isExist = false;
  let find_customer = JSON.parse(localStorage.getItem("userData"));
  let find_seller = JSON.parse(localStorage.getItem("seller"));
  find_customer.find(function (user) {
    if (email === user["email"]) {
      isExist = true;
      if (password === user["password"]) {
        Notify.success("successfully loged in");
        window.open("/Pages/Product.html");
        localStorage.setItem("login", JSON.stringify(user["user_id"]));
        return isExist;
      } else {
        Notify.error("password not match");
        return isExist;
      }
    }
    return isExist;
  });
  if (isExist == false) {
    find_seller.find(function (user) {
      if (email === user["email"]) {
        isExist = true;
        if (password === user["password"]) {
          Notify.success("successfully seller loged in");
          window.location.href = "../Pages/sellerAdd.html";
          localStorage.setItem("login_seller", JSON.stringify(user["user_id"]));
          return isExist;
        } else {
          Notify.error("password not match");
        }
      }
      return isExist;
    });
  }
  if (email === "admin@gmail.com") {
    if (password == 1234567890) {
      Notify.success("Welcome");
      window.open("/Pages/adPanel.html");
    } else {
      Notify.error("invalid please check");
    }
  }
  if (isExist === false) {
    Notify.error("Invalid user crentials");
  }
});

let logged = JSON.parse(localStorage.getItem("login"));
let login_btn = document.getElementById("login_btn");
let profile = document.querySelector(".pro_img");
let nav = document.querySelector(".navbar-item");
if (logged != null) {
  login_btn.style.display = "none";
  profile.style.display = "block";
  nav.style.marginRight = "100px";
  profile.style.marginTop = "20px";
}

let show_profile = document.getElementById("show_profile");
let user = JSON.parse(localStorage.getItem("userData"));
let log_user = user.find((obj) => logged == obj["user_id"]);
show_profile.setAttribute("src", log_user["image"]);

let otp_container = document.querySelector(".otp_verification");
let email_container = document.querySelector(".hide_email");
let enter_otp = document.querySelector(".hide_otp");
function forgot() {
  otp_container.style.display = "block";
}

document.getElementById("send-otp").addEventListener("click", function (e) {
  e.preventDefault();

  email_container.style.display = "none";
  enter_otp.style.display = "block";
});

document.getElementById("verifyOtp").addEventListener("click", function (e) {
  e.preventDefault();
  let forgot_password = document.querySelector(".forgot_container");
  enter_otp.style.display = "none";
  forgot_password.style.display = "block";
});
