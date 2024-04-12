$(".supported-methods").change(function () {
    var option = $(".supported-methods").val();

    if (option == 1)
        $(".hdnPaymentMethod").text("Cash");
    else if (option == 2)
        $(".hdnPaymentMethod").text("Visa Card");
    else
        $(".hdhPaymentMethod").text("Master Card");
});