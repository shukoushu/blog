<#--文章界面标签部分ok-->
<@commonTag method="tag">
    <#if (post.postTag)?? && post.postTag?size != 0>
        <section id="tags" class="mb-lg-4 mb-5">
            <div class="card">
                <div class="card-header">
                    <i class="fas fa-tags mr-2"></i>相关标签
                </div>
                <div class="card-body">
                    <#list post.postTag as tag>
                        <div class="tag">
                            <a href="/tags/${tag.tagUrl!}" class="text-muted">
                                <span class="tag-item">
                                    <i class="fas fa-tags mr-1"></i>${tag.tagName!}
                                </span>
                            </a>
                        </div>
                    </#list>
                </div>
            </div>
        </section>
    </#if>
</@commonTag>