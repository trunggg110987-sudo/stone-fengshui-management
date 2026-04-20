document.addEventListener("DOMContentLoaded", function () {

    let toastEl = document.getElementById("liveToast");

    if (toastEl) {
        let toast = new bootstrap.Toast(toastEl, {
            delay: 3000
        });

        toast.show();
    }

});