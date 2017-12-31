cfg.path=function(k){var u={
		utl:'lib/utils.js',
		grid:'lib/utils.grid.js',
		highcharts:'lib/plugins/charts/highcharts/highcharts.full.js',
		utilcharts:'lib/plugins/charts/highcharts.utils.js',
		tblsorter:'lib/plugins/jquery.tablesorter.min.js',
		colorbox:'lib/plugins/colorbox/jquery.colorbox-min.js',
		colorboxcss:'lib/plugins/colorbox/colorbox.css',
		calplg:'lib/plugins/calendar/jquery.datepick-5.0.1/jquery.plugin.min.js',
		calmin:'lib/plugins/calendar/jquery.datepick-5.0.1/jquery.datepick.min.js',
		calarb:'lib/plugins/calendar/jquery.datepick-5.0.1/jquery.datepick-ar-EG.js',
		calcss:'lib/plugins/calendar/jquery.datepick-5.0.1/humanity.datepick.css',

		jqr:'lib/plugins/jquery-2.1.4.min.js',
		bts:'lib/plugins/bootstrap/js/bootstrap.min.js',
		select2css:'lib/plugins/forms/select2/css/select2.min.css',
		select2bts:'lib/plugins/forms/select2/css/select2-bootstrap.min.css',
		select2:'lib/plugins/forms/select2/js/select2.min.js'
	};return u[k]
};
cfg.cdn=function(k){return cfg.baseUrl+cfg.path(k)};
cfg.coreScripts=[cfg.cdn('jqr'),cfg.cdn('bts'),cfg.cdn('colorbox'),cfg.cdn('colorboxcss'),cfg.cdn('utl')];/*core scripts array*/

/*		select2css:'//cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css',
		select2bts:'//cdnjs.cloudflare.com/ajax/libs/select2-bootstrap-css/1.4.6/select2-bootstrap.min.css',
		select2:'//cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js'
*/