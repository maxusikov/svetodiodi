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
<div class="container">
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
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
        <div class="items-list-wrapper">
            <a class="button" href="<?php echo $personal; ?>"><?php echo $text_personal; ?></a>
            <a class="button" href="<?php echo $password; ?>"><?php echo $text_password; ?></a>
            <a class="button" href="<?php echo $order; ?>"><?php echo $text_order; ?></a>
        </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 