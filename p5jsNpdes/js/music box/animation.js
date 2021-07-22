

let params;
let anim;
 //1,0.674509803922,0.109803921569 0.9215686274509803, 0.8745098039215686, 0.22745098039215686
 //console.log([235, 223, 58].map(n => n / 255))
//console.log(14, 171, 206].map(n => n / 255))
let elem=document.getElementById('lottie');


    params = {
        container: elem,
        renderer: 'svg',
        loop: true,
        autoplay: true,
        animationData: idleAnim
    };



 anim = lottie.loadAnimation(params);



function idle() {
        anim.destroy();
        params.animationData = idleAnim;
        anim = lottie.loadAnimation(params);
        anim.play();
}

function loadAnimation() {
const windUpSound= document.getElementById("windUp");
const volumeVal = document.getElementById("volumeSlider").value;
const loadMsg = document.getElementById("loading");
if((boxInit>2) && !modeBol){
loadMsg.style.display = "block";
}


      windUpSound.currentTime = 0;
   
      windUpSound.volume = (volumeVal / 100);
      windUpSound.play();

            params.loop = false;
            params.animationData = loadAnim;
            anim.destroy();
            
            anim = lottie.loadAnimation(params);
            anim.setSpeed(1.8);

            anim.play();

     setTimeout(()=>{
         
     loadMsg.style.display = "none";
            
       },3000)


}
function generateRandomAnimation() {

            params.loop = false;
            params.animationData = playAnim;
            anim.destroy();
            
            anim = lottie.loadAnimation(params);
            anim.setSpeed(1.8);

            anim.play();

  setTimeout(()=>{
     
            params.loop = true;
            params.animationData = idleAnim;
            anim.destroy();
            anim = lottie.loadAnimation(params);
            anim.play();
         
        
             },700)

}
function fastPreviewAnim(){
  
let windUpSound= document.getElementById("windUp");
 let volumeVal = document.getElementById("volumeSlider").value;
let loadMsg = document.getElementById("loading");
   setTimeout(()=>{
         loadMsg.style.display = "none";
         
             },4200)
         
windUpSound.currentTime = 0;
   
      windUpSound.volume = (volumeVal / 100);
      windUpSound.play();

            params.loop = false;
            params.animationData = loadAnim;
            anim.destroy();
            
            anim = lottie.loadAnimation(params);
            anim.setSpeed(2.5);

            anim.play();
          
            
   setTimeout(()=>{
     scrollToElXY(0);
            params.loop = true;
            params.animationData = readyAnim;
            anim.destroy();
            anim = lottie.loadAnimation(params);
            anim.play();
         
        
             },4000)
}

function playAnimation(){
            setTimeout(()=>{
            params.loop = true;
            params.animationData = playAnim;
            anim.destroy();
            anim = lottie.loadAnimation(params);
            anim.play();
            
             },3000)
}



function listenOnly(){
             params.loop = true;
            params.animationData = happyAnim;
            anim.destroy();
            anim = lottie.loadAnimation(params);
            anim.play(); 
}
