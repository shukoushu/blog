<aside class="main-sidebar">
    <section class="sidebar">
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<#if user.userAvatar?if_exists!="">${user.userAvatar}<#else>/static/dist/img/user2-160x160.jpg</#if>" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>${user.userDisplayName}</p>
                <!-- Status -->
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <!-- Sidebar Menu -->
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">HEADER</li>
            <li class="">
                <a href="/admin">
                    <i class="fa fa-link"></i>
                    <span>仪表盘</span>
                </a>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-book"></i>
                    <span>文章</span>
                    <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                </a>
                <ul class="treeview-menu" style="">
                    <li><a href="/admin/posts">所有文章</a></li>
                    <li><a href="/admin/posts/write">写文章</a></li>
                    <li><a href="/admin/tag">标签</a></li>
                </ul>
            </li>
            <li>
                <a href="/admin/img">
                    <i class="fa fa-picture-o"></i>
                    <span>图库</span></a>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-desktop"></i>
                    <span>页面</span>
                    <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/admin/page">所有页面</a></li>
                    <li><a href="/admin/page/edit">新建页面</a></li>
                </ul>
            </li>
            <li>
                <a href="/admin/comment">
                    <i class="fa fa-commenting-o"></i>
                    <span>评论</span></a>
            </li>
            <li class="treeview">
                <a data-pjax="true" href="#">
                    <i class="fa fa-user-o"></i>
                    <span>用户</span>
                    <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                </a>
                <ul class="treeview-menu">
                    <li><a data-pjax="true" href="/admin/profile"><i class="fa fa-circle-o"></i>个人资料</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-desktop"></i>
                    <span>前台样式</span>
                    <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/admin/menu">菜单</a></li>
                    <li><a href="/admin/front">社交资料&样式</a></li>
                    <li><a href="/admin/front/editor">前台模板编辑</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-desktop"></i>
                    <span>设置</span>
                    <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/admin/options">一般设置</a></li>
                    <#--<li><a href="">数据库备份</a></li>-->
                </ul>
            </li>
        </ul>
    </section>
</aside>