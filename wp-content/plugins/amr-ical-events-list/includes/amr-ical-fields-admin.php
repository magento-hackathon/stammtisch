<?php
/* field admin */
 
function amr_whats_in_use() {
global $amr_options;

	amr_set_defaults(); // $amr_options will be set, don't fetch other options yet
	$defaults = $amr_options;
	$desc = amr_set_helpful_descriptions ();
	$amr_options = amr_getset_options(false);		
	$inuse = get_option('amr-event-fields-in-use');  // overlay any existing
	// get all fields that have a column
	if (empty($inuse)) 
		$inuse = array();
	
	foreach  ($amr_options['listtypes'] as $i=> $l) { // foreach list
		if (isset($l['compprop'])) {
			foreach ($l['compprop'] as $f => $opt) {
				if (empty($opt['Column'])) {
					if (empty($allfieldsinuse[$f])) 
						$allfieldsinuse[$f] = 0;
				}		
				else
					if (empty($allfieldsinuse[$f])) 
						$allfieldsinuse[$f] = 1;
					else
						$allfieldsinuse[$f] ++;
			}
		}
	}
	// any new defaults ?
	foreach  ($defaults['listtypes'] as $i=> $l) {
		if (isset($l['compprop'])) {
			foreach ($l['compprop'] as $f => $opt) {
				if (!isset($allfieldsinuse[$f]))
					$allfieldsinuse[$f] = 0;
			}
		}
	}
	// check descriptions just in case ? - no also has componemts
/*	foreach  ($desc as $i=> $l) {
		if (empty($allfieldsinuse[$i]))
			$allfieldsinuse[$i] = 0;
	}	
*/
	
	if (!empty($inuse)) { // we already got somethingstored
		foreach  ($inuse as $i=> $l) {
			if (!isset($allfieldsinuse[$i])) // its no longer possible, delete it
				unset($inuse[$i]);	
		}	
	}	
	else $inuse = array(); // no option yet
	
	foreach  ($allfieldsinuse as $i=> $l) { // for all the fields we know about
			if (!isset($inuse[$i])) // is maybe new? - not empty because thats just what we set before
				$inuse[$i] = $allfieldsinuse[$i];	
		}
		
	//	var_dump($inuse);
	array_multisort(array_values($inuse), SORT_DESC, array_keys($inuse), SORT_ASC, $inuse);
	return ($inuse);
}

 
function amrical_choose_fields()  {
	global $amr_options;
	//$nonce = wp_create_nonce('amr-ical-events-list'); /* used for security to verify that any action request comes from this plugin's forms */	

	amrical_admin_heading(__('Choose event and calendar fields ', 'amr-ical-events-list'));
	
	$inuse = amr_whats_in_use();
	$desc = amr_set_helpful_descriptions ();		
	if (isset ($_POST['action']) and ($_POST['action'] == "save")) {
		$nonce = $_REQUEST['_wpnonce'];
		if (! wp_verify_nonce($nonce, 'amr-ical-events-list')) 
			die ("Cancelled due to failed security check");
		/* Validate the input and save */
		if (isset($_POST['reset'])) {
			echo '<div class="updated"><p>';
			_e('Resetting....','amr-ical-events-list');
			delete_option('amr-event-fields-in-use');
			echo '</p></div>';	
			$inuse = amr_whats_in_use();
		}
		/* Validate the input and save */
		else $inuse = amr_ical_validate_fields($inuse);
	}
	
	array_multisort(array_values($inuse), SORT_DESC, array_keys($inuse), SORT_ASC, $inuse);
	//$fields - an array of fields used in a column
 	echo '<p>'.__('Choose a subset of fields to work with:' ).'</p>';
	echo '<div style="columns: 300px 2;">';
	foreach ($inuse as $f => $bool) {
		
		echo '<p><lable><input type="checkbox" name="inuse['.$f.']" ';
		if ($bool) 
			echo ' checked="checked" >';
		else 
			echo '>';
		echo '<b>'.$f.'</b> ('.$bool.'x)';
		if (!empty($desc[$f])) echo ' - <em>'.$desc[$f].'</em>';
		echo '</lable></p>';
	
	}

	amr_ical_submit_buttons (__('Reset','amr-ical-events-list'));

	echo '</div></form></div>';
}	//end amrical_option_page


function amr_ical_validate_fields($inuse)	{
global $amr_options;

	if (isset($_POST['inuse'])) {
		foreach ($inuse as $f => $bool) {
			//echo $f; var_dump($bool);
			if (!empty($bool) and (!isset($_POST['inuse'][$f]))) {
				$inuse[$f] = 0;
				echo 'Unsetting '.$f.'<br />';
				}
		}
		foreach ($_POST['inuse'] as $f => $bool) {
			//echo $f; var_dump($bool);
			if (isset($bool) and (empty($inuse[$f]))) {
				$inuse[$f] = 1;
				echo 'Adding '.$f.'<br />';
				}
		}		
		
		
	}

	echo '<div class="updated"><p>';
	_e('Saving....','amr-ical-events-list');
	update_option('amr-event-fields-in-use', $inuse);
	echo '</p></div>';	
	return($inuse);
	
}	
