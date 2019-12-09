<#--页脚ok-->
<footer class="py-4 border-top bg-white">
    <div class="container d-flex flex-md-row flex-column justify-content-between align-items-center px-lg-2">
        <div>
            <span class="text-muted">${options.blog_footer_info!}</span>

        </div>
        <div class="link-info mt-md-0 mt-4">
            <#--RSS-->
            <#if (options.open_rss)?? && options.open_rss?c == 'true'>
                <a class="text-dark mr-3" target="_blank" href="${context!}/feed.xml">
                    <i class="fas fa-rss"></i>
                </a>
            </#if>
            <#--Github-->
            <#if (options.github_url)?? && options.github_url?trim != ''>
                <a class="text-dark mr-3" target="_blank"
                   href="${options.github_url!}">
                    <i class="fab fa-github"></i>
                </a>
            </#if>
            <#--QQ账号-->
            <#if (options.qq_number)?? && options.qq_number?trim != ''>
                <a class="text-dark mr-3" target="_blank"
                   href="http://wpa.qq.com/msgrd?v=3&uin=${options.qq_number!}&site=qq&menu=yes">
                    <i class="fab fa-qq"></i>
                </a>
            </#if>
            <#--新浪微博-->
            <#if (options.weibo_url)?? && options.weibo_url?trim != ''>
                <a class="text-dark mr-3" target="_blank"
                   href="${options.weibo_url!}">
                    <i class="fab fa-weibo"></i>
                </a>
            </#if>
            <#--推特账号-->
            <#if (options.twitter_account)?? && options.twitter_account?trim != ''>
                <a class="text-dark mr-3" target="_blank"
                   href="https://twitter.com/${options.twitter_account!}">
                    <i class="fab fa-twitter"></i>
                </a>
            </#if>
            <#--邮箱地址-->
            <#if (options.email_address)?? && options.email_address?trim != ''>
                <a class="text-dark" href="mailto:${options.email_address!}">
                    <i class="fas fa-envelope"></i>
                </a>
            </#if>
        </div>
    </div>
</footer>