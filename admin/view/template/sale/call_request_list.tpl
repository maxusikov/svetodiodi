<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="button" id="button-delete" form="form-order" formaction="<?php echo $delete; ?>" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <div class="well call-request-filter">
          <div class="row">
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="input-call-request-id"><?php echo $entry_call_request_id; ?></label>
                <input type="text" name="filter_call_request_id" value="<?php echo $filter_call_request_id; ?>" placeholder="<?php echo $entry_call_request_id; ?>" id="input-call-request-id" class="form-control" />
              </div>
            </div>
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="input-call-request-name"><?php echo $entry_call_request_name; ?></label>
                <input type="text" name="filter_call_request_name" value="<?php echo $filter_call_request_name; ?>" placeholder="<?php echo $entry_call_request_name; ?>" id="input-call-request-name" class="form-control" />
              </div>
            </div>
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="input-call-request-status"><?php echo $entry_call_request_status; ?></label>
                <select name="filter_call_request_status" id="input-call-request-status" class="form-control">
                  <option value="*"></option>
                  <?php if ($filter_call_request_status == '0') { ?>
                  <option value="0" selected="selected"><?php echo $text_missing; ?></option>
                  <?php } else { ?>
                  <option value="0"><?php echo $text_missing; ?></option>
                  <?php } ?>
                  <?php foreach ($call_request_statuses as $call_request_status) { ?>
                  <?php if ($call_request_status['call_request_status_id'] == $filter_call_request_status) { ?>
                  <option value="<?php echo $call_request_status['call_request_status_id']; ?>" selected="selected"><?php echo $call_request_status['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $call_request_status['call_request_status_id']; ?>"><?php echo $call_request_status['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
              </div>
            </div>
              
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="input-call-request-email"><?php echo $entry_call_request_email; ?></label>
                <input type="text" name="filter_call_request_email" value="<?php echo $filter_call_request_email; ?>" placeholder="<?php echo $entry_call_request_email; ?>" id="input-call-request-email" class="form-control" />
              </div>
            </div>
              
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="input-call-request-telephone"><?php echo $entry_call_request_telephone; ?></label>
                <input type="text" name="filter_call_request_telephone" value="<?php echo $filter_call_request_telephone; ?>" placeholder="<?php echo $entry_call_request_telephone; ?>" id="input-call-request-telephone" class="form-control" />
              </div>
            </div>
              
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="input-date-added"><?php echo $entry_date_added; ?></label>
                <div class="input-group date">
                  <input type="text" name="filter_date_added" value="<?php echo $filter_date_added; ?>" placeholder="<?php echo $entry_date_added; ?>" data-date-format="YYYY-MM-DD" id="input-date-added" class="form-control" />
                  <span class="input-group-btn">
                    <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span>
                </div>
              </div>
              <div class="form-group">
                <label class="control-label" for="input-date-modified"><?php echo $entry_date_modified; ?></label>
                <div class="input-group date">
                  <input type="text" name="filter_date_modified" value="<?php echo $filter_date_modified; ?>" placeholder="<?php echo $entry_date_modified; ?>" data-date-format="YYYY-MM-DD" id="input-date-modified" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
              <button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
            </div>
          </div>
        </div>
        <form method="post" action="" enctype="multipart/form-data" id="form-order">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-right"><?php if ($sort == 'cr.call_request_id') { ?>
                    <a href="<?php echo $sort_call_request; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_call_request_id; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_call_request; ?>"><?php echo $column_call_request_id; ?></a>
                    <?php } ?>
                  </td>
                  
                  <td class="text-right"><?php if ($sort == 'cr.name') { ?>
                    <a href="<?php echo $sort_call_request; ?>" class="<?php echo strtolower($call_request); ?>"><?php echo $column_call_request_name; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_call_request; ?>"><?php echo $column_call_request_name; ?></a>
                    <?php } ?>
                  </td>
                  
                  <td class="text-right"><?php if ($sort == 'cr.email') { ?>
                    <a href="<?php echo $sort_call_request; ?>" class="<?php echo strtolower($call_request); ?>"><?php echo $column_call_request_email; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_call_request; ?>"><?php echo $column_call_request_email; ?></a>
                    <?php } ?>
                  </td>
                  
                  <td class="text-right"><?php if ($sort == 'cr.telephone') { ?>
                    <a href="<?php echo $sort_call_request; ?>" class="<?php echo strtolower($call_request); ?>"><?php echo $column_call_request_telephone; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_call_request; ?>"><?php echo $column_call_request_telephone; ?></a>
                    <?php } ?>
                  </td>
                  
                  <td class="text-left"><?php if ($sort == 'call_request_status') { ?>
                    <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($call_request_status); ?>"><?php echo $column_call_request_status; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_status; ?>"><?php echo $column_call_request_status; ?></a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'o.date_added') { ?>
                    <a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_added; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_date_added; ?>"><?php echo $column_date_added; ?></a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'o.date_modified') { ?>
                    <a href="<?php echo $sort_date_modified; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_modified; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_date_modified; ?>"><?php echo $column_date_modified; ?></a>
                    <?php } ?></td>
                  <td class="text-right"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($call_requests) { ?>
                <?php foreach ($call_requests as $call_request) { ?>
                <tr>
                  <td class="text-center"><?php if (in_array($call_request['call_request_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $call_request['call_request_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $call_request['call_request_id']; ?>" />
                    <?php } ?>
                  <td class="text-right"><?php echo $call_request['call_request_id']; ?></td>
                  <td class="text-right"><?php echo $call_request['customer_name']; ?></td>
                  <td class="text-right"><?php echo $call_request['email']; ?></td>
                  <td class="text-right"><?php echo $call_request['telephone']; ?></td>
                  <td class="text-left"><?php echo $call_request['call_request_status']; ?></td>
                  <td class="text-left"><?php echo $call_request['date_added']; ?></td>
                  <td class="text-left"><?php echo $call_request['date_modified']; ?></td>
                  <td class="text-right">
                      <a href="<?php echo $call_request['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a>
                  </td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="9"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <!-- div class="col-sm-6 text-right"><?php echo $results; ?></div -->
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	url = 'index.php?route=sale/order&token=<?php echo $token; ?>';

	var filter_order_id = $('input[name=\'filter_order_id\']').val();

	if (filter_order_id) {
		url += '&filter_order_id=' + encodeURIComponent(filter_order_id);
	}

	var filter_customer = $('input[name=\'filter_customer\']').val();

	if (filter_customer) {
		url += '&filter_customer=' + encodeURIComponent(filter_customer);
	}

	var filter_order_status = $('select[name=\'filter_order_status\']').val();

	if (filter_order_status != '*') {
		url += '&filter_order_status=' + encodeURIComponent(filter_order_status);
	}

	var filter_total = $('input[name=\'filter_total\']').val();

	if (filter_total) {
		url += '&filter_total=' + encodeURIComponent(filter_total);
	}

	var filter_date_added = $('input[name=\'filter_date_added\']').val();

	if (filter_date_added) {
		url += '&filter_date_added=' + encodeURIComponent(filter_date_added);
	}

	var filter_date_modified = $('input[name=\'filter_date_modified\']').val();

	if (filter_date_modified) {
		url += '&filter_date_modified=' + encodeURIComponent(filter_date_modified);
	}

	location = url;
});
//--></script>
  <script type="text/javascript"><!--
$('input[name=\'filter_customer\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=customer/customer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['customer_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'filter_customer\']').val(item['label']);
	}
});
//--></script>
  <script type="text/javascript"><!--
$('input[name^=\'selected\']').on('change', function() {
	$('#button-shipping, #button-invoice').prop('disabled', true);

	var selected = $('input[name^=\'selected\']:checked');

	if (selected.length) {
		$('#button-invoice').prop('disabled', false);
	}

	for (i = 0; i < selected.length; i++) {
		if ($(selected[i]).parent().find('input[name^=\'shipping_code\']').val()) {
			$('#button-shipping').prop('disabled', false);

			break;
		}
	}
});

$('input[name^=\'selected\']:first').trigger('change');

$('#button-delete').on('click', function(e) {
	$('#form-order').attr('action', this.getAttribute('formAction'));

	if (confirm('<?php echo $text_confirm; ?>')) {
		$('#form-order').submit();
	} else {
		return false;
	}
});
//--></script> 
  <script src="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
  <link href="view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
  <script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});
//--></script></div>
<?php echo $footer; ?>