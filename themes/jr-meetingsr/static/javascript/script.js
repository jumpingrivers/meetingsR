window.onload= function (){
    stickyFunctionality();
}
window.addEventListener('resize',e=>{
    stickyFunctionality();
    
})

function stickyFunctionality(){
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
        console.log(headerMaxWidth,sidebarMaxWidth,mainHeaderheight,leftSideWhiteSpace)
        
        let computerScreen= window.matchMedia('(min-width:768px)');

        document.addEventListener('scroll',e=>{
           
                if(window.scrollY>mainHeaderheight){
                    console.log(computerScreen)
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
        })
        
}
