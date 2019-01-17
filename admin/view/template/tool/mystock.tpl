<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right"></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-exchange"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
          <!-- a class="button" onclick="javascript:checkMyStockData();">Послать запрос на Мой Склад</a -->
          <?php if(isset($mystock_data)) { ?>
          <a class="button" href="<?php echo $mystock_data; ?>">Послать запрос на Мой Склад</a>
          <?php } ?>
          <div id="result-container"></div>
          <?php if(isset($mystock_data)){ ?>
          <div class="mystock-data">
              test
          </div>
          <?php } ?>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
<script type="text/javascript">
    function checkMyStockData(){
        var result_container = $('#result-container');
        
        $.ajax({
            url: '<?php echo $get_mystock_data; ?>',
            method: 'POST',
            enctype: 'multipart/form-data',
            data: {
                testvar: 1
            },
            success: function(response_data){
                console.log("Scs: ", response_data);
            },
            error: function(xhr) {
                console.log("Error: ", xhr);
            }
        });
    }
</script>
