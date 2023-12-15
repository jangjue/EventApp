﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EventApp.Login" %>

<!DOCTYPE html>
<!-- Coding By CodingNepal - codingnepalweb.com -->
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   <title>Login & Signup Form</title>
    <link rel="stylesheet" href="login.css" />
  </head>
  <body>
    <section class="wrapper">
      <div class="form signup">
        <header>Signup</header>
        <form action="#">
          <input type="text" placeholder="Full name" required />
          <input type="text" placeholder="User Name" required />
          <input type="text" placeholder="Email address" required />
          <input type="password" placeholder="Password" required />
          <input type="password" placeholder="Confirm Password" required />
          <input type="submit" value="Signup" />
        </form>
      </div>
      <div class="form login">
        <header>Login</header>
        <form action="#">
          <input type="text" placeholder="User Name" required />
          <input type="password" placeholder="Password" required />
          <a href="#">Forgot password?</a>
          <input type="submit" value="Login" />
        </form>
      </div>
      <script>
        const wrapper = document.querySelector(".wrapper"),
          signupHeader = document.querySelector(".signup header"),
          loginHeader = document.querySelector(".login header");
        loginHeader.addEventListener("click", () => {
          wrapper.classList.add("active");
        });
        signupHeader.addEventListener("click", () => {
          wrapper.classList.remove("active");
        });
      </script>
    </section>
  </body>
</html>
