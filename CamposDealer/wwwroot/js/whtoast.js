function showToastDanger(message, reload){

    $.toast({
        heading: "Erro",
        text: message,
        position: 'bottom-right',
        icon: 'error',
        loader: true,        // Change it to false to disable loader
        loaderBg: '#f1f4f7',  // To change the background
        bgColor: '#f9243f',
        hideAfter: false,
        showHideTransition: 'slide',
        afterHidden: function () {
            if(reload==true){
                location.reload();
            }
        }
    })
    
}

function showToastSuccess(message, reload){

        $.toast({
            heading: 'Ok',
            text: message,
            position: 'bottom-right',
            icon: 'success',
            loader: true,        // Change it to false to disable loader
            loaderBg: '#f1f4f7',
            bgColor: '#5cb85c',  // To change the background
            showHideTransition: 'slide',
            afterHidden: function () {
                if(reload==true){
                    location.reload();
                }
            }
        })

}

function showToastWarning(message, reload){

    $.toast({
        heading: 'Atenção',
        text: message,
        position: 'bottom-right',
        icon: 'warning',
        loader: true,        // Change it to false to disable loader
        loaderBg: '#f1f4f7',
        bgColor: '#ffc400',  // To change the background
        showHideTransition: 'slide',
        afterHidden: function () {
            if(reload==true){
                location.reload();
            }
        }
    })

}

function showToastInfo(message, reload){

    $.toast({
        heading: 'Informação',
        text: message,
        position: 'bottom-right',
        icon: 'info',
        loader: true,        // Change it to false to disable loader
        loaderBg: '#f1f4f7',
        bgColor: '#0091ea',  // To change the background
        showHideTransition: 'slide',
        afterHidden: function () {
            if(reload==true){
                location.reload();
            }
        }
    })

}