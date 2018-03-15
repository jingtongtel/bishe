<!DOCTYPE html>
<html >
<head>
<meta charset="UTF-8">
<title>Sign Up Login</title>
<link rel="stylesheet" href="css/styleindex.css">
<script src="js/jquery-2.0.3.min.js"></script>
<script src="js/index.js"></script>
</head>

<body>
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
<body>
<div class="cotn_principal">
  <div class="cont_centrar">
    <div class="cont_login">
      <div class="cont_info_log_sign_up">
        <div class="col_md_login">
          <div class="cont_ba_opcitiy">
            <h2>LOGIN</h2>
            <p>Lorem ipsum dolor sit amet, consectetur.</p>
            <button class="btn_login" onclick="cambiar_login()">LOGIN</button>
          </div>
        </div>
        <div class="col_md_sign_up">
          <div class="cont_ba_opcitiy">
            <h2>SIGN UP</h2>
            <p>Lorem ipsum dolor sit amet, consectetur.</p>
            <button class="btn_sign_up" onclick="cambiar_sign_up()">SIGN UP</button>
          </div>
        </div>
      </div>
      <div class="cont_back_info">
        <div class="cont_img_back_grey"> <img src="image/po.jpg" alt="" /> </div>
      </div>
      <div class="cont_forms" >
        <div class="cont_img_back_"> <img src="image/po.jpg" alt="" /> </div>
        <div class="cont_form_login"> <a href="#" onclick="ocultar_login_sign_up()" ><i class="material-icons">&#xE5C4;</i></a>
          <h2>LOGIN</h2>
          <input type="text" placeholder="userId" id="userName" />
          <input type="password" placeholder="Password" id="userPwd" />
          <button class="btn_login" onclick="cambiar_login()">LOGIN</button>
        </div>
        <div class="cont_form_sign_up"> <a href="#" onclick="ocultar_login_sign_up()"><i class="material-icons">&#xE5C4;</i></a>
          <h2>SIGN UP</h2>
          <input type="text" placeholder="Email" id="Email" />
          <input type="text" placeholder="User" id="User"/>
          <input type="password" placeholder="Password" id="Password" />
          <input type="password" placeholder="Confirm Password" id="Confirm Password" />
          <button class="btn_sign_up" onclick="cambiar_sign_up()">SIGN UP</button>
        </div>
      </div>
    </div>
  </div>
</div>

</body>

</body>
</html>
