<?php echo $header; ?><?php echo $column_left; ?>
<div id="content" class="call-request-view">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-product" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
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
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_call_request_heading; ?></h3>
      </div>
      <div class="panel-body">
        <form method="post" action="<?php echo $save_call_request_data; ?>" enctype="multipart/form-data" id="form-call-request">
          <input type="hidden" name="action" value="update" />
          <div class="table-responsive">
            <div class="form-group">
              <label class="col-sm-2 control-label" for="customer-name"><?php echo $text_customer_name; ?></label>
              <div class="value-field">
                  <input class="col-sm-10" id="customer-name" type="text" name="customer_name" value="<?php echo $customer_name; ?>" placeholder="" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="customer-email"><?php echo $text_customer_email; ?></label>
              <div class="value-field">
                  <input class="col-sm-10" id="customer-email" type="text" name="customer_email" value="<?php echo $customer_email; ?>" placeholder="" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="customer-telephone"><?php echo $text_customer_telephone; ?></label>
              <div class="value-field">
                  <input class="col-sm-10" id="customer-telephone" type="text" name="customer_telephone" value="<?php echo $customer_telephone; ?>" placeholder="" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="call-request-status"><?php echo $text_call_request_status; ?></label>
              <div class="value-field">
                  <select id="call-request-status" name="call_request_status_id">
                      <option value="0">Выберите статус</option>
                      <?php foreach($call_request_statuses as $request_status){ ?>
                        <?php if($request_status['status_id'] == $call_request_status_id){ ?>
                        <option value="<?php echo $request_status['status_id']; ?>" selected><?php echo $request_status['name']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $request_status['status_id']; ?>"><?php echo $request_status['name']; ?></option>
                        <?php } ?>
                      <?php } ?>
                  </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2" for="call-request-comment"><?php echo $text_call_request_comment; ?></label>
              <div class="value-field">
                  <textarea class="col-sm-10" id="call-request-comment" name="comment"><?php echo $call_request_comment; ?></textarea>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2"><?php echo $text_call_request_date_added; ?></label>
              <div class="value-field">
                  <span class=""><?php echo $call_request_date_added; ?></span>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2"><?php echo $text_call_request_date_modified; ?></label>
              <div class="value-field">
                  <span class=""><?php echo $call_request_date_modified; ?></span>
              </div>
            </div>
          </div>
        </form>
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

$('#button-shipping, #button-invoice').prop('disabled', true);

$('input[name^=\'selected\']:first').trigger('change');

// IE and Edge fix!
$('#button-shipping, #button-invoice').on('click', function(e) {
	$('#form-order').attr('action', this.getAttribute('formAction'));
});

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