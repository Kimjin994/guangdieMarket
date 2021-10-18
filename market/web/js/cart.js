// JavaScript Document

window.onload=function(){
	var Win=document.querySelector('.daming_win');
	var Winbox=Win.querySelector('.daming_win_box');
	var deleteList=document.querySelectorAll('.deleteBox');
	var deleteBtn=null;
	
	
	for(var i=0;i<deleteList.length;i++){
		deleteList[i].onclick=function(){
			Win.style.display="block";
			window.console.log(this);
			deleteBtn=this;
			
			var up=deleteBtn.querySelector('.up');
			window.console.log(up+"1");
			
			up.style.webkitTransition="all 1s";
			up.style.transition="all 1s";//鼠标悬停出现动画效果
			
			up.style.webkitTransformOrigin="0 5px";
			up.style.transformOrigin="0 5px";
			
			up.style.webkitTransform="rotate(-30deg) translateY(2px)";
			up.style.transform="rotate(-30deg) translateY(2px)";
		}
	}
	Winbox.querySelector('.cancel').onclick=function(){
		Win.style.display="none";
		Winbox.classList.remove('bounceInDown');
		if(deleteBtn){
			var up=deleteBtn.querySelector('.up');
			up.style.webkitTransform="none";
			up.transform="none";
		}
	}
}