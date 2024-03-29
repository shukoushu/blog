<#--主页的用户信息ok-->
<section id="profile" class="mt-4 bg-white d-xl-block d-none">
    <div class="card">
        <div class="card-header"><i class="fas fa-user mr-2"></i>个人信息</div>
        <div class="card-body d-flex flex-column align-items-center">
            <#--头像和个人信息-->
            <div class="mt-4 mb-4point5 w-100 d-flex justify-content-center">
                <#--头像部分-->
                <div class="w-50 text-right mr-3">
                    <i style="display: inline-block;
                            width: 6.5rem; height: 6.5rem;
                            background-image: url('${user.userAvatar!}');
                            background-size: cover;"
                       class="rounded-circle"></i>
                </div>
                <#--个人信息部分-->
                <div class="w-50 text-left ml-3 d-flex flex-column justify-content-center">
                    <span class="h4 d-block">${user.userDisplayName!}</span>
                    <#if (options.user_location)?? && options.user_location?trim != ''>
                        <span class="text-muted text-truncate">
                            <i class="fas fa-map-marker-alt mr-1"></i>
                            ${options.user_location!}
                        </span>
                    </#if>
                </div>
            </div>

            <#if (options.style_hitokoto)?? && options.style_hitokoto == 'true'>
            <div class="mt-4 mb-4point5 w-100 d-flex justify-content-center">
                <#--hitokoto-yiyan-->
                <p id="hitokoto">获取中...</p>
            </div>
            </#if>

            <#if user.userDesc !="">
            <div class="mt-4 mb-4point5 w-100 d-flex justify-content-center">
                <p id="user_desc">${user.userDesc}</p>
            </div>
            </#if>
            <#--分割线-->
            <div class="w-100 border-top"></div>

            <#--数量统计部分-->
            <div class="mt-4 mb-3 w-100 d-flex justify-content-around">
                <div class="w-100 text-center">
                    <small class="text-muted">文章数量</small>
                    <span class="d-block h2 mt-2">
                        <#--<@postTag method="count">-->
                            <#--${count!}-->
                        <#--</@postTag>-->1
                    </span>
                </div>
                <div class="w-100 text-center">
                    <small class="text-muted">分类数量</small>
                    <span class="d-block h2 mt-2">
                        <#--<@categoryTag method="count">-->
                            <#--${count!}-->
                        <#--</@categoryTag>-->1
                    </span>
                </div>
                <div class="w-100 text-center">
                    <small class="text-muted">标签数量</small>
                    <span class="d-block h2 mt-2">
                        <#--<@tagTag method="count">-->
                            <#--${count!}-->
                        <#--</@tagTag>-->1
                    </span>
                </div>
            </div>
        </div>
    </div>
</section>