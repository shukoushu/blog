<#--存档界面左边ok-->
<#include "archive_item.ftl">
<div class="pr-lg-5 mt-lg-2 mt-3">
    <@commonTag method="archive">
        <#list archives as archive>
            <@archiveItem archive=archive/>
        </#list>
    </@commonTag>
</div>