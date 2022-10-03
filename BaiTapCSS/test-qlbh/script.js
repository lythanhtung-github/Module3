const rightBtn = document.querySelector('.fa-solid fa-chevron-right');
const leftBtn = document.querySelector('.fa-solid fa-chevron-left');
const imgNumber = document.querySelectorAll(".slider-content-left-top img");
let index = 0;
function clickLeft() {
    index = index - 1;
    if (index < 0) {
        index = imgNumber.length - 1;
    }
    console.log(index);
    document.querySelector(".slider-content-left-top").style.right = index * 100 + "%";
}

function clickRight() {
    index = index + 1;
    if (index > imgNumber.length - 1) {
        index = 0;
    }
    document.querySelector(".slider-content-left-top").style.right = index * 100 + "%";
}

const imgNumberLi = document.querySelectorAll(".slider-content-left-mid li");

function clickContent(number) {
removeActive();
    for (let i = 0; i < imgNumberLi.length; i++) {
         
        if (i == number) {
            document.querySelector(".slider-content-left-top").style.right = i * 100 + "%";
            imgNumberLi[i].classList.add("active");
        }
    }
}

function removeActive() {
    let imgActive = document.querySelector(".active");
    imgActive.classList.remove("active")
}

// setInterval(clickRight(),1000);
let formChat = document.querySelector(".box-chat>.container");
let iconChat = document.querySelector(".title-chat");
console.log(formChat);
function clickChat(){
    formChat.classList.remove('d-none');
    iconChat.classList.add('d-none');
}

function turnOffChat(){
    formChat.classList.add('d-none');
    iconChat.classList.remove('d-none');
}

let resultProduct = document.querySelector('#resultProduct');
let resultLove = document.querySelector('#resultLove');

function chatProduct(){
    resultLove.innerHTML = "";
    resultProduct.innerHTML = "- Cửa hàng hiện tại có rất nhiều sản phẩm, anh/chị có thể thêm vào giỏ hàng và thanh toán ạ!";
}

function chatLove(){
    resultLove.innerHTML = "- Lộc yêu anh/chị ạ!";
    resultProduct.innerHTML ="";
}