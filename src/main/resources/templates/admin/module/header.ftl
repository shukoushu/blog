<header class="main-header">
    <a href="index2.html" class="logo">
        <span class="logo-mini"><b>A</b>LT</span>
        <span class="logo-lg"><b>Admin</b>LTE</span>
    </a>

    <nav class="navbar navbar-static" role="navigation">
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
            <span class="sr-only">Toggle navigation</span>
        </a>
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <li class="dropdown messages-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="new_comment_num">
                        <i class="fa fa-envelope-o"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <ul class="menu" id="new_comment">
                                <#if newComments?size gt 0>
                                    <#list newComments?sort_by("commentDate")?reverse as comment>
                                        <li>
                                            <a href="/admin/comment">
                                                <div class="pull-left">
                                                    <img src="//gravatar.loli.net/avatar/${comment.commentAuthorAvatar?default("hash")}?s=256&d=${options.native_comment_avatar?default("mm")}" class="img-circle" alt="User Image">
                                                </div>
                                                <h4>
                                                    ${comment.commentAuthor}
                                                    <small>${comment.commentDate}</small>
                                                </h4>
                                                <object>${comment.commentContent}</object>
                                            </a>
                                        </li>
                                    </#list>
                                    <li><!-- start message -->
                                        <a>
                                            <p style="text-align:center;padding:20px 10px;margin-left: 0px;">
                                                --暂无新评论--</p>
                                        </a>
                                    </li>
                                <#else >
                                    <li><!-- start message -->
                                        <a>
                                            <p style="text-align:center;padding:20px 10px;margin-left: 0px;">
                                                --暂无新评论--</p>
                                        </a>
                                    </li>
                                </#if>
                            </ul>
                        </li>
                        <li class="footer"><a href="/admin/comment">查看所有评论</a></li>
                    </ul>
                </li>
                <li class="dropdown user user-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <img src="<#if user.userAvatar?if_exists!="">${user.userAvatar}<#else>/static/dist/img/user2-160x160.jpg</#if>"
                             class="user-image" alt="User Image">
                        <span class="hidden-xs">${user.userDisplayName}</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="user-header">
                            <img src="<#if user.userAvatar?if_exists!="">${user.userAvatar}<#else>/static/dist/img/user2-160x160.jpg</#if>"
                                 class="img-circle" alt="User Image">
                            <p>
                                Alexander Pierce - Web Developer
                                <small>Member since Nov. 2012</small>
                            </p>
                        </li>
                        <li class="user-footer">
                            <div class="pull-left">
                                <a href="/admin/profile" class="btn btn-default btn-flat">个人资料</a>
                            </div>
                            <div class="pull-right">
                                <a href="/admin/loginOut" class="btn btn-default btn-flat" id="outLogin">退出登录</a>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</header>