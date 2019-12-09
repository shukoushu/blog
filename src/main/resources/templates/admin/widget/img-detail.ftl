<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="/static/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/toast/css/jquery.toast.min.css">
    <link rel="stylesheet" href="/static/dist/css/AdminLTE.min.css">
    <style>
        .attachDesc,.attachImg{padding-top:15px;padding-bottom:15px}
        .form-horizontal .control-label{text-align:left}
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-6 attachImg">
            <img src="${img.imgPath?if_exists}" style="width: 100%;">
        </div>
        <div class="col-lg-6 attachDesc">
            <div class="box box-solid">
                <div class="box-header with-border">
                    <h3 class="box-title">详细信息</h3>
                </div>
                <form class="form-horizontal">
                    <div class="box-body">
                        <div class="form-group">
                            <label for="attachName" class="col-sm-2 control-label">图片名：</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="attachName" value="${img.imgName?if_exists}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="attachType" class="col-sm-2 control-label">图片类型：</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="attachType" value="${img.imgSuffix?if_exists}" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="attachPath" class="col-sm-2 control-label">图片路径：</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="attachPath" value="${img.imgPath?if_exists}" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="attachCreated" class="col-sm-2 control-label">上传时间：</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="attachCreated" value="${img.attachCreated?if_exists}" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="attachStorage" class="col-sm-2 control-label">图片大小：</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="attachStorage" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="attachSize" class="col-sm-2 control-label">图片尺寸：</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="attachSize" disabled>
                            </div>
                        </div>
                    </div>
                    <div class="box-footer">
                        <button type="button" class="btn btn-danger btn-sm pull-left" onclick="btn_delete()">永久删除</button>
                        <button type="button" class="btn btn-info btn-sm pull-right btn-copy" data-clipboard-text="${img.imgPath}">复制链接</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<script src="/static/jquery/jquery.min.js"></script>
<script src="/static/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="/static/toast/js/jquery.toast.min.js"></script>
<script src="/static/clipboard/clipboard.min.js"></script>
<script src="/static/dist/js/adminlte.min.js"></script>
<script src="/static/layer/layer.js"></script>
<script src="/static/dist/js/app.js"></script>
<script>
    function btn_delete() {
        layer.msg('你确定要删除？', {
            time: 0
            ,btn: ['删除', '取消']
            ,yes: function(index){
                layer.close(index);
                $.ajax({
                    type: 'GET',
                    url: '/admin/img/remove',
                    async: false,
                    data:{
                        attachId : ${img.imgId}
                    },
                    success: function (data) {
                        if(data==true){
                            $.toast({
                                text: "删除成功！",
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
                                    parent.location.reload();
                                }
                            });
                        }else{
                            showMsg("删除失败","error",2000);
                        }
                    }
                });
            }
        });
    }
    $(document).ready(function(){
        var clipboard = new Clipboard('.btn-copy');
        var img = document.getElementsByTagName("img")[0];
        //获取文件的大小和尺寸
        var width = img.naturalWidth;
        var height = img.naturalHeight;
        var image = new Image();
        image.src = img.src;
        $('#attachSize').val(width+'x'+height);
        $('#attachStorage').val('256k');
    });
    $('.btn-copy').click(function () {
        showMsg("复制成功","success",1000);
    })
</script>
</html>