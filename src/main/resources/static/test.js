function showAlert(){

    alert("This is alert popup example");
    $.ajax({
        type: "POST",
        url: "cart",
        data: JSON.stringify({ command: 1, prodId: 1, count: 1 }),
        contentType: 'application/json',
        success: null
    });
    alert("Data sent");

}