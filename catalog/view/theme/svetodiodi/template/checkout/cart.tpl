<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
</div>    
<div class="page-heading-wrapper">
  <div class="container">
      <div class="page-heading">
          <?php echo $heading_title; ?>
          <div class="leftside"></div>
          <div class="rightside"></div>
      </div>
  </div>
</div>
<div class="container content-container cart-page">
  <?php if ($attention) { ?>
  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="container-row row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div id="cart-form">
          <form id="products-form" action="<?php echo $action; ?>" method="POST" enctype="multipart/form-data">
              <div class="cart-list-heading">
                <span class="cart-heading-item product-image"><?php echo $column_image; ?></span>
                <span class="cart-heading-item product-name"><?php echo $column_name; ?></span>
                <span class="cart-heading-item product-sku"><?php echo $column_sku; ?></span>
                <span class="cart-heading-item product-price"><?php echo $column_price; ?></span>
                <span class="cart-heading-item product-quantity"><?php echo $column_quantity; ?></span>
                <span class="cart-heading-item product-total"><?php echo $column_total; ?></span>
            </div>
            <div class="cart-list">
                <?php foreach ($products as $product) { ?>
                <div class="cart-list-item">
                    <span class="cart-list-item-item product-image">
                        <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></span>
                    <span class="cart-list-item-item product-name">
                      <a href="<?php echo $product['href']; ?>">
                        <?php echo $product['name']; ?>
                      </a>
                    </span>
                    <span class="cart-list-item-item product-sku"><?php echo $product['sku']; ?></span>
                    <span class="cart-list-item-item product-price"><?php echo $product['price']; ?></span>
                    <span class="cart-list-item-item product-quantity">
                        <div class="add-to-cart-area product-cart">
                            <div class="quantity">
                              <?php if ($product['available_quantity'] > 0) { ?>
                                <div class="quantity-counter">
                                  <a class="minus" onclick="javascript:changeOrderProductQuantity($(this).closest('.cart-list-item'), <?php echo $product['product_id']; ?>, false);">-</a>
                                  <span class="number"><?php echo $product['quantity']; ?></span>
                                  <a class="plus" onclick="javascript:changeOrderProductQuantity($(this).closest('.cart-list-item'), <?php echo $product['product_id']; ?>, true);">+</a>
                                </div>
                              <?php } ?>
                            </div>
                            <input class="product-quantity" type="hidden" name="product[<?php echo $product['product_id']; ?>][quantity]" value="<?php echo $product['quantity']; ?>" />
                            <input class="product-available-quantity" type="hidden" name="product[<?php echo $product['product_id']; ?>][available_quantity]" value="<?php echo $product['available_quantity']; ?>" />
                            <input class="product-id" type="hidden" name="product[<?php echo $product['product_id']; ?>][product_id]" value="<?php echo $product['product_id']; ?>" />
                        </div>
                    </span>
                    <span class="cart-list-item-item product-total"><?php echo $product['total']; ?></span>
                    <span class="cart-list-item-item remove-button">
                        <a onclick="javascript:removeProductFromCart($(this).closest('.cart-list-item'), <?php echo $product['cart_id']; ?>);">
                            <svg viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <line x1="0" y1="0" x2="20" y2="20" stroke="#000000" />
                                <line x1="0" y1="20" x2="20" y2="0" stroke="#000000" />
                            </svg>
                        </a>
                    </span>
                </div>
                <?php } ?>
            </div>
            <div class="bottom-area">
                <div class="area-wrapper">
                    <div id="total" class="total">
                        <span class="total-text"><?php echo end($totals)['title']; ?>:</span>
                        <span class="total-value"><?php echo end($totals)['text']; ?></span>
                    </div>
                    <div class="order-button">
                        <a class="button" onclick="javascript:sendOrder();"><?php echo $text_order; ?></a>
                    </div>
                </div>
            </div>
          </form>
      </div>
      
      <?php echo $content_bottom; ?></div>
      <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>

<script type="text/javascript">
function changeOrderProductQuantity(product_container, product_id, increase = true) {
    var product_data_container = $(product_container);
    var quantity_indicator = product_data_container.find('.quantity .number');
    var product_total_value_container = product_data_container.find('.product-total');
    var total_value_container = $('#total .total-value');
    var ind;
    
    if(increase){
        ind = '+';
    } else {
        ind = '-';
    }
    
    $.ajax({
        url: '<?php echo $change_cart_product_quantity ?>',
        method: 'POST',
        data: {
            product_id: product_id,
            indicator: ind
        },
        success: function(response_data){
            if(response_data.status == 'success'){
                quantity_indicator.html(response_data.product_cart_info.quantity);
                total_value_container.html(response_data.cart.total);
                product_total_value_container.html(response_data.product_cart_info.total);
            }
        },
        error: function(xhr){
            console.log("Request error: ", xhr);
        }
    });
}
</script>

<script type="text/javascript">
    function removeProductFromCart(product_container, cart_id){
        var prod_container = $(product_container);
        var total_value_container = $('#total .total-value');
        
        $.ajax({
            url: '<?php echo $remove_product_from_cart; ?>',
            method: 'POST',
            data: {
                cart_id: cart_id
            },
            success: function(response_data){
                if(response_data.status == 'success'){
                    $(product_container).remove();
                }
                
                console.log("SS: ", response_data);
            },
            error: function(xhr){
                console.log("Err: ", xhr);
            }
        });
    }
</script>

<script type="text/javascript">
    function sendOrder(){
        var cart_form = $('#cart-form');
        var content_area = $('#content');
    
        $.ajax({
            url: '<?php echo $send_order; ?>',
            method: 'POST',
            data: $('#products-form').serialize(),
            success: function(response_data){
                var response_data = JSON.parse(response_data);
                if(response_data.status == 'success'){
                    $(cart_form).remove();
                    var order_sent_html = $('<h2>Ваш заказ отправлен на обработку. Наш менеджер свяжется с Вами в ближайшее время.</h2>');
                    content_area.append(order_sent_html);
                }
            },
            error: function(xhr){
                console.log("Error data: ", xhr);
            }
        });
    }
</script>