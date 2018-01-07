<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Добавление нового товара в магазин</title>
<#include "parts/part_links.ftl">

</head>

<body>
<div class="container">

<#include "parts/part_head.ftl">
<#include "parts/part_nav.ftl">

<#if validationErrors??>
    <#list validationErrors as validationError>
        <p style="color: #b21f2d">${validationError}</p>
    </#list>
</#if>

    <form name='addProduct' action='/addproduct' method='POST'>
        <table>
            <tr><td>Название :</td><td><input type='text' name='prodName' value=''></td></tr>
            <tr><td>Описание :</td><td><input type='text' name='prodDesc' value='' style="width: 400px"></td></tr>
            <tr><td>Цена :</td><td><input type='text' name='prodCost' value=''></td></tr>
            <tr>
                <td colspan='2'><input name="submit" type="submit" value="Добавить товар"/></td>
            </tr>
        </table>
    </form>

</div>
</html>