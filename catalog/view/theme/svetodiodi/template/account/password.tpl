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
      <div class="sub-heading"><?php echo $text_password; ?></div>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
          <div class="inputs-wrapper">
            <div class="form-input required">
              <label class="" for="input-password"><?php echo $entry_password; ?></label>
              <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="" />
              <?php if ($error_password) { ?>
                <div class="text-danger"><?php echo $error_password; ?></div>
              <?php } ?>
            </div>
            <div class="form-input required">
              <label class="" for="input-confirm"><?php echo $entry_confirm; ?></label>
              <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="" />
              <?php if ($error_confirm) { ?>
                <div class="text-danger"><?php echo $error_confirm; ?></div>
              <?php } ?>
            </div>
          </div>
        <div class="buttons clearfix">
          <div class="pull-left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a></div>
          <div class="pull-right">
            <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
          </div>
        </div>
      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>