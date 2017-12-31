head.ready(function(){head.load(cfg.coreScripts,function(){AP1.Init()})});
var AP1=AP1||{};
AP1.Init=function(){$(function(){
    $('.numeric').numeric();
	$('.tipsy').tooltip();myApp.colorbox.init();
	/*sidebar*/$(window).bind("load resize",function(){if($(this).width()<768){$('div.sidebar-collapse').addClass('collapse')}else{$('div.sidebar-collapse').removeClass('collapse')}})
	$($('meta[name=menuid]').attr("content")).addClass('active');
})}