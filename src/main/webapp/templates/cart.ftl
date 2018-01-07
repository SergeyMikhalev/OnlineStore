<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Содержимое корзины</title>
<#include "parts/part_links.ftl">
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>

    <script src="test.js"></script>

</head>
<body>
<div class="container">

    <!--  Шапка -->
<#include "parts/part_head.ftl">
<#include "parts/part_nav.ftl">

<#if prePurchased>
    <#include "parts/delivery_addr_input.ftl">
</#if>

    <!--  Корзина -->
    <div class="row" id = "cartItems">
        <#include "parts/cart_items_table.ftl">
    </div>

    <#if !prePurchased>
    <a class="btn btn-dark" href="/cart?prePurchased=true"> Заказать </a>
    </#if>

    <button class="btn btn-dark" id="button1" onclick="changeProdCnt(3,0,0)">  Очистить корзину </button>
    <script type="text/javascript">

    </script>

</div>
</body>
</html>