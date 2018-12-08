<div id="slideshow<?php echo $module; ?>" class="carousel-slideshow">
    <div class="visible-area">
        <ul class="slides-container">
        <?php foreach ($banners as $banner) { ?>
            <li class="item">
                <?php if ($banner['link']) { ?>
                <a href="<?php echo $banner['link']; ?>">
                    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
                </a>
                <?php } else { ?>
                <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" />
                <?php } ?>
            </li>
        <?php } ?>
        </ul>
    </div>
    <div class="controls">
        <div class="pagination">
            <?php foreach ($banners as $key=>$banner) { ?>
            <a class="hexagon-2 slideshow<?php echo $module; ?>__button_slide_<?php echo $key; ?>"></a>
            <?php } ?>
        </div>
        <div class="direction-arrows">
            <span class="arrow arrow-left"></span>
            <span class="arrow arrow-right"></span>
        </div>
    </div>
</div>

<script type="text/javascript">
    var slideshow<?php echo $module; ?>_current_slide = 0;
    
    $(document).ready(function () {
        var _carousel = $('#slideshow<?php echo $module; ?>');
        var _width   = _carousel.find('.visible-area').width();
        var _height  = _carousel.find('.visible-area').height();
        var _length  = _carousel.find('.visible-area .slides-container .item').length;
        
        _carousel.find('.slides-container .item').each(function(){
            $(this).css('width', _width + 'px');
            $(this).css('height', _height + 'px');
        });
        
        // Init current button
        slideshow_<?php echo $module; ?>_GoToSlide(_carousel, window.slideshow<?php echo $module; ?>_current_slide);
        
        // Init arrows
        _carousel.find('.controls .direction-arrows .arrow-left').click(function(){
            if (window.slideshow<?php echo $module; ?>_current_slide <= 0) {
                window.slideshow<?php echo $module; ?>_current_slide = _length - 1;
            } else {
                window.slideshow<?php echo $module; ?>_current_slide--;
            }
            
            slideshow_<?php echo $module; ?>_GoToSlide(_carousel, window.slideshow<?php echo $module; ?>_current_slide);
        });
        
        _carousel.find('.controls .direction-arrows .arrow-right').click(function(){
            if (window.slideshow<?php echo $module; ?>_current_slide >= _length - 1) {
                window.slideshow<?php echo $module; ?>_current_slide = 0;
            } else {
                window.slideshow<?php echo $module; ?>_current_slide++;
            }
            
            slideshow_<?php echo $module; ?>_GoToSlide(_carousel, window.slideshow<?php echo $module; ?>_current_slide);
        });
        
        // Init pagination buttons
        _carousel.find('.controls .pagination > a').each(function(index, element){
            $(this).click(function(){
                window.slideshow<?php echo $module; ?>_current_slide = index;
                slideshow_<?php echo $module; ?>_GoToSlide(_carousel, window.slideshow<?php echo $module; ?>_current_slide);
            });
        });
        
        // Init autoscroll
        setInterval(function(){
            if (window.slideshow<?php echo $module; ?>_current_slide >= _length - 1) {
                window.slideshow<?php echo $module; ?>_current_slide = 0;
            } else {
                window.slideshow<?php echo $module; ?>_current_slide++;
            }
            
            slideshow_<?php echo $module; ?>_GoToSlide(_carousel, window.slideshow<?php echo $module; ?>_current_slide);
        }, 20000);
    });
    
    function slideshow_<?php echo $module; ?>_GoToSlide(carousel, slideNumber) {
        // Pagination
        carousel.find('.controls .pagination .current').removeClass('current');
        carousel.find('.controls .pagination .slideshow<?php echo $module; ?>__button_slide_' + slideshow<?php echo $module; ?>_current_slide).addClass('current');
        
        // Slide scroll
        var _width = carousel.find('.visible-area').width();
        carousel.find('.slides-container').css('left', 0 - (slideNumber * _width));
    }
</script>
