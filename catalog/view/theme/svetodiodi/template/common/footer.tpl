<footer>
  <div class="container">
    <div class="container-row row">
      <?php if ($categories) { ?>
      <div class="categories area">
          <h5 class="area-heading"><?php echo $text_catalog; ?></h5>
          <ul class="area-list">
              <?php foreach ($categories as $category) { ?>
              <li>
                  <a href="<?php echo $category['href']; ?>" title="<?php echo $category['name']; ?>">
                      <?php echo $category['name']; ?>
                  </a>
              </li>
              <?php } ?>
          </ul>
      </div>
      <?php } ?>
      
      <?php if ($useful_informations) { ?>
      <div class="useful-informations area">
          <h5 class="area-heading"><?php echo $text_useful_informations; ?></h5>
          <ul class="area-list">
              <?php foreach ($useful_informations as $information) { ?>
              <li>
                  <a href="<?php echo $information['href']; ?>" title="<?php echo $information['name']; ?>">
                      <?php echo $information['name']; ?>
                  </a>
              </li>
              <?php } ?>
          </ul>
      </div>
      <?php } ?>

      <?php if ($contacts) { ?>
      <div class="contacts area">
          <h5 class="area-heading"><?php echo $text_contacts; ?></h5>
          <ul class="area-list">
              <li class="telephone">
                  <div class="icon">
                      <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="27" height="24" viewBox="0 0 27 24">
                        <image class="telephone" width="27" height="24" xlink:href="data:img/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAYCAMAAAA8nnbJAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAA7VBMVEUAAAAjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEVwxobz+vV7y49yx4eBzZW95cf////X7933/PhtxYTf8uTh8+WEz5eL0Z0kqEaw4L0mqUex4L3w+fN8y5Cw4LyGz5lxx4eCzpXe8uP4/PkAAACirhxwAAAAM3RSTlMAae/u3t2EEOr5I5GqKvv+OLnEUFIH2tkFeGwY8w6ghjf2HcWiHveID+tu21MBOiusJPqA43/iAAAAAWJLR0QAiAUdSAAAAAlwSFlzAAALEgAACxIB0t1+/AAAAQFJREFUKM9t0mtbAUEUB/DjshFlQ0SE2iIJMS7rINfS9ft/nebWOjOcV//Z3/PszJw5ALJCjLFwRFTUcZwTIBWLM1qnCWJJZtbZns5TlrkXgaWZXZl/yrLDulSUy8vVYDgidlWQVpSLsT9BiteCSmWZp+hPhsTiN9wqKs8Q/TndsQpQc1V8RVwYp7m9A0/HJSKuDKzAvU7rjY0ePNR13L5JnL/vdG9qAA1GccGvstO/BHhsGsivMhOLcklc8CnYYfsh8PNL5KLsS6EV4Pr753c6FqmVUw19PtLrrH6HtndA6eD9Oq5Fqe7+4V8sS5J56fUNasbooFX55EXlDIa5hdTHP14fX4e+o2ldAAAAAElFTkSuQmCC"/>
                      </svg>
                  </div>
                  <p class="text"><?php echo $contacts['telephone_1']['number']; ?><span class="separator">/</span><?php echo $contacts['telephone_2']['number']; ?></p>
              </li>
              <li class="email">
                  <div class="icon">
                      <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="27" height="24" viewBox="0 0 27 24">
                        <image class="close-envelope_2_" data-name="close-envelope (2)" width="27" height="24" xlink:href="data:img/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAYCAMAAAA8nnbJAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAA51BMVEUAAAAjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEV8y5D////D58x5yo76/fvD583Y8N5qxIHv+fHp9uxmw37e8uP1+/ZsxYPK6tL9/v6I0Jqv37v0+/Z4yYyR1KJ2yYvl9el0yIru+PBzyInQ7dh+zJL5/fp9y5EAAAANigQgAAAALXRSTlMAae/u3t2EEOr5I5GqKvv+OLnEUFIH2tkFeGwY8w6ghjf2HcWiHveID+tu2yskvU+mAAAAAWJLR0QAiAUdSAAAAAlwSFlzAAALEgAACxIB0t1+/AAAARBJREFUKM9t0mlTwkAMBuCAlFvKqSCICF6I2whylXKJKKD///+42bRlKX0/7eSZ2dlNAqASEUJELygxwzDioCWRFHpSac0y4jTZI13mAmbmfSuIYIoelcR5ykyVqxC7riqr0dlCLZYs3BDVG2Tv/YEng/6HLCRvpTXVHTgcjZnGoyFS5Q6gZbLhZGoT2dMJKrtvQ0e4hjNnjjh3ZsgmmvDg22LprFbOcuFZBx6fXFt/2rjZoP21ZjNbAM9s22/3LT+7LfKVAC9dOu0P/h9+rb0sNOr0wVeyg/73P1moqb5UeyE961W4oeUQK3mDKJ5RwZ9f3gxQ7u04+GzAMtq+pFMn1E3oixaXmxdTOxiVFuHiPx1PVUrttmL3AAAAAElFTkSuQmCC"/>
                      </svg>
                  </div>
                  <p class="text"><?php echo $contacts['email']['address']; ?></p>
              </li>
              <li class="address-office">
                  <div class="icon">
                      <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="27" height="24" viewBox="0 0 27 24">
                        <image class="placeholder_4_" data-name="placeholder (4)" width="27" height="24" xlink:href="data:img/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAYCAMAAAA8nnbJAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAABO1BMVEUAAAAjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUlqUZrxIKv37vH6dC348J8y5Arq0w1r1TM69T////j9OhJt2UkqEbG6M/p9uwxrVFfwHjo9uui2rDP7NaM0p6g2a/2+/c5sVfO7NW65MXY8N6V1aXk9Oiw4Lz9/v5gwHk4sFfj9Ofc8eF+zJL+//7g8+X4/Pmr3rgwrVDs9+9MuGhow3+X1qeo3bXR7dgnqkksrE3e8uNEtWFQumv8/vx5yo6L0Z2448Ow4L0zrlMAAABao2tHAAAALXRSTlMAae/u3t2EEOr5I5GqKvv+OLnEUFIH2tkFeGwY8w6ghjf2HcWiHveID+tu2yskvU+mAAAAAWJLR0QAiAUdSAAAAAlwSFlzAAALEgAACxIB0t1+/AAAASxJREFUKM9dkmdDwkAMhgOyQcpUEEQUF+LhNm4cuHHvvfX//wOvSVpK3w/XvHmuvWsSAJJHKeXtMuXz+/0BcCgYUk6FIw4WVZ2KtVF33MWMhM2Syq2UhdLs61PTM7Nz82wyjLI95BYW0dTSMrneHLE8mZVVZK2tk+8zUaFI8YZONza39LpNPtSvWYkP2EFs7tLbe5wYACgbHO4jHujHIeIRJwaHoCK3PkZsnajTM8RzyZRgWKILfdLl1bVebyRTgZFRjm7v5J6te6lNGWBMtj0Ie7Q/CTBeFfNE6PmFXbFg/uCEsNc3jZrv4vJUl1xN7Mcn4pfEtSwXNGNV/xt/rDBtNSIlifrvn0RJu38Jw9W++GS78TEXizrmJRLuQNWgc9ACevJ8NINezTyc/AevT1rT6BgG6QAAAABJRU5ErkJggg=="/>
                      </svg>
                  </div>
                  <p class="text">
                      <span class="address-heading"><?php echo $text_office_address; ?></span>
                      <?php echo $contacts['address']['office']['address']; ?>
                  </p>
              </li>
              <li class="address-stock">
                  <div class="icon">
                      <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="27" height="24" viewBox="0 0 27 24">
                        <image class="placeholder_4_" data-name="placeholder (4)" width="27" height="24" xlink:href="data:img/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAYCAMAAAA8nnbJAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAABO1BMVEUAAAAjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUlqUZrxIKv37vH6dC348J8y5Arq0w1r1TM69T////j9OhJt2UkqEbG6M/p9uwxrVFfwHjo9uui2rDP7NaM0p6g2a/2+/c5sVfO7NW65MXY8N6V1aXk9Oiw4Lz9/v5gwHk4sFfj9Ofc8eF+zJL+//7g8+X4/Pmr3rgwrVDs9+9MuGhow3+X1qeo3bXR7dgnqkksrE3e8uNEtWFQumv8/vx5yo6L0Z2448Ow4L0zrlMAAABao2tHAAAALXRSTlMAae/u3t2EEOr5I5GqKvv+OLnEUFIH2tkFeGwY8w6ghjf2HcWiHveID+tu2yskvU+mAAAAAWJLR0QAiAUdSAAAAAlwSFlzAAALEgAACxIB0t1+/AAAASxJREFUKM9dkmdDwkAMhgOyQcpUEEQUF+LhNm4cuHHvvfX//wOvSVpK3w/XvHmuvWsSAJJHKeXtMuXz+/0BcCgYUk6FIw4WVZ2KtVF33MWMhM2Syq2UhdLs61PTM7Nz82wyjLI95BYW0dTSMrneHLE8mZVVZK2tk+8zUaFI8YZONza39LpNPtSvWYkP2EFs7tLbe5wYACgbHO4jHujHIeIRJwaHoCK3PkZsnajTM8RzyZRgWKILfdLl1bVebyRTgZFRjm7v5J6te6lNGWBMtj0Ie7Q/CTBeFfNE6PmFXbFg/uCEsNc3jZrv4vJUl1xN7Mcn4pfEtSwXNGNV/xt/rDBtNSIlifrvn0RJu38Jw9W++GS78TEXizrmJRLuQNWgc9ACevJ8NINezTyc/AevT1rT6BgG6QAAAABJRU5ErkJggg=="/>
                      </svg>
                  </div>
                  <p class="text">
                      <span class="address-heading"><?php echo $text_stock_address; ?></span>
                      <?php echo $contacts['address']['stock']['address']; ?>
                  </p>
              </li>
          </ul>
      </div>
      <?php } ?>
    </div>
  </div>
  <div class="right-uzor">
    <img src="catalog/view/theme/svetodiodi/image/theme_images/uzor2.png" />
  </div>
</footer>
</body></html>