<div class="html-module">
  <?php if($heading_title) { ?>
  <div class="heading-title-wrapper">
    <div class="container container-row row">
      <h2>
          <?php echo $heading_title; ?>
          <div class="leftside"></div>
          <div class="rightside"></div>
      </h2>
    </div>
  </div>
  <?php } ?>
  <div class="container content-wrapper">
    <?php echo $html; ?>
  </div>
</div>
