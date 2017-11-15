<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Таблица товаров</title>
    <#include "parts/part_links.ftl">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
</head>
<body>
<div class="container">

    <!--  Шапка -->
    <#include "parts/part_head.ftl">
    <#include "parts/part_nav.ftl">

    <!--  Таблица товров -->
    <div class="row">
        <table class="table table-bordered table-row-cell table-hover" >

            <thead>
                <th colspan="4"> Товары в наличии </th>
            </thead>

            <tbody>
            <#list products.iterator() as product>
                <tr >
                    <td onclick="window.location.href='/singleproduct?prodId=${product.getId()}'; return false"> ${product.getName()} </td>
                    <td> ${product.getCost()} </td>
                    <td>
                        <#if !product.getImgPath()??>
                            <img src="/img/sad.jpg">
                        <#else>
                            <img src="${product.getImgPath()}">
                        </#if>
                    </td>
                    <td> <button class="btn btn-dark"  onclick="addCurrentProductToCart(${product.getId()})"> Добавить в корзину </button> </td>
                </tr>
            </#list>
            </tbody>
        </table>
    </div>

        <!--  Перемещение по страницам -->
    <div class="row">
        <div class="col-sm-12" id="footer">
            <#if pageable.hasPrevious() >
                <a class="btn btn-dark" href="/pagedproducts?page=${pageable.getPageNumber()-1}&size=5"> < </a>
            </#if>
            ${pageable.getPageNumber()+1}/${ (productsNumber/pageable.getPageSize())?int+1}
            <#if productsNumber gt pageable.getPageSize()+pageable.getOffset() >
                <a class="btn btn-dark" href="/pagedproducts?page=${pageable.getPageNumber()+1}&size=5"> > </a>
            </#if>
        </div>
    </div>

    <script type="text/javascript">
        function addCurrentProductToCart(prod_id){

            alert("Добавление товара в корзину")
            $.ajax({
                type: "POST",
                url: "cart",
                data: JSON.stringify({ command: 1, prodId: prod_id, count: 1 }),
                contentType: 'application/json',
                success: null
            });
        }
    </script>

</div>



</body>
</html>