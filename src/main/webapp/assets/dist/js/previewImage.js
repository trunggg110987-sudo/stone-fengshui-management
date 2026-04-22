window.previewImage = function (event) {
    const file = event.target.files[0];
    const img = document.getElementById("preview");

    if (!file) {
        img.style.display = "none";
        return;
    }

    if (!file.type.startsWith("image/")) {
        alert("Please select an image!");
        img.style.display = "none";
        return;
    }

    const reader = new FileReader();

    reader.onload = function (e) {
        img.src = e.target.result;
        img.style.display = "block";
    };

    reader.readAsDataURL(file);
};