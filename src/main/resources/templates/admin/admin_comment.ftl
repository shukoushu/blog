<#include "module/macro.ftl">
<@head title="评论"></@head>
<div class="wrapper">
    <#include "module/header.ftl">
    <#include "module/sidebar.ftl">
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                评论
                <small>Optional description</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">Here</li>
            </ol>
        </section>

        <section class="content container-fluid">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box box-primary">
                        <div class="box-body table-responsive">
                            <table class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>评论者</th>
                                    <th width="50%">评论内容</th>
                                    <th>评论文章</th>
                                    <th>评论时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <#if comments.content?size gt 0>
                                    <#list comments.content as comment>
                                        <tr>
                                            <td>${comment.commentAuthor}</td>
                                            <td>${comment.commentContent}</td>
                                            <td>
                                                <#if comment.post??>
                                                    <a target="_blank" href="/archives/${comment.post.postUrl}">${comment.post.postTitle}</a>
                                                <#else >
                                                    <a target="_blank" href="/p/${comment.post.postUrl}">${comment.post.postTitle}</a>
                                                </#if>
                                            </td>
                                            <td>${comment.commentDate?if_exists?string("yyyy-MM-dd HH:mm")}</td>
                                            <td>
                                                <button class="btn btn-primary btn-xs " onclick="replyShow('${comment.commentId?c}','${comment.post.postId?c}')" <#if comment.isAdmin==1>disabled</#if>>回复</button>
                                                <button class="btn btn-danger btn-xs "
                                                        onclick="modelShow('/admin/comment/remove/${comment.commentId}','确定永久删除？(不可逆)')">
                                                    永久删除
                                                </button>
                                            </td>
                                        </tr>
                                    </#list>
                                <#else>
                                    <tr>
                                        <th colspan="6" style="text-align: center">暂无评论</th>
                                    </tr>
                                </#if>
                                </tbody>
                            </table>
                        </div>
                        <div class="box-footer clearfix">
                            <div class="no-margin pull-left">
                                第${comments.number+1}/${comments.totalPages}页
                            </div>
                            <ul class="pagination no-margin pull-right">
                                <li><a data-pjax="true" class="btn btn-sm <#if !comments.hasPrevious()>disabled</#if>"
                                       href="/admin/comment">首页</a></li>
                                <li><a data-pjax="true" class="btn btn-sm <#if !comments.hasPrevious()>disabled</#if>"
                                       href="/admin/comment?page=${comments.number-1}">上页</a></li>
                                <li><a data-pjax="true" class="btn btn-sm <#if !comments.hasNext()>disabled</#if>"
                                       href="/admin/comment?page=${comments.number+1}">下页</a></li>
                                <li><a data-pjax="true" class="btn btn-sm <#if !comments.hasNext()>disabled</#if>"
                                       href="/admin/comment?page=${comments.totalPages-1}">尾页</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

        </section>
        <div class="modal fade" id="removePostModal">
            <div class="modal-dialog">
                <div class="modal-content message_align">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">×</span></button>
                        <h4 class="modal-title">提示信息</h4>
                    </div>
                    <div class="modal-body">
                        <p id="message"></p>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" id="url"/>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <a  class="btn btn-danger" data-dismiss="modal" onclick="removeIt()">确定</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="commentReplyModal">
            <div class="modal-dialog">
                <div class="modal-content message_align">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                        <h4 class="modal-title">回复</h4>
                    </div>
                    <form>
                        <div class="modal-body">
                            <textarea class="form-control" rows="5" id="commentContent" name="commentContent" style="resize: none"></textarea>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" id="commentId" name="commentId" value=""/>
                            <input type="hidden" id="userAgent" name="userAgent" value=""/>
                            <input type="hidden" id="postId" name="postId" value="" />
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button type="submit" class="btn btn-primary" onclick="reply()">确定</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function modelShow(url, message) {
        $('#url').val(url);
        $('#message').html(message);
        $('#removePostModal').modal();
    }
    function replyShow(commentId,postId) {
        $('#userAgent').val(navigator.userAgent);
        $('#commentId').val(commentId);
        $('#postId').val(postId);
        $('#commentReplyModal').modal();
    }
    function reply() {
        $.ajax({
            type: 'POST',
            url: '/admin/comment/reply',
            async: false,
            data: {
                'commentId': $("#commentId").val(),
                'userAgent': $("#userAgent").val(),
                'postId': $("#postId").val(),
                'commentContent': $("#commentContent").val()
            },
            success: function (data) {
                if(data==true){
                    window.location.reload();
                }
            }
        });
    }

    function removeIt() {
        var url = $.trim($("#url").val());
        $.ajax({
            url: url,
            type: "POST",
            data: {_method: "DELETE"},
            dataType: "text",
            success: function () {
                    window.location.reload();
            }
        });
    }
    $("#outLogin").click(function () {
        console.log("test");
        $.post("/admin/loginOut",
            function () {
                window.location.href = "/admin/login";
            }
        );
    });
</script>
<@footer></@footer>