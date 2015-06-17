$(document).ready(function () {

    function getText() {
        $.ajax({
            url: 'TextFile.txt',
            type: 'GET',
            dataType: 'text',
            success: onSuccess,
            error:onError
            }
        );
    }

    function showError() {
        $.ajax({
            url: 'TextFile1.txt',
            type: 'GET',
            dataType: 'text',
            success: onError,
            error: onError
        }
        );
    }
    function onSuccess(result) {
        $('#txtdata').empty();
        $('#txtdata').append(result);
    }

    function onError(xhr, status, strErr) {
        $('#errorMsg').empty();
        $('#errorMsg').append(strErr);
    }

    $('#disp').click(function () {
        getText();
    });
    $('#errdisp').click(function () {
        showError();
    });

});