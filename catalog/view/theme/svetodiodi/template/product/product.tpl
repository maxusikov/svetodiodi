<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
</div>
<div class="page-heading-wrapper">
    <div class="leftside"></div>
    <div class="container">
        <div class="page-heading"><?php echo $heading_title; ?></div>
    </div>
    <div class="rightside"></div>
</div>
<div id="product-page" class="container">
  <div class="container-row row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="product-data-wrapper content-row row">
        <?php if ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-8'; ?>
        <?php } ?>
        <div id="product-images" class="<?php echo $class; ?> product-images">
          <?php if ($product_images) { ?>
          
          <div class="preview-area">
            <ul class="preview-images-list">
                <?php foreach ($product_images as $product_image) { ?>
                <li class="preview-images-list-item">
                    <img src="<?php echo $product_image['image']; ?>" />
                </li>
                <?php } ?>
            </ul>
            <div class="controls">
                <span class="arrow arrow-left" onclick="javascript:toggleImage(false);">
                    <span class="arrow-figure"></span>
                </span>
                <span class="arrow arrow-right" onclick="javascript:toggleImage(true);">
                    <span class="arrow-figure"></span>
                </span>
            </div>
          </div>
          <div class="thumbs-area">
              <div class="thumbs-visible-wrapper">
                  <div class="thumbs-list-wrapper">
                      <ul class="thumbs-list">
                        <?php foreach ($product_images as $key => $product_image) { ?>
                          <li class="thumbs-list-item">
                              <a onclick="javascript:goToProductImage(<?php echo $key; ?>);">
                                  <span class="border-overlay"></span>
                                  <img src="<?php echo $product_image['image']; ?>" />
                              </a>
                          </li>
                        <?php } ?>
                      </ul>
                  </div>
              </div>
          </div>
          <script type="text/javascript">
            $(document).ready(function () {
                var preview_images_list = $('#product-images .preview-images-list .preview-images-list-item');
                var thumbs_images_list = $('#product-images .thumbs-list .thumbs-list-item');
                
                $(preview_images_list[0]).addClass('active');
                $(thumbs_images_list[0]).addClass('active');
                
            });
            
            function goToProductImage(image_number) {
                var preview_images_list = $('#product-images .preview-images-list .preview-images-list-item');
                var thumbs_images_list = $('#product-images .thumbs-list .thumbs-list-item');
            
                preview_images_list.removeClass('active').eq([image_number]).addClass('active');
                thumbs_images_list.removeClass('active').eq([image_number]).addClass('active');
                
                //
                var thumbs_images_container = $('#product-images .thumbs-list');
                var offset_between_images = parseInt($(thumbs_images_list[1]).css("marginLeft"));
                var thumb_image_width = parseInt($(thumbs_images_list[1]).width());
                var visible_container_width = parseInt($('#product-images .thumbs-visible-wrapper').width());
                
                var container_position = parseInt($(thumbs_images_container[0]).css("left"));
                var x_axis_target_image_center_position = container_position + parseInt(thumbs_images_list.eq([image_number]).position().left) + thumb_image_width / 2;
                
                if (x_axis_target_image_center_position > visible_container_width) {
                    thumbs_images_container.css("left", container_position - (thumb_image_width + offset_between_images));
                } else if (x_axis_target_image_center_position < 0) {
                    thumbs_images_container.css("left", container_position + (thumb_image_width + offset_between_images));
                }
            }
            
            function toggleImage(next=true) {
                var preview_images_list = $('#product-images .preview-images-list .preview-images-list-item');
                var thumbs_images_list = $('#product-images .thumbs-list .thumbs-list-item');
                
                var currentIndex = $('#product-images .thumbs-list .thumbs-list-item.active').index();
                
                if (next) {
                    if (currentIndex < (thumbs_images_list.length - 1))  {
                        currentIndex++;
                        goToProductImage(currentIndex);
                    } else {
                        return false;
                    }
                } else {
                    if (currentIndex > 0)  {
                        currentIndex--;
                        goToProductImage(currentIndex);
                    } else {
                        return false;
                    }
                }
            }
          </script>
          <?php } ?>
        </div>
        <?php if ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-4'; ?>
        <?php } ?>
        
        <div class="<?php echo $class; ?> product-info">
          <div class="product-order-wrapper">
            <?php if ($logged) { ?>
            <div id="product" class="add-to-cart-area">
                <div class="price"><?php echo $price; ?></div>
                <div class="quantity">
                    <a class="minus" onclick="javascript:changeOrderProductQuantity(false);">-</a>
                    <span class="number">1</span>
                    <a class="plus" onclick="javascript:changeOrderProductQuantity(true);">+</a>
                </div>
                <input type="hidden" name="quantity" value="1" />
                <input type="hidden" name="available_quantity" value="<?php echo $available_quantity; ?>" />
                <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                <a id="button-cart" class="add-to-cart button" onclick=""><?php echo $text_add_to_cart; ?></a>
            </div>
            <span class="separator"></span>
            <span class="available-quantity"><?php echo $text_available_quantity; ?></span>
            <?php } else { ?>
            <div class="add-to-cart-area">
                <a class="request-price button" onclick="javascript:toggleLoginModal();"><?php echo $text_request_price; ?></a>
            </div>
            <?php } ?>
          </div>
          <div class="characteristics">
            <h3 class="characteristics-heading"><?php echo $text_characteristics; ?></h3>
            <span class="artikul"><?php echo $artikul; ?></span>
              <?php if ($product_characteristics) { ?>
                <div class="characteristics-list">
                <?php foreach ($product_characteristics as $characteristic) { ?>
                    <div class="characteristics-list-item">
                      <span class="characteristic-name"><?php echo $characteristic['name']; ?></span>
                      <span class="gap"></span>
                      <span class="characteristic-text"><?php echo $characteristic['text']; ?></span>
                    </div>
                <?php } ?>
                </div>
              <?php } ?>
          </div>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

<script type="text/javascript">
function changeOrderProductQuantity(increase = true) {
    var product_data_container = $('#product');
    var quantity_indicator = product_data_container.find('.quantity .number');
    var quantity_storage = product_data_container.find('input[name=\"quantity\"]');
    var quantity = parseInt(quantity_storage.val());
    var available_quantity = parseInt(product_data_container.find('input[name=\"available_quantity\"]').val());
    
    if (increase) {
        if (quantity < available_quantity) {
            quantity++;
            quantity_storage.val(quantity);
            quantity_indicator.html(quantity);
        } else {
            return false;
        }
    } else {
        if (quantity > 1) {
            quantity--;
            quantity_storage.val(quantity);
            quantity_indicator.html(quantity);
        } else {
            return false;
        }
    }
}
</script>

<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
        console.log("Test: ");
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function(data) {
                        var x = $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea');
                        console.log('x: ', x);
                        $('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').val(json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
    grecaptcha.reset();
});

$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});

$(document).ready(function() {
	var hash = window.location.hash;
	if (hash) {
		var hashpart = hash.split('#');
		var  vals = hashpart[1].split('-');
		for (i=0; i<vals.length; i++) {
			$('#product').find('select option[value="'+vals[i]+'"]').attr('selected', true).trigger('select');
			$('#product').find('input[type="radio"][value="'+vals[i]+'"]').attr('checked', true).trigger('click');
			$('#product').find('input[type="checkbox"][value="'+vals[i]+'"]').attr('checked', true).trigger('click');
		}
	}
})
//--></script>
<?php echo $footer; ?>
