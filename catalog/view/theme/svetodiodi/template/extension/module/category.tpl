<div class="categories-module">
    <ul class="first-level-list">
    <?php foreach ($categories as $key => $category) { ?>
        <?php if ($key != 0) { ?>
        <li class="separator"></li>
        <?php } ?>
        <li class="first-level-item">
            <a href="<?php echo $category['href']; ?>" class=""><?php echo $category['name']; ?></a>
            <?php if ($category['children']) { ?>
            <div class="toggle-slider">
                <div class="toggle">
                    <span class="line"></span>
                    <span class="circle"></span>
                </div>
            </div>
            <ul class="second-level-list">
                <?php foreach ($category['children'] as $child) { ?>
                <li class="second-level-item">
                    <a href="<?php echo $child['href']; ?>" class=""><?php echo $child['name']; ?></a>
                    <span class="hover-indicator"></span>
                </li>
                <?php } ?>
            </ul>
            <?php } ?>
        </li>
    <?php } ?>
    </ul>
</div>
