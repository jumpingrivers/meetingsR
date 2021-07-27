// window.onload = function (){
//     carouselfunctionality();
//     addActiveMenu();
// }
// window.addEventListener('resize',e=>{
//     carouselfunctionality();
//     addActiveMenu();
// })
carouselfunctionality();
    addActiveMenu();
function carouselfunctionality(){
    const leftArrow= document.querySelector('.card-details__arrow--left');
    const rightArrow= document.querySelector('.card-details__arrow--right');
    const sliderContainer= document.querySelector('.card-details__carousel');
    const slides= document.querySelectorAll('.card-details__carousel-item');
    const sliderContainerWidth= sliderContainer.clientWidth;
    const slidesNumeber= slides.length;
    let slideLength= 0;
    slides.forEach((slide=>{
        slideLength+= slide.clientWidth;
    }))
    let totalSliderWidth= slideLength+ (slidesNumeber*10);
    const highestMovable= totalSliderWidth-sliderContainerWidth;
    let movableWidth= 0;

    rightArrow.addEventListener('click',e=>{
        moveLeft();
        
    })

    leftArrow.addEventListener('click',e=>{
        moveRight();
        
    })
    
    function moveLeft(){
        movableWidth+=200;
        if(movableWidth<highestMovable){
            sliderContainer.style.transform= `translateX(-${movableWidth}px)`;
        }else{
            movableWidth=highestMovable;
            sliderContainer.style.transform= `translateX(-${movableWidth}px)`;
        }
    }
    function moveRight(){
        movableWidth-=200;
        if(movableWidth<=0){
            movableWidth=0;
            sliderContainer.style.transform= `translateX(-${movableWidth}px)`;
        }else{
            sliderContainer.style.transform= `translateX(-${movableWidth}px)`;
        }
    }
}

function addActiveMenu(){
    const menuItems= document.querySelectorAll('.card-details__carousel-item');
    menuItems.forEach((menuItem=>{
        menuItem.addEventListener('click',e=>{
            menuItems.forEach(menuItem=>{
                if(menuItem.classList.contains('card-details__carousel-item--active')){
                    menuItem.classList.remove('card-details__carousel-item--active');
                    let id= menuItem.getAttribute('href');
                    id= id.slice(1)
                    document.getElementById(id).style.removeProperty('padding-top');
                }
            })
            menuItem.classList.add('card-details__carousel-item--active');
            let id= menuItem.getAttribute('href');
                id= id.slice(1)
            document.getElementById(id).style.paddingTop= "150px";
        })
    }))
}
