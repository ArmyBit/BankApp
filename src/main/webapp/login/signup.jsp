<%--
  Created by IntelliJ IDEA.
  User: Saad
  Date: 3/15/2024
  Time: 5:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SignUp</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <style>
    .login {
        width: 600px;
        padding: 30px;
        padding-top: 156px;
    }
    .container {
        display: flex;
        align-items: center;
        justify-content: center;
        min-height: 100vh;
    }

    .screen__content {
        z-index: 1;
        position: relative;
    }
    .login__field {
        padding: 20px 0px;
        position: relative;
    }
    body {
        background: linear-gradient(90deg, #2C2C2C, #000000);
        color: #FFF; /* Set text color to white */
    }
</style>
</head>
<body>
<div class="container">
    <div class="screen">
        <div class="screen__content">
            <div style="text-align: center ;padding-top: 1%">
            <div class="alert alert-dark" role="alert">
                Sign Up to the Dark BanK
            </div>
            </div>
            <form>

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username" placeholder="Username" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputPassword4">Password</label>
                        <input type="password" class="form-control" id="inputPassword4" placeholder="Password" required >
                    </div>
                </div>
                <div class="form-group">
                    <label for="mail">Mail</label>
                    <input type="email" class="form-control" id="mail" placeholder="**@**.**" required>
                </div>
                <div class="form-group">
                    <label for="inputAddress2">Address 2</label>
                    <input type="text" class="form-control" id="inputAddress2"  required placeholder="Apartment, studio, or floor">
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputCity">City</label>
                        <input type="text" class="form-control" id="inputCity"required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="inputState">State</label>
                        <select id="inputState" class="form-control" required>
                            <option selected>Choose...</option>
                            <option>Tangier-Tetouan-Al Hoceima</option>
                            <option>Oriental</option>
                            <option>Fès-Meknès</option>
                            <option>Rabat-Salé-Kénitra</option>
                            <option>Béni Mellal-Khénifra</option>
                            <option>Casablanca-Settat
                            </option>
                            <option>                            Marrakesh-Safi
                            </option>
                            <option>Draa-Tafilalet</option>
                            <option> Souss-Massa</option>
                            <option>                             Guelmim-Oued Noun
                            </option>
                            <option>   Laâyoune-Sakia El Hamra</option>
                            <option> Dakhla-Oued Ed-Dahab</option>





                        </select>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="inputZip">Zip</label>
                        <input type="text" class="form-control" id="inputZip" required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="gridCheck" required>
                        <label class="form-check-label" for="gridCheck">
                            I hereby consent to receive notifications at a later time regarding the process of opening a new account at your bank. Furthermore, I agree to submit my legal information through your website for processing by your automated system.                        </label>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Sign in</button>
            </form>
</div>
    </div>
</div>

</body>
</html>
