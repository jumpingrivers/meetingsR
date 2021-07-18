window.onload= function (){
    stickyFunctionality();
}
window.addEventListener('resize',e=>{
    stickyFunctionality();
})

function stickyFunctionality(){
        const scrollTopIcon = document.querySelector('.scroll-top');
        const header= document.querySelector('.card-details__header');
        const sidebar= document.querySelector('.card-details__sidebar');
        const mainHeader= document.querySelector('.header');
        let headerMaxWidth= document.querySelector('.card-details__schedule').clientWidth;
        let sidebarMaxWidth= sidebar.clientWidth;
        const mainHeaderheight= mainHeader.clientHeight+3;
        const screenWidth= window.innerWidth;
        let containerWidth= document.querySelector('.container').clientWidth;
        const containerLeftPadding= getComputedStyle(document.querySelector('.container')).paddingLeft;
        let leftSideWhiteSpace= ((screenWidth-containerWidth)/2) + parseFloat(containerLeftPadding);
        
        let computerScreen= window.matchMedia('(min-width:768px)');
        let computerScreenMax= window.matchMedia('(max-width:767px)');

        document.addEventListener('scroll',e=>{
           
                if(window.scrollY>mainHeaderheight){
                   
                    if(computerScreen.matches){
                        sidebar.style.cssText = `position: fixed; top: 20px; max-width: ${sidebarMaxWidth}px; left: ${headerMaxWidth+leftSideWhiteSpace+20}px` ;
                    }
                    
                    header.style.cssText = `position: fixed; top: 0; z-index: 1000; max-width: ${headerMaxWidth}px;`;
                
                }else{
                    if(computerScreen.matches){
                        sidebar.removeAttribute('style');
                    }
                   
                    header.removeAttribute('style');
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

    
    //navbar start here
    const menuIconOpen = document.querySelector('.header__nav-icon');
    const nav = document.querySelector('.card-details__header');
    const crossIcon = document.querySelector('.header__icon-close');
    const navIcon = document.querySelector('.header__icon');

    menuIconOpen.addEventListener('click', (e)=>{
        nav.classList.toggle('card-details__header--open');
        navIcon.classList.toggle('header__icon--close');
        crossIcon.classList.toggle('header__icon-close--open');
    })
