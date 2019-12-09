<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Blog | Login</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="/static/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/Ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="/static/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="/static/iCheck/square/blue.css">
    <link rel="stylesheet" href="/static/toast/css/jquery.toast.css">
	<link rel="stylesheet" href="/static/animate/animate.min.css">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo animated fadeInDown" >
    <a href="../../index2.html"><b>A</b>dmin</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Sign in to start your session</p>

    <form action="/admin/login" method="post">
      <div class="form-group has-feedback animated fadeInUp" style="animation-delay: 0.1s;">
        <input type="username" class="form-control" placeholder="Username" id="login-name">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback animated fadeInUp" style="animation-delay: 0.2s;">
        <input type="password" class="form-control" placeholder="Password" id="login-pwd">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-4 col-xs-offset-4 animated fadeInUp" style="animation-delay: 0.3s;">
          <button type="button" class="btn btn-primary btn-block btn-flat" data-loading-text="loading..." id="btn-login" onclick="btn_login()">Sign In</button>
        </div>
      </div>
    </form>
  </div>
</div>


<!-- jQuery 3 -->
<script src="/static/jquery/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/static/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="/static/iCheck/icheck.min.js"></script>
<script src="/static/layer/layer.js"></script>
<script src="/static/toast/js/jquery.toast.min.js"></script>
<script>
    function btn_login() {
        $('#btn-login').button('loading');
        var name = $("#login-name").val();
        var pwd = $("#login-pwd").val();
        if(name==""||pwd==""){
            $.toast({
                text: "请输入完整信息！",
                heading: '提示',
                icon: "info",
                showHideTransition: 'fade',
                allowToastClose: true,
                hideAfter: 2000,
                stack: 1,
                position: 'top-center',
                textAlign: 'left',
                loader: true,
                loaderBg: '#ffffff'
            });
            $('#btn-login').button('reset');
        }else{
            $.ajax({
                type: 'POST',
                url: '/admin/login',
                async: false,
                data:{
                    'userName': name,
                    'passWord': pwd
                },
                success: function (status) {
                    if(status=="true"){
                        $.toast({
                            text: "登录成功！",
                            heading: '提示',
                            icon: 'success',
                            showHideTransition: 'fade',
                            allowToastClose: true,
                            hideAfter: 1000,
                            stack: 1,
                            position: 'top-center',
                            textAlign: 'left',
                            loader: true,
                            loaderBg: '#ffffff',
                            afterHidden: function () {
                              console.log("test");
                              window.location.href="/admin"
                            }
                        });
                    }/*else if(status=="disable"){
                        $('.login-body').addClass('animate shake');
                        $.toast({
                            text: "密码错误已达到5次，请10分钟后再试！",
                            heading: '提示',
                            icon: 'error',
                            showHideTransition: 'fade',
                            allowToastClose: true,
                            hideAfter: 2000,
                            stack: 1,
                            position: 'top-center',
                            textAlign: 'left',
                            loader: true,
                            loaderBg: '#ffffff',
                            afterHidden: function () {
                                $('.login-body').removeClass('animate shake');
                            }
                        });
                        $('#btn-login').button('reset');
                    }*/else{
                        $('.login-body').addClass('animate shake');
                        $.toast({
                            text: "用户名或者密码错误！",
                            heading: '提示',
                            icon: 'error',
                            showHideTransition: 'fade',
                            allowToastClose: true,
                            hideAfter: 2000,
                            stack: 1,
                            position: 'top-center',
                            textAlign: 'left',
                            loader: true,
                            loaderBg: '#ffffff',
                            afterHidden: function () {

                            }
                        });
                        $('#btn-login').button('reset');
                    }
                }
            });
        }
    }
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' /* optional */
        });
    });
</script>
</body>
</html>
