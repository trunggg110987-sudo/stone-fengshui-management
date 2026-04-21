const input = document.getElementById("priceInput");

// format khi nhập
input.addEventListener("input", function () {
    let value = this.value.replace(/\D/g, "");

    if (!value) {
        this.value = "";
        return;
    }

    this.value = new Intl.NumberFormat("vi-VN").format(value);
});

// bỏ dấu khi submit
document.querySelector("form").addEventListener("submit", function () {
    input.value = input.value.replace(/\./g, "");
});