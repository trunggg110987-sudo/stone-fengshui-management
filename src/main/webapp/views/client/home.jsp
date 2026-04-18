<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 4/11/2026
  Time: 2:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%--banner--%>
<div class="home-slider">
    <img src="${pageContext.request.contextPath}/images/banner1.jpg" class="active">
    <img src="${pageContext.request.contextPath}/images/banner2.jpg">

    <button class="prev">&#10094;</button>
    <button class="next">&#10095;</button>
</div>

<%-- 2 nút <>--%>
<script>
    document.addEventListener("DOMContentLoaded", function(){

        let slides = document.querySelectorAll(".home-slider img");
        let prev = document.querySelector(".home-slider .prev");
        let next = document.querySelector(".home-slider .next");

        let index = 0;

        function showSlide(i){
            slides.forEach(s => s.classList.remove("active"));
            slides[i].classList.add("active");
        }

        next.addEventListener("click", function(){
            index = (index + 1) % slides.length;
            showSlide(index);
        });

        prev.addEventListener("click", function(){
            index = (index - 1 + slides.length) % slides.length;
            showSlide(index);
        });

        setInterval(function(){
            index = (index + 1) % slides.length;
            showSlide(index);
        },3000);

    });
</script>