

function changeProdCnt(cmd,prod_id,prod_cnt, success_func, error_func){


    $.ajax({
        type: "PUT",
        url: "cart",
        data: JSON.stringify({ command: cmd, prodId: prod_id, count: prod_cnt }),
        dataType: 'html', //'text',
        contentType: 'application/json',
        timeout: 1000,
        success: success_func,
        error: error_func

    });


}

function insertUpdatedCartTable(data)
{

    document.getElementById('cartItems').innerHTML=data

}

function alertProductAdded(data)
{
    alert('Товар добавлен в корзину')
    console.log(data)
}

function alertError(data)
{
    alert('Не удалось выполнить операцию')
    console.log(data)
}