<table class="table table-bordered table-row-cell table-hover" >

    <thead>
    <th colspan="5"> Товары в корзине # ${cart.getId()} </th>
    </thead>

    <tbody>
    <#assign totalCost =0>
    <#list cart.getItems() as item>

    <tr >

        <td onclick="window.location.href='/singleproduct?prodId=${item.getProduct().getId()}'; return false"> ${item.getProduct().getName()} </td>
        <td> ${item.getProduct().getCost()} </td>
        <td>  ${item.getCount()}</td>
        <td> ${item.getCount()*item.getProduct().getCost()}</td>
        <#assign totalCost = totalCost+item.getCount()*item.getProduct().getCost()>

        <td>
            <div class = btn-group >
                <button class="btn btn-dark" onclick="changeProdCnt(1,${item.getProduct().getId()},1,insertUpdatedCartTable,alertError)"> +1 </button>
                <button class="btn btn-dark" onclick="changeProdCnt(1,${item.getProduct().getId()},-1,insertUpdatedCartTable,alertError)"> -1 </button>
                <button class="btn btn-dark" onclick="changeProdCnt(2,${item.getProduct().getId()},0,insertUpdatedCartTable,alertError)"> -All </button>
            </div>
        </td>
    </tr>
    </#list>
    <tr>
        <td colspan="3"> Общая стоимость товаров в корзине</td>
        <td colspan="2"> ${totalCost} </td>
    </tr>
    </tbody>
</table>