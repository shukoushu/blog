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
            <img src="${gallery.galleryUrl?if_exists}" style="width: 100%;">
        </div>
        <div class="col-lg-6 attachDesc">
            <div class="box box-solid">
                <div class="box-header with-border">
                    <h3 class="box-title">详细信息</h3>
                </div>
                <form action="/admin/page/gallery/save" method="post" class="form-horizontal" id="galleryForm">
                    <input type="hidden" value="${gallery.galleryId?c}" name="galleryId">
                    <input type="hidden" value="${gallery.galleryUrl}" name="galleryUrl">
                    <div class="box-body">
                        <div class="form-group">
                            <label for="attachName" class="col-sm-2 control-label">图片名：</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="galleryName" name="galleryName"value="${gallery.galleryName?if_exists}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="galleryDesc" class="col-sm-2 control-label">图片描述：</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="galleryDesc" name="galleryDesc" value="${gallery.galleryDesc?if_exists}" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="attachPath" class="col-sm-2 control-label">图片路径：</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="galleryUrl" value="${gallery.galleryUrl?if_exists}" disabled>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="attachCreated" class="col-sm-2 control-label">上传时间：</label>
                            <div class="col-sm-10">
                                <input type="date" class="form-control" id="galleryDate"  name="galleryDate" value="${gallery.galleryDate?if_exists}">
                            </div>
                        </div>
                    </div>
                    <div class="box-footer">
                        <button type="button" class="btn btn-danger btn-sm pull-left" onclick="btn_delete()">永久删除</button>
                        <button type="button" class="btn btn-info btn-sm pull-right btn-copy" onclick="btn_save()">修改</button>
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
                    url: '/admin/page/gallery/remove',
                    async: false,
                    data:{
                        attachId : ${gallery.galleryId}
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
    function btn_save() {
        $('#galleryForm').submit();
        parent.location.reload();
    }
</script>
</html>