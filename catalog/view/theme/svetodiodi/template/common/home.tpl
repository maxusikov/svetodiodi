<?php echo $header; ?>
<div class="container content-container">
  <div class="container-row row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
        <?php echo $content_top; ?>
    </div>
    <?php echo $column_right; ?>
  </div>
  <div class="container-row">
    <?php echo $categories_component; ?>
  </div>
</div>
<div id="content-bottom" class="container-row">
  <?php echo $content_bottom; ?>
</div>
<div class="left-uzor">
    <img src="catalog/view/theme/svetodiodi/image/theme_images/uzor2.png" />
</div>
<?php echo $footer; ?>