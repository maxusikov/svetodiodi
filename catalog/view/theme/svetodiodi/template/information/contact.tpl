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
  <div class="container-row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="content-wrapper">
          <div class="contacts">
              <div class="telephones">
                  <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="27" height="24" viewBox="0 0 27 24">
                    <image class="telephone" width="27" height="24" xlink:href="data:img/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAYCAMAAAA8nnbJAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAA7VBMVEUAAAAjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEVwxobz+vV7y49yx4eBzZW95cf////X7933/PhtxYTf8uTh8+WEz5eL0Z0kqEaw4L0mqUex4L3w+fN8y5Cw4LyGz5lxx4eCzpXe8uP4/PkAAACirhxwAAAAM3RSTlMAae/u3t2EEOr5I5GqKvv+OLnEUFIH2tkFeGwY8w6ghjf2HcWiHveID+tu21MBOiusJPqA43/iAAAAAWJLR0QAiAUdSAAAAAlwSFlzAAALEgAACxIB0t1+/AAAAQFJREFUKM9t0mtbAUEUB/DjshFlQ0SE2iIJMS7rINfS9ft/nebWOjOcV//Z3/PszJw5ALJCjLFwRFTUcZwTIBWLM1qnCWJJZtbZns5TlrkXgaWZXZl/yrLDulSUy8vVYDgidlWQVpSLsT9BiteCSmWZp+hPhsTiN9wqKs8Q/TndsQpQc1V8RVwYp7m9A0/HJSKuDKzAvU7rjY0ePNR13L5JnL/vdG9qAA1GccGvstO/BHhsGsivMhOLcklc8CnYYfsh8PNL5KLsS6EV4Pr753c6FqmVUw19PtLrrH6HtndA6eD9Oq5Fqe7+4V8sS5J56fUNasbooFX55EXlDIa5hdTHP14fX4e+o2ldAAAAAElFTkSuQmCC"/>
                  </svg>
                  <span class="telephone"><?php echo $telephone; ?><span class="greentext">&nbsp;/&nbsp;</span><?php echo $telephone_2; ?></span>
              </div>
              <div class="email">
                  <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="27" height="24" viewBox="0 0 27 24">
                    <image class="close-envelope_2_" data-name="close-envelope (2)" width="27" height="24" xlink:href="data:img/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAYCAMAAAA8nnbJAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAA51BMVEUAAAAjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEV8y5D////D58x5yo76/fvD583Y8N5qxIHv+fHp9uxmw37e8uP1+/ZsxYPK6tL9/v6I0Jqv37v0+/Z4yYyR1KJ2yYvl9el0yIru+PBzyInQ7dh+zJL5/fp9y5EAAAANigQgAAAALXRSTlMAae/u3t2EEOr5I5GqKvv+OLnEUFIH2tkFeGwY8w6ghjf2HcWiHveID+tu2yskvU+mAAAAAWJLR0QAiAUdSAAAAAlwSFlzAAALEgAACxIB0t1+/AAAARBJREFUKM9t0mlTwkAMBuCAlFvKqSCICF6I2whylXKJKKD///+42bRlKX0/7eSZ2dlNAqASEUJELygxwzDioCWRFHpSac0y4jTZI13mAmbmfSuIYIoelcR5ykyVqxC7riqr0dlCLZYs3BDVG2Tv/YEng/6HLCRvpTXVHTgcjZnGoyFS5Q6gZbLhZGoT2dMJKrtvQ0e4hjNnjjh3ZsgmmvDg22LprFbOcuFZBx6fXFt/2rjZoP21ZjNbAM9s22/3LT+7LfKVAC9dOu0P/h9+rb0sNOr0wVeyg/73P1moqb5UeyE961W4oeUQK3mDKJ5RwZ9f3gxQ7u04+GzAMtq+pFMn1E3oixaXmxdTOxiVFuHiPx1PVUrttmL3AAAAAElFTkSuQmCC"/>
                  </svg>
                  <span class="email-address"><?php echo $store_admin_email; ?></span>
              </div>
          </div>
          <div class="locations">
              <div class="addresses">
                <div class="address office-address">
                    <div class="address-wrapper">
                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="27" height="24" viewBox="0 0 27 24">
                          <image class="placeholder_4_" data-name="placeholder (4)" width="27" height="24" xlink:href="data:img/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAYCAMAAAA8nnbJAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAABO1BMVEUAAAAjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUlqUZrxIKv37vH6dC348J8y5Arq0w1r1TM69T////j9OhJt2UkqEbG6M/p9uwxrVFfwHjo9uui2rDP7NaM0p6g2a/2+/c5sVfO7NW65MXY8N6V1aXk9Oiw4Lz9/v5gwHk4sFfj9Ofc8eF+zJL+//7g8+X4/Pmr3rgwrVDs9+9MuGhow3+X1qeo3bXR7dgnqkksrE3e8uNEtWFQumv8/vx5yo6L0Z2448Ow4L0zrlMAAABao2tHAAAALXRSTlMAae/u3t2EEOr5I5GqKvv+OLnEUFIH2tkFeGwY8w6ghjf2HcWiHveID+tu2yskvU+mAAAAAWJLR0QAiAUdSAAAAAlwSFlzAAALEgAACxIB0t1+/AAAASxJREFUKM9dkmdDwkAMhgOyQcpUEEQUF+LhNm4cuHHvvfX//wOvSVpK3w/XvHmuvWsSAJJHKeXtMuXz+/0BcCgYUk6FIw4WVZ2KtVF33MWMhM2Syq2UhdLs61PTM7Nz82wyjLI95BYW0dTSMrneHLE8mZVVZK2tk+8zUaFI8YZONza39LpNPtSvWYkP2EFs7tLbe5wYACgbHO4jHujHIeIRJwaHoCK3PkZsnajTM8RzyZRgWKILfdLl1bVebyRTgZFRjm7v5J6te6lNGWBMtj0Ie7Q/CTBeFfNE6PmFXbFg/uCEsNc3jZrv4vJUl1xN7Mcn4pfEtSwXNGNV/xt/rDBtNSIlifrvn0RJu38Jw9W++GS78TEXizrmJRLuQNWgc9ACevJ8NINezTyc/AevT1rT6BgG6QAAAABJRU5ErkJggg=="/>
                        </svg>
                        <span class="wrapper">
                            <span class="address-heading"><?php echo $text_stock_address; ?></span>
                            <span class="address-text"><?php echo $address; ?></span>
                        </span>
                    </div>
                </div>
                <div class="address stock-address">
                    <div class="address-wrapper">
                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="27" height="24" viewBox="0 0 27 24">
                          <image class="placeholder_4_" data-name="placeholder (4)" width="27" height="24" xlink:href="data:img/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAYCAMAAAA8nnbJAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAABO1BMVEUAAAAjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUlqUZrxIKv37vH6dC348J8y5Arq0w1r1TM69T////j9OhJt2UkqEbG6M/p9uwxrVFfwHjo9uui2rDP7NaM0p6g2a/2+/c5sVfO7NW65MXY8N6V1aXk9Oiw4Lz9/v5gwHk4sFfj9Ofc8eF+zJL+//7g8+X4/Pmr3rgwrVDs9+9MuGhow3+X1qeo3bXR7dgnqkksrE3e8uNEtWFQumv8/vx5yo6L0Z2448Ow4L0zrlMAAABao2tHAAAALXRSTlMAae/u3t2EEOr5I5GqKvv+OLnEUFIH2tkFeGwY8w6ghjf2HcWiHveID+tu2yskvU+mAAAAAWJLR0QAiAUdSAAAAAlwSFlzAAALEgAACxIB0t1+/AAAASxJREFUKM9dkmdDwkAMhgOyQcpUEEQUF+LhNm4cuHHvvfX//wOvSVpK3w/XvHmuvWsSAJJHKeXtMuXz+/0BcCgYUk6FIw4WVZ2KtVF33MWMhM2Syq2UhdLs61PTM7Nz82wyjLI95BYW0dTSMrneHLE8mZVVZK2tk+8zUaFI8YZONza39LpNPtSvWYkP2EFs7tLbe5wYACgbHO4jHujHIeIRJwaHoCK3PkZsnajTM8RzyZRgWKILfdLl1bVebyRTgZFRjm7v5J6te6lNGWBMtj0Ie7Q/CTBeFfNE6PmFXbFg/uCEsNc3jZrv4vJUl1xN7Mcn4pfEtSwXNGNV/xt/rDBtNSIlifrvn0RJu38Jw9W++GS78TEXizrmJRLuQNWgc9ACevJ8NINezTyc/AevT1rT6BgG6QAAAABJRU5ErkJggg=="/>
                        </svg>
                        <span class="wrapper">
                            <span class="address-heading"><?php echo $text_stock_address; ?></span>
                            <span class="address-text"><?php echo $address_stock; ?></span>
                        </span>
                    </div>
                </div>
              </div>
              <div class="geolocations">
                  <div class="address-geolocation">
                    <div id="office-geolocation-map" class="geolocation-map"></div>
                  </div>
                  <div class="address-geolocation">
                    <div id="stock-geolocation-map" class="geolocation-map"></div>
                  </div>
              </div>
          </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
<script type="text/javascript">
    $(document).ready(function(){
        var _officeGeolocation = new google.maps.LatLng(<?php echo $office_geolocation; ?>);
        var _stockGeolocation = new google.maps.LatLng(<?php echo $stock_geolocation; ?>);
        
        // Обязательные опции с которыми будет проинициализированна карта (office)
        var mapOptions = {
            center: _officeGeolocation, // Координаты центра мы берем из переменной _officeGeolocation
            zoom: 8               // Зум по умолчанию. Возможные значения от 0 до 21
        };
        var _officeMap = new google.maps.Map(document.getElementById("office-geolocation-map"), mapOptions);
        
        // Обязательные опции с которыми будет проинициализированна карта (stock)
        var mapOptions = {
            center: _stockGeolocation, // Координаты центра мы берем из переменной _stockGeolocation
            zoom: 8               // Зум по умолчанию. Возможные значения от 0 до 21
        };
        var _stockMap = new google.maps.Map(document.getElementById("stock-geolocation-map"), mapOptions);
    });
</script>