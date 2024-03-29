<#--一个存档列表项ok-->
<#macro tagItem tag>
<#--对话框-->
    <div class="title-list-item">
        <div class="d-flex mb-3">
            <i class="user-avatar rounded-circle"
               style="display: block;
                       width: 2.5rem; height: 2.5rem;
                       background-image: url('${user.avatar!}');
                       background-size: cover;"></i>
            <div class="dialogue-box rounded">
                <h3 id="${tag.tagName}" class="section-title">
                    <span>${tag.tagName}</span>
                </h3>
            </div>
        </div>
        <#--列表项-->
        <ul class="title-list">

                <#list tag.posts?sort_by("postDate") as post>
                    <li class="d-flex flex-sm-row flex-column justify-content-between pr-3">
                        <a href="${context!}/archives/${post.postUrl!}">${post.postTitle!}</a>
                        <small class="text-muted">${post.postDate?string["yyyy年MM月dd日"]!}</small>
                    </li>
                </#list>


        </ul>
    </div>
</#macro>