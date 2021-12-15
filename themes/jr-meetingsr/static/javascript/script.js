window.onload= function (){
    stickyFunctionality();
}
window.addEventListener('resize',e=>{
    stickyFunctionality();
})

function stickyFunctionality(){
        const header= document.querySelector('.card-details__header');
        if(header){
            const scrollTopIcon = document.querySelector('.scroll-top');
            const sidebar= document.querySelector('.card-details__sidebar');
            const mainHeader= document.querySelector('.header');
            const mainContentWrapper= document.querySelector('.card-details__category-wrapper');
            let headerMaxWidth= document.querySelector('.card-details__schedule').clientWidth;
            let sidebarMaxWidth= sidebar.clientWidth;
            const mainHeaderheight= mainHeader.offsetHeight+3;
            console.log(mainHeaderheight)
            const screenWidth= window.innerWidth;
            let containerWidth= document.querySelector('.container').clientWidth;
            const containerLeftPadding= getComputedStyle(document.querySelector('.container')).paddingLeft;
            let leftSideWhiteSpace= ((screenWidth-containerWidth)/2) + parseFloat(containerLeftPadding);
            
            let computerScreen= window.matchMedia('(min-width:768px)');
            let computerScreenMax= window.matchMedia('(max-width:767px)');

            document.addEventListener('scroll',e=>{
            
                    if(window.scrollY>mainHeaderheight){
                    
                        if(computerScreen.matches){
                            sidebar.style.cssText = `max-width: ${sidebarMaxWidth}px; left: ${headerMaxWidth+leftSideWhiteSpace+20}px` ;
                        }
                        
                        header.style.cssText = `position: fixed; top: 0; z-index: 1000; max-width: ${headerMaxWidth}px;`;
                        mainContentWrapper.style.paddingTop= `${header.offsetHeight}px`;
                    
                    }else{
                        if(computerScreen.matches){
                            sidebar.removeAttribute('style');
                        }
                    
                        header.removeAttribute('style');
                        mainContentWrapper.removeAttribute('style');
                    }

                    //scrollTop start here
                    if(window.scrollY>(window.innerHeight*50/100)){
                        if(computerScreenMax.matches){
                            scrollTopIcon.style.display="grid";
                        }
                    }else{
                        scrollTopIcon.removeAttribute("style");
                    }
            })
        }  
}


//Header functionality
const header = document.querySelector('.header__nav')
const openIcon = document.querySelector('.header__nav-icon')
const closeIcon = document.querySelector('.header__close-circle')
const body = document.querySelector('body');
let scrollyaxis;

openIcon.addEventListener('click',e=>{
    header.style.display = 'grid';
    scrollyaxis= window.scrollY;
    body.style.position=`fixed`;
    body.style.top=`-${scrollyaxis}px`;
    body.style.left=`0`;
    body.style.right=`0`;
})

closeIcon.addEventListener('click',e=>{
    header.style.display = 'none';
    body.style.removeProperty('position')
    body.style.removeProperty('top')
    body.style.removeProperty('left')
    body.style.removeProperty('right')
    window.scrollTo(0, scrollyaxis);
})