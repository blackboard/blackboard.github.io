---
layout: post
title: "UEF Documentation"
purple-text-title: "UEF Documentation"
categories: Learn UEF
id: rest_apis-learn-uef-documentation
---

# UEF Documentation

<style>
    .table {width: 100%; height: 100vh; margin: 0; padding: 0}
    .row-container {display: flex; width: 100%; height: 100%; flex-direction: column; overflow: hidden;}
    .row { flex-grow: 1; border: none; margin: 0; padding: 0; }
</style>

<iframe id="uef-docs" src="/rest-apis/learn/uef/UEFDocs/build/docs/index.html" class="row" onload="setIframeHeight(this.id)"></iframe>

<script>
    function getDocHeight(doc) {
        doc = doc || document;
        // stackoverflow.com/questions/1145850/
        var body = doc.body, html = doc.documentElement;
        var height = Math.max( body.scrollHeight, body.offsetHeight, 
            html.clientHeight, html.scrollHeight, html.offsetHeight );
        return height;
    }

    function setIframeHeight(id) {
        var ifrm = document.getElementById(id);
        var doc = ifrm.contentDocument? ifrm.contentDocument: 
            ifrm.contentWindow.document;
        ifrm.style.visibility = 'hidden';
        ifrm.style.height = "10px"; // reset to minimal height ...
        // IE opt. for bing/msn needs a bit added or scrollbar appears
        ifrm.style.height = getDocHeight( doc ) + 4 + "px";
        ifrm.style.visibility = 'visible';
    }
</script>
