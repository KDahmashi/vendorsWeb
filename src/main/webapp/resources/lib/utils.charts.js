/*Charts*/
var CHARTCOLORS=['#1E90FF','#32CD32','#FFD700','#8085e9','#f15c80','#e4d354','#2b908f','#f45b5b','#91e8e1'];
var MONTHAR=["","يناير","فبراير","مارس","إبريل","مايو","يونيو","يوليو","أغسطس","سبتمبر","أكتوبر","نوفمبر","ديسمبر"];
var DAYS=['0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31'];

function initWidgetPieChart(r,widgetid,title){
	var o=initWidgetEnv(r,widgetid);
	InitChartPieMin(o.wgtDiv+' .plhWgtChart',title+myApp.format.billion(o.total),o.tableId,60)
}
function initWidgetPieChart3D(r,widgetid,title,e){
	var o=initWidgetEnv(r,widgetid);
	InitChartPie3d(o.wgtDiv+' .plhWgtChart',title+myApp.format.billion(o.total),o.tableId,e);
}
function initWidgetEnv(r,widgetid){
	var tableId='tbl'+widgetid;var wgtDiv='div#'+widgetid;
	myApp.tables.add(r,tableId);var total=myApp.tables.sum('#'+tableId,2);
	var $WGT=$(wgtDiv+' .plhWgtSummary');
	if($WGT.length){$(wgtDiv+' .plhWgtSummaryTotal').text(myApp.format.billion(total));var WGTPos=+$WGT.attr('data-position');if(WGTPos>0){$('div#DashboardSummary>div:eq('+(WGTPos-1)+')').append($WGT.html());$(wgtDiv+' .plhWgtSummary').remove()}}
	return {tableId:tableId,wgtDiv:wgtDiv,total:total}
}
function initWidgetEnv(r,widgetid){
	var tableId='tbl'+widgetid;var wgtDiv='div#'+widgetid;
	myApp.tables.add(r,tableId);var total=myApp.tables.sum('#'+tableId,2);
	var $WGT=$(wgtDiv+' .plhWgtSummary');
	if($WGT.length){$(wgtDiv+' .plhWgtSummaryTotal').text(myApp.format.billion(total));var WGTPos=+$WGT.attr('data-position');if(WGTPos>0){$('div#DashboardSummary>div:eq('+(WGTPos-1)+')').append($WGT.html());$(wgtDiv+' .plhWgtSummary').remove()}}
	return {tableId:tableId,wgtDiv:wgtDiv,total:total}
}
function initWidgetMultiCol(r,widgetid,title,cols,e){
	var o=initWidgetEnvMultiCol(r,widgetid,cols);
	InitChartMultiCol('column',o.wgtDiv+' .plhWgtChart',title,o.tableId,'',e)
}
function initWidgetEnvMultiCol(r,widgetid,cols){
	var tableId='tbl'+widgetid;var wgtDiv='div#'+widgetid;
	myApp.tables.addMultiCol(r,tableId,cols);
	return {tableId:tableId,wgtDiv:wgtDiv}
}
function InitChartMultiCol(type,plh,title,tableId,yAxisTitle,e){
	$(plh).highcharts({
		colors:CHARTCOLORS,
		data:{table:tableId},title:{text:title,useHTML:true},chart:{renderTo:plh,type:type},
		/*tooltip:{formatter:function(){return this.point.y}},*/
        tooltip:{pointFormat:'<span>{point.y}</span>: {series.name}</b><br/>'},
		yAxis:{allowDecimals:false,title:{text:yAxisTitle}},
		plotOptions:{series:{colorByPoint:false,borderWidth:0,dataLabels:{enabled:true,formatter:function(){return (typeof formatLabel=='function')?formatLabel(this.point.y):this.point.y}}},column:{depth:25,events:e,showInLegend:true,allowPointSelect:true,cursor:'pointer'}}
	});
	$("text:contains('Highcharts.com')").hide();
}
function InitChartPie3d(plh,title,tableId,e){InitChartPie(plh,title,tableId,e,{enabled:true,alpha:45,beta:0})}
function InitChartPie(plh,title,tableId,e,opt3d){
	$(plh).highcharts({
		colors:CHARTCOLORS,data:{table:tableId},title:{text:title,useHTML:true},chart:{type:'pie',options3d:opt3d},tooltip:{formatter:function(){return myApp.format.billion(this.y)}},
		plotOptions:{pie:{events:e,showInLegend:true,allowPointSelect:true,cursor:'pointer',innerSize:60,depth:30,dataLabels:{useHTML:true,enabled:true,textShadow:false,format:'{point.name}<br><span dir="rtl">{point.percentage:.1f}% <i class="fa fa-long-arrow-left"></i> {point.y}</span>'}}}
	});$("text:contains('Highcharts.com')").hide();
}
function InitChartPieMin(plh,title,tableId,incircle,opt3d){
	$(plh).highcharts({
		colors:CHARTCOLORS,data:{table:tableId},title:{text:title,useHTML:true},chart:{type:'pie',options3d:opt3d},tooltip:{formatter:function(){return myApp.format.billion(this.y)}},
		plotOptions:{pie:{showInLegend:true,allowPointSelect:true,cursor:'pointer',innerSize:incircle,depth:30,dataLabels:{useHTML:true,enabled:true,textShadow:false,format:'{point.name}<br><span dir="ltr">{point.percentage:.1f}%</span>'}}}
	});$("text:contains('Highcharts.com')").hide();
}
function InitWidgetChartCol(type,r,widgetid,title,yAxisTitle,e,formatLabel){
	var o=initWidgetEnv(r,widgetid);
	InitChartCol(type,o.wgtDiv+' .plhWgtChart',title+((typeof formatLabel=='function')?formatLabel(o.total):o.total),o.tableId,yAxisTitle,e,formatLabel);
}
function InitChartCol(type,plh,title,tableId,yAxisTitle,e,formatLabel){
	$(plh).highcharts({
		colors:CHARTCOLORS,
		data:{table:tableId},title:{text:title,useHTML:true},chart:{renderTo:plh,type:type},tooltip:{formatter:function(){return this.point.y}},yAxis:{allowDecimals:false,title:{text:yAxisTitle}},
		plotOptions:{series:{colorByPoint:true,borderWidth:0,dataLabels:{enabled:true,formatter:function(){return (typeof formatLabel=='function')?formatLabel(this.point.y):this.point.y}}},column:{depth:25,events:e,showInLegend:false,allowPointSelect:true,cursor:'pointer'}}
	});
	$("text:contains('Highcharts.com')").hide();
}
function InitChartCol3d(type,plh,title,tableId,e){
	$(plh).highcharts({
		colors:CHARTCOLORS,
		data:{table:tableId},title:{text:title,useHTML:true},chart:{renderTo:plh,type:type,margin:75,options3d:{enabled:true,alpha:15,beta:15,depth:50}},tooltip:{formatter:function(){return this.point.y}},yAxis:{allowDecimals:false,title:{text:'ريال'}},
		plotOptions:{series:{colorByPoint:false,borderWidth:0,dataLabels:{enabled:true,formatter:function(){return myApp.format.billion(this.point.y)}}},column:{depth:25,events:e,showInLegend:false,allowPointSelect:true,cursor:'pointer'}}
	});
	$("text:contains('Highcharts.com')").hide();
}
function InitSubPie(url,params,plhId,title,pieId,fx){
	$('#'+plhId+' .tblDetails').html('');
	myApp.forms.sHidden(plhId,title);myApp.forms.sHidden(plhId+'Id',pieId);
	var plh=$('#'+plhId+'>div');if(plh.hasClass('col-lg-6')){plh.removeClass('col-lg-6').addClass('col-lg-12').removeClass('col-md-6').addClass('col-md-12')};
	var chartmain=plh.find('div.chartmain');if(chartmain.hasClass('col-lg-12')){chartmain.removeClass('col-lg-12').addClass('col-lg-6').removeClass('col-md-12').addClass('col-md-6')};
	plh.find('div.chartsub').removeClass('hidden');
	var TblSubPie='tbl'+plhId+'Sub'+pieId;if(!$('#'+TblSubPie).length){myApp.ajax.Exec(url,params,function(r){myApp.tables.add(r,TblSubPie);fx(plhId,title,pieId)},myApp.ajax.Err)}else{fx(plhId,title,pieId)}
	$('html,body').animate({scrollTop:plh.offset().top-80},1000);
}
function InitSubMultiCol(url,params,plhId,title,pieId,cols,fx){
	var plh=$('#'+plhId+'>div');
	$('#'+plhId+' .tblDetails').html('');myApp.forms.sHidden(plhId,title);
	plh.find('div.chartsub').removeClass('hidden');
	var tableId='tbl'+plhId+'Sub'+pieId;if(!$('#'+tableId).length){myApp.ajax.Exec(url,params,function(r){myApp.tables.addMultiCol(r,tableId,cols);fx(plhId,title,pieId)},myApp.ajax.Err)}else{fx(plhId,title,pieId)}
	//console.log(plh.offset().top-$(document).scrollTop());
	$('html,body').animate({scrollTop:plh.find('div.chartsub').offset().top-80},1000);
}
function gChartTotal(title,tbl,colIndex){var total=myApp.tables.sum('#'+tbl,colIndex);return title+' <i class="fa fa-long-arrow-left"></i> '+myApp.format.billion(total)}
function expandSubchart(plh){if(plh.hasClass('col-lg-6')){plh.removeClass('col-lg-6').addClass('col-lg-12').removeClass('col-md-6').addClass('col-md-12')};var chartmain=plh.find('div.chartmain');if(chartmain.hasClass('col-lg-12')){chartmain.removeClass('col-lg-12').addClass('col-lg-6').removeClass('col-md-12').addClass('col-md-6')}}