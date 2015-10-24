<?php /* amr-ical-custom-style-file example
For advanced users only who are very familiar with php, html and css
Copy this file to your uploads directory so that it will not be overwritten.  Then tailor the html.
Tag examples that do not have closing '>' will have classes  added to them and then closed - do not close them here.
If the tag is empty '', then no classes will be added (of course)  asthat would break the html

* Think of the layout as events in rows with event properties in columns.
* Ensure that the settings in the listtype will work with the html.
* Note that you could add your own css tags by adding div's or spans to the before and after elements
* You may also need to check / change the css.
* the .AMR_NL's add new lines in the osurce for readability  - the idea was to switch that off later for more compact code 
 */

if ($where_am_i === 'in_events') {

		$htm['ul']		= ''; 
		$htm['ulc']		= ''; 
		$htm['li']		= '<span '; // required for rich snippets, microformat
		$htm['lic']		= '</span>';
		/* allow for a class specifictaion */
		$htm['row']		= '<article '; 	 // each event
		$htm['rowc'] 	= '</article>'.AMR_NL;
		$htm['hcell']	='<h2 '; 	// the 'column' header cell
		$htm['hcellc'] 	='</h2>';
		$htm['cell'] 	='';
		$htm['cellc'] 	='';
//
		$htm['grow']	= '<header><h3 ';	// the grouping html text for a group of events - not the surrounding selector
		$htm['growc']   = '</h3></header>'.AMR_NL;
		$htm['ghcell']  = '';
		$htm['ghcellc'] = '';
//
		$htm['head'] 	= '<h2 ';
		$htm['headc'] 	= '</h2>';
		$htm['foot'] 	= '<footer '; 	// this could have the pagination inside it if pagination is requested , and the "add new event link" when logged in
		$htm['footc'] 	= '</footer>'.AMR_NL; 
//
		$htm['body'] 	= '<section ';	// the grouping html text for a group of events - not the surrounding selector
		$htm['bodyc'] 	= '</section>'.AMR_NL;
//
		$htm['box'] 	= '<section';  // the whole calendar
		$htm['boxc'] 	= '</section>'.AMR_NL;

}
else if ($where_am_i === 'in_calendar_properties') {
		$htm['box'] 	= '<section';  // the whole bunch of properties
		$htm['boxc'] 	= '</section>'.AMR_NL;  ;
		$r   	= '<header><h2';  // the row of properties
		$rc  	= '</h2></header> ';
		$d 		='';  // each cell or column of properties as specified by the listtype
		$dc 	='';   
}
?>