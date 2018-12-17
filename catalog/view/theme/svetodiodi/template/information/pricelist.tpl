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
<div class="container">
  <div class="container-row row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>">
        <div class="content-container">
            <?php if(!$logged) { ?>
            <div class="form-info">
                <span class="registration-proposal-text"><?php echo $text_to_download_you_need; ?>&nbsp;<a class="register-link" href="<?php echo $register; ?>"><?php echo $text_register; ?></a></span>
                <span class="fill-contact-form-text"><?php echo $text_send_contacts; ?></span>
            </div>
            <form action="<?php echo $send_contact_data; ?>" method="POST" enctype="multipart/form-data">
                <div class="inputs-wrapper">
                    <input type="text" name="name" class="name" value="" placeholder="<?php echo $entry_name; ?>" />
                    <input type="email" name="password" class="email" value="" placeholder="<?php echo $entry_email; ?>" />
                    <input type="tel" name="telephone" class="telephone" value="" placeholder="<?php echo $entry_telephone; ?>" />
                </div>
                <a class="submit button" onclick="javascript:$(this).closest('form').submit();"><?php echo $text_send; ?></a>
            </form>
            <?php } else { ?>
            <a class="button download-link" href="<?php echo $download_pricelist; ?>"><img src="/catalog/view/theme/svetodiodi/image/theme_images/download_icon.png" /><?php echo $text_download_pricelist; ?></a>
            <?php } ?>
        </div>
        <?php echo $content_top; ?>
    </div>
    <?php echo $column_right; ?>
  </div>
</div>
<div id="content-bottom" class="container-row">
  <?php echo $content_bottom; ?>
</div>
<div class="left-uzor">
    <img src="catalog/view/theme/svetodiodi/image/theme_images/uzor2.png" />
</div>
<?php echo $footer; ?>