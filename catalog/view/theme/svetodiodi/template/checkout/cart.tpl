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
<div class="container cart-page">
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
          <form action="<?php echo $action; ?>" method="POST" enctype="multipart/form-data">
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
                                  <a class="minus" onclick="javascript:changeOrderProductQuantity($(this).closest('.product-cart'), false);">-</a>
                                  <span class="number"><?php echo $product['quantity']; ?></span>
                                  <a class="plus" onclick="javascript:changeOrderProductQuantity($(this).closest('.product-cart'), true);">+</a>
                                </div>
                              <?php } ?>
                            </div>
                            <input type="hidden" name="quantity" value="<?php echo $product['quantity']; ?>" />
                            <input type="hidden" name="available_quantity" value="<?php echo $product['available_quantity']; ?>" />
                            <input type="hidden" name="product_id" value="<?php echo $product['product_id']; ?>" />
                        </div>
                    </span>
                    <span class="cart-list-item-item product-total"><?php echo $product['total']; ?></span>
                </div>
                <?php } ?>
            </div>
            <div class="bottom-area">
                <div class="area-wrapper">
                    <div class="total">
                        <span class="total-text"><?php echo end($totals)['title']; ?>:</span>
                        <span class="total-value"><?php echo end($totals)['text']; ?></span>
                    </div>
                    <div class="order-button">
                        <a class="button" onclick="javascript:toggleOrderModal();"><?php echo $text_order; ?></a>
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