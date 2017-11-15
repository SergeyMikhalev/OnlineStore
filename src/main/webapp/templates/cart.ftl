<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Содержимое корзины</title>
<#include "parts/part_links.ftl">
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>


</head>
<body>
<div class="container">

    <!--  Шапка -->
<#include "parts/part_head.ftl">
<#include "parts/part_nav.ftl">

    <!--  Корзина -->
    <div class="row">
        <table class="table table-bordered table-row-cell table-hover" >

            <thead>
            <th colspan="3"> Товары в корзине # ${cart.getId()} </th>
            </thead>

            <tbody>
            <#list cart.getItems() as item>
            <tr >

                <td onclick="window.location.href='/singleproduct?prodId=${item.getProduct().getId()}'; return false"> ${item.getProduct().getName()} </td>
                <td> ${item.getProduct().getCost()} </td>
                <td>  ${item.getCount()}</td>

                <td>
                    <div class = btn-group >
                        <button class="btn btn-dark" onclick="changeProdCnt(1,${item.getProduct().getId()},1)"> +1 </button>
                        <button class="btn btn-dark" onclick="changeProdCnt(1,${item.getProduct().getId()},-1)"> -1 </button>
                        <button class="btn btn-dark" onclick="changeProdCnt(2,${item.getProduct().getId()},0)"> -All </button>
                    </div>
                </td>
            </tr>
            </#list>
            </tbody>
        </table>
    </div>

    <button class="btn btn-dark" id="button1" onclick="changeProdCnt(3,0,0)">  Очистить корзину </button>
    <script type="text/javascript">
        function changeProdCnt(cmd,prod_id,prod_cnt){


            $.ajax({
                type: "POST",
                url: "cart",
                data: JSON.stringify({ command: cmd, prodId: prod_id, count: prod_cnt }),
                contentType: 'application/json',
                success: null
            });
            alert("Done");

        }
    </script>

</div>
</body>
</html>