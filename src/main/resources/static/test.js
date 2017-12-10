

function changeProdCnt(cmd,prod_id,prod_cnt){


    $.ajax({
        type: "PUT",
        url: "cart",
        data: JSON.stringify({ command: cmd, prodId: prod_id, count: prod_cnt }),
        dataType: 'text',
        contentType: 'application/json',
        timeout: 1000,
        success: some,
        error: some

    });


}

function some(data)
{

    console.log(data)
    document.getElementById('cartItems').innerHTML=data
}