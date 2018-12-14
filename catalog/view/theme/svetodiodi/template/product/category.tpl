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
<div id="product-category" class="container">
  <div class="container-row row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div id="filter" class="filter">
        <div class="filter-list">
          <div class="filter-item dropdown-list">
            <span class="filter-item-heading">Выбрать серию</span>
            <div class="filter-item-body">
                <ul class="filter-select-list">
                    <li class="selected">
                        <a onclick="javascript:selectDropdownOption($(this), 10);">Standard</a>
                    </li>
                    <li>
                        <a onclick="javascript:selectDropdownOption($(this), 11);">BLACK</a>
                    </li>
                    <li>
                        <a onclick="javascript:selectDropdownOption($(this), 12);">PREMIUM</a>
                    </li>
                    <li>
                        <a onclick="javascript:selectDropdownOption($(this), 13);">ULTRA SLIM</a>
                    </li>
                    <li>
                        <a onclick="javascript:selectDropdownOption($(this), 14);">SUPER SLIM</a>
                    </li>
                </ul>
                <div class="dropdown-arrow">
                    <span class="arrow-figure"></span>
                </div>
            </div>
            <input type="hidden" name="series" value="10" />
          </div>
          <div class="filter-item checkbox">
            <span class="filter-item-heading">Степень защиты</span>
            <div class="filter-item-body">
                <ul class="filter-checkbox-list">
                    <li class="checkbox-item">
                        <a onclick="javascript:toggleCheckboxItem($(this), 1);">
                            <span class="checkbox-mark"></span>
                            <span class="item-label">Открытые IP20</span>
                        </a>
                        <input type="hidden" name="protection_level[1]" value="0" />
                    </li>
                    <li class="checkbox-item">
                        <a onclick="javascript:toggleCheckboxItem($(this), 2);">
                            <span class="checkbox-mark"></span>
                            <span class="item-label">Влагозащищенные IP67</span>
                        </a>
                        <input type="hidden" name="protection_level[2]" value="0" />
                    </li>
                </ul>
            </div>
          </div>
            
          <div class="filter-item dropdown-list">
            <span class="filter-item-heading">Гарантия</span>
            <div class="filter-item-body">
                <ul class="filter-select-list">
                    <li class="selected">
                        <a onclick="javascript:selectDropdownOption($(this), 1);">1 год</a>
                    </li>
                    <li>
                        <a onclick="javascript:selectDropdownOption($(this), 2);">2 года</a>
                    </li>
                </ul>
                <div class="dropdown-arrow">
                    <span class="arrow-figure"></span>
                </div>
            </div>
            <input type="hidden" name="guarantee" value="10" />
          </div>
          <div class="filter-item checkbox">
            <span class="filter-item-heading">Выходное напряжение</span>
            <div class="filter-item-body">
                <ul class="filter-checkbox-list">
                    <li class="checkbox-item">
                        <a onclick="javascript:toggleCheckboxItem($(this), 5);">
                            <span class="checkbox-mark"></span>
                            <span class="item-label">5В</span>
                        </a>
                        <input type="hidden" name="protection_level[5]" value="0" />
                    </li>
                    <li class="checkbox-item">
                        <a onclick="javascript:toggleCheckboxItem($(this), 12);">
                            <span class="checkbox-mark"></span>
                            <span class="item-label">12В</span>
                        </a>
                        <input type="hidden" name="protection_level[12]" value="0" />
                    </li>
                    <li class="checkbox-item">
                        <a onclick="javascript:toggleCheckboxItem($(this), 24);">
                            <span class="checkbox-mark"></span>
                            <span class="item-label">24В</span>
                        </a>
                        <input type="hidden" name="protection_level[24]" value="0" />
                    </li>
                </ul>
            </div>
          </div>
        </div>
      </div>

      <?php if ($category_categories) { ?>
      <div class="category-list">
        <?php foreach (array_chunk($category_categories, 3) as $categories_row) { ?>
          <div class="category-row">
          <?php foreach ($categories_row as $category) { ?>
            <div class="category-item">
              <a href="<?php echo $category['href']; ?>" title="<?php echo $category['name']; ?>">
                <img src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>" />
                <h3 class="category-name"><?php echo $category['name']; ?></h3>
              </a>
              <div class="border-container"></div>
            </div>
          <?php } ?>
          </div>
        <?php } ?>
      </div>
      <?php } else if ($category_products) { ?>
      <div class="product-list">
        <?php foreach (array_chunk($category_products, 2) as $products_row) { ?>
        <div class="product-row">
          <?php foreach ($products_row as $product) { ?>
          <div class="product-item">
            <div class="product-info">
              <div class="product-image">
                <img class="" src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" />
              </div>
              <div class="rightside">
                <a class="product-name" href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>"><?php echo $product['name']; ?></a>
                <div class="product-data">
                    <span class="product-data-item product-artikul">
                      <span class="item-name"><?php echo $text_artikul; ?></span>
                      <span class="item-gap"></span>
                      <span class="item-value"><?php echo $product['sku']; ?></span>
                    </span>
                    <?php foreach ($product['options'] as $option) { ?>
                    <span class="product-data-item product-option">
                      <span class="item-name"><?php echo $option['name']; ?></span>
                      <span class="item-gap"></span>
                      <span class="item-value"><?php echo $option['value']; ?></span>
                    </span>
                    <?php } ?>
                </div>
              </div>
            </div>
              
            <?php if ($logged) { ?>
            <div class="add-to-cart-area product-cart">
                <div class="price"><?php echo $product['price']; ?></div>
                <div class="quantity">
                  <?php if ($product['available_quantity'] > 0) { ?>
                    <span class="availability"><?php echo $text_available; ?></span>
                    <div class="quantity-counter">  
                      <a class="minus" onclick="javascript:changeOrderProductQuantity($(this).closest('.product-cart'), false);">-</a>
                      <span class="number">1</span>
                      <a class="plus" onclick="javascript:changeOrderProductQuantity($(this).closest('.product-cart'), true);">+</a>
                    </div>
                  <?php } else { ?>
                    <span class="availability"><?php echo $text_not_available; ?></span>
                  <?php } ?>
                </div>
                <input type="hidden" name="quantity" value="1" />
                <input type="hidden" name="available_quantity" value="<?php echo $product['available_quantity']; ?>" />
                <input type="hidden" name="product_id" value="<?php echo $product['id']; ?>" />
                <?php if ($product['available_quantity'] > 0) { ?>
                <a class="add-to-cart button button-cart" onclick="javascript:addToCart($(this).closest('.product-cart'));"><?php echo $text_add_to_cart; ?></a>
                <?php } ?>
            </div>
            <?php } else { ?>
            <div class="add-to-cart-area product-cart">
                <a class="request-price button" onclick="javascript:toggleLoginModal();"><?php echo $text_request_price; ?></a>
            </div>
            <?php } ?>
          </div>
          <?php } ?>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>

<script type="text/javascript">
    function toggleCheckboxItem(item_element, item_value) {
        var item = $(item_element).closest('.checkbox-item');
        
        console.log('input[name="protection_level[' + item_value + ']"]');
        
        if (item.hasClass('selected')) {
            item.removeClass('selected');
            item.find('input[type="hidden"]').val(0);
        } else {
            item.addClass('selected');
            item.find('input[type="hidden"]').val(1);
        }
    }
</script>

<script type="text/javascript">
    function selectDropdownOption(option_element, option_value) {
        var o_el = $(option_element);
        var o_el_list = o_el.closest('.filter-select-list');

        if (o_el_list.hasClass('opened')) {
            o_el_list.find('li').removeClass('selected');
            o_el.closest('.dropdown-list').find('input[type="hidden"]').val(option_value);
            o_el.closest('li').addClass('selected');
            o_el_list.removeClass('opened');
            o_el.closest('.filter-item-body').find('.dropdown-arrow').removeClass('active');
        } else {
            o_el_list.addClass('opened');
            o_el.closest('.filter-item-body').find('.dropdown-arrow').addClass('active');
        }
    }
</script>

<script type="text/javascript">
function changeOrderProductQuantity(product_container, increase = true) {
    var product_data_container = $(product_container);
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

<script type="text/javascript">
    function addToCart(product_container) {
        $.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $(product_container).find('input[type=\'text\'], input[type=\'hidden\'], input[type=\'radio\']:checked, input[type=\'checkbox\']:checked, select, textarea'),
		dataType: 'json',
		beforeSend: function(data) {
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
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert"><svg width="16" height="16"><line stroke="#ffffff" stroke-width="3" x1="0" y1="0" x2="16" y2="16"></line><line stroke="#ffffff" stroke-width="3" x1="0" y1="16" x2="16" y2="0"></line></svg></button></div>');

				$('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
    }
</script>
