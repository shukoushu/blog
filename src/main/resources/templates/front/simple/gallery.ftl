<!DOCTYPE HTML>
<html>
<head>
    <title>图库</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="source/plugins/gallery/css/main.css" />
    <noscript><link rel="stylesheet" href="source/plugins/gallery/css/noscript.css" /></noscript>
</head>
<body class="is-loading-0 is-loading-1 is-loading-2">
<div id="main">
    <header id="header">
        <h1>图库</h1>
        <p>${user.userDesc?if_exists}</p>
        <ul class="icons">
            <!--
            <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
            <li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
            <li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
            <li><a href="#" class="icon fa-envelope-o"><span class="label">Email</span></a></li>
            -->
        </ul>
    </header>
    <section id="thumbnails">
        <#if galleries?size gt 0>
        <#list galleries as gallery>
            <article>
                <a class="thumbnail" href="${gallery.galleryUrl}" data-position="left center"><img src="${gallery.galleryUrl}" alt="${gallery.galleryDesc}" /></a>
                <h2>${gallery.galleryName}</h2>
                <p>${gallery.galleryDesc?if_exists}</p>
                <p>${gallery.galleryDate?if_exists}</p>
            </article>
        </#list>
        </#if>
    </section>
    <footer id="footer">
        <ul class="copyright">
            <li>&copy; </li><li>Design: <a href="http://html5up.net">HTML5 UP</a>.</li>
        </ul>
    </footer>
</div>
<script src="source/plugins/gallery/js/jquery.min.js"></script>
<script src="source/plugins/gallery/js/skel.min.js"></script>
<script src="source/plugins/gallery/js/main.js"></script>
</body>
</html>