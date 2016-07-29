/*	
 * Turbolinks wrapper for jQuery mmenu
 * Include this file after including the jquery.mmenu plugin for default Turbolinks support.
 */


(function( $ ) {

	var _PLUGIN_ = 'mmenu';

	//	Vars
	var ready, classnames, $html;

	//	Store the HTML classnames onDocumentReady
	$(document).ready(
		function()
		{
			$html = $('html');
			classnames = $html.attr( 'class' );
		}
	);

	//	Reset the HTML classnames and reset the $.mmenu.glbl variable on page:change
	$(document).on(
		'page:change',
		function()
		{
			if (classnames) {
				$html.attr( 'class', classnames );
			} else {
				$html.attr( 'class', '' );
			}
			$[ _PLUGIN_ ].glbl = false;
		}
	);

})( jQuery );