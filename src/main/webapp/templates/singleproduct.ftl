<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Страница с подробным описанием товара</title>
    <#include "parts/part_links.ftl">
</head>
<body>
<div class="container">
    <#include "parts/part_head.ftl">
    <#include "parts/part_nav.ftl">
    <#if !product??>
        <div class="row">
            Товар не найден
        </div>
    <#else>
        <div class="row">

            <div class="col-sm-1"> ${product.getName()} </div>
            <div class="col-sm-1"> ${product.getCost()?string.currency} </div>
            <div class="col-sm-6"> ${product.getDesc()} </div>
            <div class="col-sm-4">
                <#if !product.getImgPath()??>
                    <img src="/img/sad.jpg">
                <#else>
                    <img src="${product.getImgPath()}">
                </#if>
            </div>
        </div>
    </#if>

    <div class="row">
        <a class="btn btn-dark" href="/pagedproducts?page=0&size=5" role="button"> к списку товаров </a>
    </div>
</div>
</body>
</html>