<#--导航栏ok-->
<section id="navBar" class="border-bottom bg-white">
    <nav class="navbar navbar-expand-lg navbar-light container px-lg-2 py-3">

        <a class="navbar-brand font-weight-bold" href="${context!}">
            <#if (options.blog_logo)?? && options.blog_logo?trim != ''>
                <img src="${options.blog_logo!}" width="30" height="30"
                     class="d-inline-block align-top mr-2" alt="${options.blog_title!}">
            </#if>
            ${options.blog_title!}
        </a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse pl-1" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <#-- ?sort_by('priority')：根据菜单的排序编号排序 -->
                <@commonTag method="menus">
                    <#list menus?sort_by('menuSort') as menu>
                        <li class="nav-item">
                            <a class="nav-link" href="${menu.menuUrl!}" target="${menu.target!}">
                                <#if (menu.icon)?? && menu.icon?trim != ''>
                                    <span class="d-lg-none d-inline mr-2">${menu.icon}</span>
                                <#else>
                                    <span class="d-lg-none d-inline mr-2"><i class="fas fa-link"></i></span>
                                </#if>
                                ${menu.menuName!}
                            </a>
                        </li>
                    </#list>
                </@commonTag>
            </ul>
            <form id="search" class="form-inline my-2 my-lg-0" method="get" action="/search">
                <input class="form-control mr-sm-2" name="keyword" type="search" value="${keyword!}"
                       placeholder="请输入关键字" aria-label="请输入关键字" required autocomplete="off"
                       data-toggle="tooltip" data-placement="bottom" title="输入查询关键字">
                <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">查询</button>
            </form>
        </div>
    </nav>
</section>

