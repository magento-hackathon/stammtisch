<?php
global $EM_Event, $post;
$hours_format = em_get_hour_format();
$required = apply_filters('em_required_html','<i>*</i>');
?>
<div class="event-form-when" id="em-form-when">
	<p class="em-date-range">
		<label><?php /** @todo translate */ _e ( 'Datum ', 'dbem' ); ?></label>
		<input class="em-date-start em-date-input-loc" type="text" />
		<input class="em-date-input" type="hidden" name="event_start_date" value="<?php echo $EM_Event->event_start_date ?>" />
        <div style="display: none">
            <?php _e('to','dbem'); ?>
		    <input class="em-date-end em-date-input-loc" type="text" />
		    <input class="em-date-input" type="hidden" name="event_end_date" value="<?php echo $EM_Event->event_end_date ?>" />
        </div>
	</p>
	<p class="em-time-range">
		<label class="em-event-text"><?php /** @todo translate */ _e('Beginn','dbem'); ?></label>
		<input id="start-time" class="em-time-input em-time-start" type="text" size="8" maxlength="8" name="event_start_time" value="<?php echo date( $hours_format, $EM_Event->start ); ?>" />
        <br />
		<label><?php /** @todo translate */ _e('Ende','dbem'); ?></label>
		<input id="end-time" class="em-time-input em-time-end" type="text" size="8" maxlength="8" name="event_end_time" value="<?php echo date( $hours_format, $EM_Event->end ); ?>" />
        <div style="display: none;">
		    <?php _e('All day','dbem'); ?> <input type="checkbox" class="em-time-all-day" name="event_all_day" id="em-time-all-day" value="1" <?php if(!empty($EM_Event->event_all_day)) echo 'checked="checked"'; ?> />
        </div>
	</p>
</div>
<?php if( false && get_option('dbem_recurrence_enabled') && $EM_Event->is_recurrence() ) : //in future, we could enable this and then offer a detach option alongside, which resets the recurrence id and removes the attachment to the recurrence set ?>
<input type="hidden" name="recurrence_id" value="<?php echo $EM_Event->recurrence_id; ?>" />
<?php endif;