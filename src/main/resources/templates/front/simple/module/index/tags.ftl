<#--主页的标签部分ok-->
<@commonTag method="tags">
    <#if tags?? && tags?size gt 0>
        <section id="tags" class="mt-4 mb-5 bg-white">
            <div class="card">
                <div class="card-header">
                    <i class="fas fa-tags mr-2"></i>
                    所有标签
                </div>
                <div class="card-body">
                    <#list tags as tag>
                        <div class="tag">
                            <a href="/tags/${tag.tagUrl!}" class="text-muted">
                                <span class="tag-left">${tag.tagName!}</span>
                                <span class="tag-right">${tag.posts?size}</span>
                            </a>
                        </div>
                    </#list>
                    <div class="tag">
                        <a href="/tags" class="text-muted">
                            <span class="tag-left">所有标签</span>
                            <span class="tag-right">
                                ${tags?size}
                            <#--<@postTag method="count">-->
                                <#--${count!}-->
                            <#--</@postTag>-->
                        </span>
                        </a>
                    </div>
                </div>
            </div>
        </section>
    </#if>
</@commonTag>