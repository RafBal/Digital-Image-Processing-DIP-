var wmax; 

   function flink(p1,p2) {
	return '<a href="'+p1+'">'+p2+'</a>';
   }


   function criar_menu_rodape() {
      var srod = "";
      var s1 = "";
      var gco = 1;

      $('#menunivel1 a').each(function() {
         atr1 = $(this).attr("href");
	 atra = $(this).text();
	 pai = $(this).parent();
         len1 = pai.children().length;
 	 if (len1>1) {		// pai
		s1 = s1 + atra + "\n";

		if (srod!="") srod += '</ul></div>\n';

      		srod += '<div class="column0'+gco+'"><ul>'+flink(atr1,atra)+'\n';

      		if (gco==1) gco=2;
      		else gco=1;

	 } else { 		// filho 
		s1 = s1 + ">>>>>" + atra + "\n";
		srod += '<li>' + flink(atr1,atra) + '</li>\n';

	 }


      });

      srod += '</ul></div>\n';

      //alert(srod);
      $('#roda').addClass('menuExpandido');
      $('#roda').html(srod);	

   }




   function processar_palavra (p1) {
      var s0 = "";
      var ch;
      // s1.replace("/^\s+|\s+$/g","");

      p1 = p1.toLowerCase();

      for (var i1=0; i1<p1.length;i1++ ) {
        ch = p1.charAt(i1);

	if ((ch=='â')||(ch=='á')||(ch=='à')||(ch=='ã')) 	ch='a';
	else if ((ch=='Â')||(ch=='Á')||(ch=='À')||(ch=='Ã'))	ch='A';
	else if ((ch=='ê')||(ch=='é')||(ch=='è')) 		ch='e';
	else if ((ch=='Ê')||(ch=='É')||(ch=='È')) 		ch='e';
	else if ((ch=='î')||(ch=='í')||(ch=='ì')) 		ch='i';
	else if ((ch=='Î')||(ch=='Í')||(ch=='Ì')) 		ch='I';
	else if ((ch=='ô')||(ch=='ó')||(ch=='ò')||(ch=='õ')) 	ch='o';
	else if ((ch=='Ô')||(ch=='Ó')||(ch=='Ò')||(ch=='Õ')) 	ch='O';
	else if ((ch=='ú')||(ch=='ù')) 				ch='u';
	else if ((ch=='Ú')||(ch=='Ù')) 				ch='U';
	else if ((ch=='ç'))	 				ch='c';
	else if ((ch=='Ç'))	 				ch='C';

   

	if (ch!=null) s0 = s0 + ch;
      }

      return s0;
   }



   function criar_lista_palavras2() {
      var s1 = "";

      $('#menunivel1 a').each(function() {
         atr1 = $(this).attr("href");
	 //atra = $(this).text().replace("/^\s+|\s+$/g","");
	 atra = processar_palavra($(this).text());
	 s1 = s1 + atra +"|"
      });


      /*
      if ($('#menuInterno a').html()!=null) {

         $('#menuInterno a').each(function() {
            atr1 = $(this).attr("href");
   	    //atra = $(this).text().replace("/^\s+|\s+$/g","");
	    atra = processar_palavra($(this).text());
	    s1 = s1 + atra +"|"
         });
      }
      */
      

      //alert(s1);
      var vs1 = s1.split("|").sort();

      for (var i1=0; i1<vs1.length-1;i1++ ) {
	if (vs1[i1]==vs1[i1+1]) vs1.splice(i1,1);
      }


      $( "#consulta" ).autocomplete({ source: vs1 } , { minLength: 2 });
      $( "#consulta" ).bind( "autocompleteselect", function(event, ui) {
         $('#busca').submit();
      });


   }


   function criar_lista_palavras2() {
	var palas;

	$.get("../gestao_site/palavras.txt", function(data) { 
		palas = data.split("\n");
		criar_lista_palavras_incluir(palas)
	});

   }

   function criar_lista_palavras() {
      var s1 = "";

      $('#menunivel1 a').each(function() {
         atr1 = $(this).attr("href");
	 //atra = processar_palavra($(this).text());
	 atra = $(this).text();
	 s1 = s1 + atra +"|"
      });

      var vs1 = s1.split("|").sort();

      for (var i1=0; i1<vs1.length-1;i1++ ) {
	if (vs1[i1]==vs1[i1+1]) vs1.splice(i1,1);
      }

      criar_lista_palavras_incluir(vs1);

   }



   function criar_lista_palavras_incluir(vp1) {
        $( "#consulta" ).autocomplete({ source: vp1 } , { minLength: 2 });
        $( "#consulta" ).bind( "autocompleteselect", function(event, ui) {
           $('#consulta').val(ui.item.value);
           $('#busca').submit();
        });
   }


   // novo menu
   function menu() {
       wmax = $("#topo").offset().left + $("#topo").outerWidth(true);
       menu_eventos();
   }




   function menu_mostrar(pob1) {
       wmax = $("#topo").offset().left + $("#topo").outerWidth(true);
       ple1 = pob1.find("span").offset().left;
       pwd1 = pob1.find("div").outerWidth(true);

       pob1.find("div").width(pwd1);

       if ((ple1 + pwd1) > wmax) {
           ple1 = ple1 - pwd1 + pob1.find("span").outerWidth(true);
       }


       pob1.find("span").addClass("spa2");
       pob1.find(".latesq").offset({ left: ple1 });


       //alert("");

   }


   function menu_esconder(pob1) {
       pob1.find("span").removeClass("spa2");
       pob1.find(".latesq").offset({ left: -999 });
   }



   function menu_eventos() {
       $('#topo li').hover(
   	function () { menu_mostrar($(this)); },
  	function () { menu_esconder($(this)); }

   );


   }






   function manchetes() {
    $('.painel')
   	.before('<div id="nav">')
   	.cycle({
     		fx: 'fade',
     		speed: 0,
     		speedIn: 500,
     		timeout: 5000,
			cleartype:  true,
    		cleartypeNoBg: false,
     		pager: '#nav',
			pause: true,
			pauseOnPageHover: true
   	});

   //$('.painel').cycle('pause');
   }




   function finiciar() {
        menu();
        criar_lista_palavras();

	if ( (typeof(t_PaginaPrincipal)!="undefined") && (t_PaginaPrincipal) ) { 
                criar_menu_rodape();
		manchetes();
	}
   }

