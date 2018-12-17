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
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
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
        <div class="form-wrapper">
            <form action="<?php echo $personal_data; ?>" method="post" enctype="multipart/form-data">
                <div class="input-wrapper">
                    <div class="input-column-wrapper">
                        <div class="input-column-heading"><?php echo $text_common_requisites; ?></div>
                        <div class="form-input-unit personal-name">
                            <label for="personal-name" class="label"><?php echo $label_name; ?></label>
                            <input id="personal-name" type="text" name="personal[naming]" value="<?php echo isset($personal['naming']) ? $personal['naming'] : ''; ?>" />
                        </div>
                        <div class="form-input-unit personal-phone">
                            <label for="personal-phone" class="label"><?php echo $label_phone; ?></label>
                            <input id="personal-phone" type="tel" name="personal[phone]" value="<?php echo isset($personal['phone']) ? $personal['phone'] : ''; ?>" />
                        </div>
                        <div class="form-input-unit personal-fax">
                            <label for="personal-fax" class="label"><?php echo $label_fax; ?></label>
                            <input id="personal-fax" type="text" name="personal[fax]" value="<?php echo isset($personal['fax']) ? $personal['fax'] : ''; ?>" />
                        </div>
                        <div class="form-input-unit personal-email">
                            <label for="personal-email" class="label"><?php echo $label_email; ?></label>
                            <input id="personal-email" type="email" name="personal[email]" value="<?php echo isset($personal['email']) ? $personal['email'] : ''; ?>" />
                        </div>
                    </div>
                    <div class="input-column-wrapper">
                        <div class="input-column-heading"><?php echo $text_legal_requisites; ?></div>
                        <div class="form-input-unit personal-kontragent-type">
                            <label for="personal-kontragent-type" class="label"><?php echo $label_kontragent_type; ?></label>
                            <input id="personal-kontragent-type" type="select" name="personal[kontragent_type]" value="<?php echo isset($personal['kontragent_type']) ? $personal['kontragent_type'] : ''; ?>" />
                        </div>
                        <div class="form-input-unit personal-full-name">
                            <label for="personal-full-name" class="label"><?php echo $label_full_name; ?></label>
                            <textarea id="personal-full-name" name="personal[full_naming]"><?php echo isset($personal['full_naming']) ? $personal['full_naming'] : ''; ?></textarea>
                        </div>
                        <div class="form-input-unit personal-legal-address">
                            <label for="personal-legal-address" class="label"><?php echo $label_legal_address; ?></label>
                            <input id="personal-legal-address" type="text" name="personal[legal_address]" value="<?php echo isset($personal['legal_address']) ? $personal['legal_address'] : ''; ?>" />
                        </div>
                        <div class="form-input-unit personal-INN">
                            <label for="personal-INN" class="label"><?php echo $label_INN; ?></label>
                            <input id="personal-INN" type="text" name="personal[INN]" value="<?php echo isset($personal['INN']) ? $personal['INN'] : ''; ?>" />
                        </div>
                        <div class="form-input-unit personal-KPP">
                            <label for="personal-KPP" class="label"><?php echo $label_KPP; ?></label>
                            <input id="personal-KPP" type="text" name="personal[KPP]" value="<?php echo isset($personal['KPP']) ? $personal['KPP'] : ''; ?>" />
                        </div>
                        <div class="form-input-unit personal-OGRN">
                            <label for="personal-OGRN" class="label"><?php echo $label_OGRN; ?></label>
                            <input id="personal-OGRN" type="text" name="personal[OGRN]" value="<?php echo isset($personal['OGRN']) ? $personal['OGRN'] : ''; ?>" />
                        </div>
                        <div class="form-input-unit personal-OKPO">
                            <label for="personal-OKPO" class="label"><?php echo $label_OKPO; ?></label>
                            <input id="personal-OKPO" type="text" name="personal[OKPO]" value="<?php echo isset($personal['OKPO']) ? $personal['OKPO'] : ''; ?>" />
                        </div>
                    </div>
                    <div class="input-column-wrapper">
                        <div class="input-column-heading"><?php echo $text_checking_account; ?></div>
                        <div class="form-input-unit personal-BIK">
                            <label for="personal-BIK" class="label"><?php echo $label_BIK; ?></label>
                            <input id="personal-BIK" type="text" name="personal[BIK]" value="<?php echo isset($personal['BIK']) ? $personal['BIK'] : ''; ?>" />
                        </div>
                        <div class="form-input-unit personal-bank">
                            <label for="personal-bank" class="label"><?php echo $label_bank; ?></label>
                            <input id="personal-bank" type="text" name="personal[bank]" value="<?php echo isset($personal['bank']) ? $personal['bank'] : ''; ?>" />
                        </div>
                        <div class="form-input-unit personal-address">
                            <label for="personal-address" class="label"><?php echo $label_address; ?></label>
                            <input id="personal-address" type="text" name="personal[address]" value="<?php echo isset($personal['address']) ? $personal['address'] : ''; ?>" />
                        </div>
                        <div class="form-input-unit personal-correspondent-account">
                            <label for="personal-correspondent-account" class="label"><?php echo $label_correspondent_account; ?></label>
                            <input id="personal-correspondent-account" type="text" name="personal[correspondent_account]" value="<?php echo isset($personal['correspondent_account']) ? $personal['correspondent_account'] : ''; ?>" />
                        </div>
                        <div class="form-input-unit personal-checking-account">
                            <label for="personal-checking-account" class="label"><?php echo $label_checking_account; ?></label>
                            <input id="personal-checking-account" type="text" name="personal[checking_account]" value="<?php echo isset($personal['checking_account']) ? $personal['checking_account'] : ''; ?>" />
                        </div>
                    </div>
                </div>
                <div class="buttons-wrapper">
                    <a class="button submit" onclick="javscript:$(this).closest('form').submit();"><?php echo $text_save_changes; ?></a>
                </div>
            </form>
        </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 