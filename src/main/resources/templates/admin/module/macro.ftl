<#macro head title="">
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>${title?default("blogAdmin")}</title>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="/static/bootstrap/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="/static/select2/css/select2.min.css">
        <link rel="stylesheet" href="/static/dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="/static/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="/static/dist/css/skins/_all-skins.min.css">
        <link rel="stylesheet" href="/static/dist/css/skins/skin-blue.min.css">
        <link rel="stylesheet" href="/static/easymde/easymde.min.css">
        <link rel="stylesheet" href="/static/toast/css/jquery.toast.css">
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
    </head>
        <body class="hold-transition ${options.admin_theme?default('skin-blue')} ${options.admin_layout?default('')} ${options.sidebar_style?default('')} sidebar-mini">
        <script src="/static/jquery/jquery.min.js"></script>
        <script src="/static/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="/static/dist/js/adminlte.min.js"></script>
        <script src="/static/select2/js/select2.full.min.js"></script>
        <script src=/static/select2/js/i18n/zh-CN.js></script>
        <script src="/static/easymde/easymde.min.js"></script>
        <script src="/static/bootstrap-fileinput-master/js/fileinput.js"></script>
        <script src="/static/bootstrap-fileinput-master/js/locales/zh.js"></script>
        <script type="text/javascript" src="/static/layer/layer.js"></script>
        <script src="/static/toast/js/jquery.toast.min.js"></script>
        <script src="/static/dist/js/app.js"></script>
        <script src="/static/hz2py/jQuery.Hz2Py-min.js"></script>
        <style type="text/css" rel="stylesheet">
        .btn-header{
            margin-left: 4px;
            padding: 3px 6px;
            position: relative;
            top: -4px;
            border: 1px solid #ccc;
            border-radius: 2px;
            background: #fff;
            text-shadow: none;
            font-weight: 600;
            font-size: 12px;
            line-height: normal;
            color: #3c8dbc;
            cursor: pointer;
            transition: all .2s ease-in-out
        }

        .btn-header:hover {
            background: #3c8dbc;
            color: #fff
        }
    </style>
</#macro>
<#macro footer>
    <script>
        $(document).ready(function(){
            var pathName = location.pathname;
            if(pathName=="/admin/posts/edit"){
                pathName="/admin/posts/new";
            }
            if(pathName=="/admin/category/edit"){
                pathName="/admin/category";
            }
            if(pathName=="/admin/tag/edit"){
                pathName="/admin/tag";
            }
            if(pathName=="/admin/page/edit"){
                pathName="/admin/page/new";
            }
            if(pathName=="/admin/page/links"){
                pathName="/admin/page";
            }
            if(pathName=="/admin/page/galleries"){
                pathName="/admin/page";
            }
            if(pathName=="/admin/menus/edit"){
                pathName="/admin/menus";
            }
            $(".sidebar-menu").children().each(function () {
                var li = $(this);
                li.find('a').each(function () {
                    var href = $(this).attr("href");
                    if (pathName == href) {
                        li.addClass("active");
                        $(this).parent().addClass("active");
                    }else{
                        $(this).parent().removeClass("active");
                    }
                });
            });


            $.get("/admin/comment/read",
                function(data){
                    if(data>0){
                        $("#new_comment_num").append("<span id='num' class=\"label label-success\">"+data+"</span>");
                    }

                });
            // 初始化内容
        });
        $("#new_comment_num").click(function () {
            $("#num").remove();
        });

    </script>
    </body>
    </html>
</#macro>