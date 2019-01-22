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
<div class="container content-container">
  <div class="container-row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <?php if ($orders) { ?>
        <h3 class="sub-heading"><?php echo $text_order_list_subheading; ?></h3>
        <div id="orders-form">
            <div class="order-list-heading">
                <span class="order-number"><?php echo $column_order_id; ?></span>
                <span class="order-status"><?php echo $column_status; ?></span>
                <span class="order-shipping"><?php echo $column_shipping; ?></span>
                <span class="order-is-payed"><?php echo $column_is_payed; ?></span>
                <span class="order-total"><?php echo $column_total; ?></span>
            </div>
            <div class="order-list">
              <?php foreach($orders as $order) { ?>
              <div class="order-list-item">
                <span class="order-number order-list-item-item"><?php echo $order['order_id']; ?></span>
                <span class="order-status order-list-item-item"><?php echo $order['status']; ?></span>
                <span class="order-shipping order-list-item-item"><?php echo $order['order_shipping']; ?></span>
                <span class="order-is-payed order-list-item-item"><?php echo $order['order_is_payed']; ?></span>
                <span class="order-total order-list-item-item"><?php echo $order['total']; ?></span>
              </div>
              <?php } ?>
            </div>
        </div>
        <div class="pagination"><?php echo $pagination; ?></div>
      <?php } else { ?>
        <div class="message-area"><?php echo $text_empty; ?></div>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
