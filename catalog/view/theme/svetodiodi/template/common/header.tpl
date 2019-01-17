<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title;  ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta property="og:title" content="<?php echo $title; ?>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<?php echo $og_url; ?>" />
<?php if ($og_image) { ?>
<meta property="og:image" content="<?php echo $og_image; ?>" />
<?php } else { ?>
<meta property="og:image" content="<?php echo $logo; ?>" />
<?php } ?>
<meta property="og:site_name" content="<?php echo $name; ?>" />
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
<link href="catalog/view/theme/svetodiodi/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCI7R55xO_ffkQ1ofVuKnY1TRI92i_mAwM"></script>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body class="<?php echo $class; ?>">
<div id="modal-overlay" onclick="javascript:removeModal();"></div>
<div id="info-modal" class="modal-dialog">
    <div class="form-wrapper">
        <span class="close-button" onclick="javascript:toggleInfoModal(false);">
            <svg width="30" height="30">
                <line x1="0" y1="0" x2="20" y2="20" stroke="#000000" stroke-width="2" />
                <line x1="0" y1="20" x2="20" y2="0" stroke="#000000" stroke-width="2" />
            </svg>
        </span>
        <h3 class="information-message"></h3>
    </div>
</div>
<script type="text/javascript">
    function toggleInfoModal(turnOn = true, message = '', modal_type = 'info'){
        var modal_container = $('#info-modal');
        var form_wrapper = modal_container.find('.form-wrapper');
        var info_message_container = modal_container.find('.information-message');
        
        form_wrapper.addClass(modal_type);
        info_message_container.html(message);
        
        if (turnOn) {
            $('#modal-overlay').addClass('active');
            $('#info-modal').addClass('active');
            $(window).on('mousewheel', function(){
                return false;
            });
        } else {
            $('#modal-overlay').removeClass('active');
            $('#info-modal').removeClass('active');
            $(window).off('mousewheel');
        }
    }
</script>
<div id="login-modal" class="modal-dialog">
    <div class="form-wrapper">
        <span class="close-button" onclick="javascript:toggleLoginModal(false);">
            <svg width="30" height="30">
                <line x1="0" y1="0" x2="20" y2="20" stroke="#000000" stroke-width="2" />
                <line x1="0" y1="20" x2="20" y2="0" stroke="#000000" stroke-width="2" />
            </svg>
        </span>
        <form action="<?php echo $login; ?>" method="POST" enctype="multipart/form-data">
            <h3 class="form-heading"><?php echo $text_enter; ?></h3>
            <div class="inputs-wrapper">
                <input type="text" name="email" class="login" value="" placeholder="<?php echo $text_login; ?>" />
                <input type="password" name="password" class="password" value="" placeholder="<?php echo $text_password; ?>" />
            </div>
            <span class="need-registration-text"><?php echo $text_need_registration; ?>&nbsp;<a href="<?php echo $register; ?>" class="registration"><?php echo $text_registration; ?></a></span>
            <a class="submit button" onclick="javascript:$(this).closest('form').submit();"><?php echo $text_enter; ?></a>
        </form>
    </div>
</div>
<div id="call-modal" class="modal-dialog">
    <div class="form-wrapper">
        <span class="close-button" onclick="javascript:toggleCallModal(false);">
            <svg width="30" height="30">
                <line x1="0" y1="0" x2="20" y2="20" stroke="#000000" stroke-width="2" />
                <line x1="0" y1="20" x2="20" y2="0" stroke="#000000" stroke-width="2" />
            </svg>
        </span>
        <form id="send-call-request-form" action="" method="POST" enctype="multipart/form-data">
            <h3 class="form-heading"><?php echo $text_make_order; ?></h3>
            <span class="error"></span>
            <div class="inputs-wrapper">
                <input type="text" name="name" class="name" value="" placeholder="<?php echo $entry_name; ?>" />
                <input type="email" name="email" class="email" value="" placeholder="<?php echo $entry_email; ?>" />
                <input type="tel" name="telephone" class="telephone" value="" placeholder="<?php echo $entry_telephone; ?>" />
            </div>
            <a class="submit button" onclick="javascript:sendCallRequest();"><?php echo $text_send; ?></a>
        </form>
        <script type="text/javascript">
            function sendCallRequest(){
                $.ajax({
                    url: '<?php echo $send_call_request; ?>',
                    method: 'POST',
                    enctype: 'multipart/form-data',
                    data: $('#send-call-request-form').serialize(),
                    success: function(response_data){
                        var response_data = JSON.parse(response_data);
                        var error_container = $('#send-call-request-form .error');
                        
                        if(response_data.error){
                            error_container.html(response_data.error);
                            error_container.addClass('active');
                        } else {
                            if (error_container.hasClass('active')){
                                error_container.removeClass('active');
                                error_container.html('');
                            }
                            
                            toggleCallModal(false);
                            toggleInfoModal(true, response_data.info, response_data.status);
                        }
                    },
                    error: function(xhr){
                        console.log("Error: ", xhr);
                    }
                });
            }
        </script>
    </div>
</div>
<header>
    <div class="container">
        <div class="logo left-side col-md-3">
            <?php if ($logo) { ?>
                <?php if ($home == $og_url) { ?>
                  <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
                <?php } else { ?>
                  <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
                <?php } ?>
            <?php } else { ?>
                <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
            <?php } ?>
            <div class="header-categories-menu">
                <span class="header-categories-menu-toggle"><?php echo $text_categories; ?></span>
                <div class="header-categories-menu-list"><?php echo $header_categories_menu; ?></div>
            </div>
        </div>
        <div class="right-side">
            <div class="inner-wrapper">
                <div class="market-info">
                    <p class="short-market-description">Федеральный поставщик<br /> светодиодного оборудования</p>
                    <div class="phones">
                      <div class="phones-inner-wrapper">
                        <span class="phone-icon">
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="27" height="24" viewBox="0 0 27 24">
                              <image class="telephone" width="27" height="24" xlink:href="data:img/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAYCAMAAAA8nnbJAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAA7VBMVEUAAAAjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEVwxobz+vV7y49yx4eBzZW95cf////X7933/PhtxYTf8uTh8+WEz5eL0Z0kqEaw4L0mqUex4L3w+fN8y5Cw4LyGz5lxx4eCzpXe8uP4/PkAAACirhxwAAAAM3RSTlMAae/u3t2EEOr5I5GqKvv+OLnEUFIH2tkFeGwY8w6ghjf2HcWiHveID+tu21MBOiusJPqA43/iAAAAAWJLR0QAiAUdSAAAAAlwSFlzAAALEgAACxIB0t1+/AAAAQFJREFUKM9t0mtbAUEUB/DjshFlQ0SE2iIJMS7rINfS9ft/nebWOjOcV//Z3/PszJw5ALJCjLFwRFTUcZwTIBWLM1qnCWJJZtbZns5TlrkXgaWZXZl/yrLDulSUy8vVYDgidlWQVpSLsT9BiteCSmWZp+hPhsTiN9wqKs8Q/TndsQpQc1V8RVwYp7m9A0/HJSKuDKzAvU7rjY0ePNR13L5JnL/vdG9qAA1GccGvstO/BHhsGsivMhOLcklc8CnYYfsh8PNL5KLsS6EV4Pr753c6FqmVUw19PtLrrH6HtndA6eD9Oq5Fqe7+4V8sS5J56fUNasbooFX55EXlDIa5hdTHP14fX4e+o2ldAAAAAElFTkSuQmCC"/>
                            </svg>
                        </span>
                        <a class="phone-number phone-number-1"><?php echo $telephone_1; ?></a>
                        <span class="phone-separator">/</span>
                        <a class="phone-number phone-number-2"><?php echo $telephone_2; ?></a>
                      </div>
                      <?php if(!$logged){ ?>
                      <a class="request-call" onclick="javascript:toggleCallModal();">Заказать звонок</a>
                      <?php } ?>
                    </div>
                </div>
                <div class="user-area">
                    <?php if ($logged) { ?>
                    <div class="cart">
                        <a class="cart-link" href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>">
                            <img class="cart-icon" src="catalog/view/theme/svetodiodi/image/theme_images/cart.png" />
                            <span class="cart-products-count"><?php echo $cart_products_count; ?></span>
                        </a>
                    </div>
                    <div class="personal-cabinet">
                        <a class="cabinet-link" href="<?php echo $logout; ?>">
                            <img src="catalog/view/theme/svetodiodi/image/theme_images/personal_cabinet_active.png" />
                        </a>
                        <div class="user-informations">
                            <div class="inner-wrapper">
                                <a href="<?php echo $my_orders; ?>" class="informations-item"><?php echo $text_my_orders; ?></a>
                                <span class="informations-separator"></span>
                                <a href="<?php echo $personal_data; ?>" class="informations-item"><?php echo $text_personal_data; ?></a>
                            </div>
                        </div>
                    </div>
                    <?php } else { ?>
                    <div class="personal-cabinet">
                        <a class="cabinet-link" onclick="javascript:toggleLoginModal();">
                            <img src="catalog/view/theme/svetodiodi/image/theme_images/personal_cabinet_inactive.png" />
                        </a>
                    </div>
                    <?php } ?>
                </div>
            </div>
            <div class="inner-outline"></div>
        </div>
    </div>
    <div id="top-menu" class="top-menu">
        <div class="container">
            <div class="menu-wrapper">
                <ul>
                <?php foreach($top_menu as $menu_item) { ?>    
                    <li>
                        <a href="<?php echo $menu_item['href']; ?>"><?php echo $menu_item['name']; ?></a>
                    </li>
                <?php } ?>
                </ul>
                <div class="background-left"></div>
                <div class="background-right"></div>
            </div>
        </div>
    </div>
</header>
<script type="text/javascript">
    function toggleLoginModal(turnOn = true) {
        if (turnOn) {
            $('#modal-overlay').addClass('active');
            $('#login-modal').addClass('active');
            $(window).on('mousewheel', function(){
                return false;
            });
        } else {
            $('#modal-overlay').removeClass('active');
            $('#login-modal').removeClass('active');
            $(window).off('mousewheel');
        }
    }
</script>
<script type="text/javascript">
    function toggleCallModal(turnOn = true) {
        if (turnOn) {
            $('#modal-overlay').addClass('active');
            $('#call-modal').addClass('active');
            $(window).on('mousewheel', function(){
                return false;
            });
        } else {
            $('#modal-overlay').removeClass('active');
            $('#call-modal').removeClass('active');
            $(window).off('mousewheel');
        }
    }
</script>
<script type="text/javascript">
    function removeModal() {
        $('#modal-overlay').removeClass('active');
        $('.modal-dialog').removeClass('active');
        $(window).off('mousewheel');
    }
</script>
