// Cria��o do servi�o do GA
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','https://www.bcb.gov.br/Paginas/js/libs/ga/analytics.js','ga');

ga('create', 'UA-65460906-3', 'auto');


function trackGA (titulo) {
    var hash = window.location.hash.split('#')[1];
	var caminhoPagina = '';
	// Rotar do angular do Angular.
	if(hash){
		caminhoPagina = window.location.pathname + hash;
	}
	else {
		caminhoPagina = window.location.pathname + "/" + window.location.search;
	}
	
    ga('send', 'pageview', {'page': caminhoPagina, 'title': titulo});
};

// Tracking de refer�ncias (Downloads, Mail e links externos)
(function(){
    $(document).on('mousedown', 'a', function () {
        var $this = $(this);
        var href = ($this.prop('href') || '').split('?')[0];
        var ext = href.split('.').pop();
        if (href.toLowerCase().indexOf('mailto:') === 0) {
            ga('send', 'event', 'Mailto', href.substr(7));
        }
        if ('xls,xlsx,doc,docx,ppt,pptx,pdf,txt,zip,rar,7z,exe,wma,mov,avi,wmv,mp3,csv,tsv'.split(',').indexOf(ext) !== -1) {
            ga('send', 'event', 'Download', ext, href);
        } else if ((this.protocol === 'http:' || this.protocol === 'https:') && this.hostname.indexOf(document.location.hostname) === -1) {
            ga('send', 'event', 'Outbound', this.hostname, this.pathname);
        }
    });
})()