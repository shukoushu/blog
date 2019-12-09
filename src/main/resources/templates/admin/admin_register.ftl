<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Blog | Admin</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="/static/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="/static/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="/static/dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="/static/iCheck/square/blue.css">
  <link rel="stylesheet" href="/static/bootstrapvalidator/css/bootstrapValidator.min.css"  />
  <link rel="stylesheet" href="/static/animate/animate.min.css">


  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo animated fadeInDown">
    <b>Admin</b>
  </div>

  <div class="register-box-body">
    <p class="login-box-msg">Register a new membership</p>

    <form method="post" action="/admin/register/save">
      <div id="installFirst">
        <div class="form-group has-feedback animated fadeInUp" style="animation-delay: 0.1s;">
          <input type="text" class="form-control" placeholder="博客地址" name="blogUrl">
          <span class="glyphicon glyphicon-link form-control-feedback"></span>
        </div>
        <div class="form-group has-feedback animated fadeInUp" style="animation-delay: 0.2s;">
          <input type="text" class="form-control" placeholder="电子邮箱" name="userEmail">
          <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
        </div>
        <div class="form-group has-feedback animated fadeInUp" style="animation-delay: 0.3s;">
          <input type="text" class="form-control" placeholder="用户名" name="userName">
          <span class="glyphicon glyphicon-user form-control-feedback"></span>
        </div>
        <div class="form-group has-feedback animated fadeInUp" style="animation-delay: 0.4s;">
          <input type="text" class="form-control" placeholder="显示昵称" name="userDisplayName">
          <span class="glyphicon glyphicon-asterisk form-control-feedback"></span>
        </div>
        <div class="form-group has-feedback animated fadeInUp" style="animation-delay: 0.5s;">
          <input type="password" class="form-control" placeholder="登陆密码" name="passWord">
          <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>
        <div class="form-group has-feedback animated fadeInUp" style="animation-delay: 0.6s;">
          <input type="text" class="form-control" placeholder="确认密码" name="userRePwd">
          <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
        </div>
        <div class="row">
          <div class="col-xs-4 col-xs-offset-8">
            <button type="submit" class="btn btn-primary btn-block btn-flat">注册</button>
          </div>
        </div>
      </div>
      <div class="box box-solid animated fadeInUp" style="display: none" id="installSuccess">
        <div class="box-body">
          <h2>安装成功！</h2>
          <h4>你可以选择进入前台，或者登陆后台！</h4>
        </div>
        <div class="box-footer" style="padding-right: 30px;">
          <a class="btn btn-primary btn-sm btn-flat" href="/">前台</a>
          <a class="btn btn-primary btn-sm btn-flat" href="/admin/login">登录后台</a>
        </div>
      </div>
      <div class="box box-solid animated fadeInUp" style="display: none" id="installError">
        <div class="box-body">
          <h2>安装失败！</h2>
          <h4>请返回安装页面尝试重新安装！</h4>
        </div>
        <div class="box-footer" style="padding-right: 30px;">
          <a class="btn btn-primary btn-sm btn-flat" href="/install">返回</a>
        </div>
      </div>
    </form>
  </div>
</div>

<!-- jQuery 3 -->
<script src="/static/jquery/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="/static/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="/static/bootstrapvalidator/js/bootstrapValidator.min.js"></script>
<script src="/static/bootstrapvalidator/js/language/zh_CN.js"></script>
<!-- iCheck -->
<script src="/static/iCheck/icheck.min.js"></script>
<script>


  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
  });
  $(function() {
    $('form').bootstrapValidator({
      message: '安装表单验证失败',
      feedbackIcons: {
        validating: 'glyphicon glyphicon-refresh'
      },
      fields: {
        userName: {
          message: '用户名验证失败',
          validators: {
            notEmpty: {
              message: '用户名不能为空'
            }
          }
        },
        userEmail: {
          validators: {
            notEmpty: {
              message: '邮箱地址不能为空'
            },
            emailAddress: {
              message: '邮箱地址格式有误'
            }
          }
        },
        passWord: {
          message: '密码验证失败',
          validators: {
            notEmpty: {
              message: '密码不能为空'
            },
            stringLength: {
              min: 6,
              max: 18,
              message: '密码长度必须在6到18位之间'
            }
          }
        },
        userRePwd: {
          message: '密码验证失败',
          validators: {
            notEmpty: {
              message: '确认密码不能为空'
            },
            identical: {
              field: 'passWord',
              message: '两次输入的密码不相符'
            }
          }
        }
      }
    }).on('success.form.bv', function(e) {
      e.preventDefault();
      var $form = $(e.target);
      var bv = $form.data('bootstrapValidator');
      $.post($form.attr('action'), $form.serialize(), function(result) {
        if (result == true) {
          $('#installFirst').hide();
          $('#installSuccess').show();
        } else {
          $('#installFirst').hide();
          $('#installError').show();
        }
      }, 'json');
    });
  });
</script>
</body>
</html>
