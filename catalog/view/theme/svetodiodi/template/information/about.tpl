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
        <?php echo $content_top; ?>
        <div class="slogan">
            <div class="left-side">
                <div class="outer-border">
                    <div class="inner-border">
                        <div class="quotes">
                            <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="46" height="32" viewBox="0 0 46 32">
                              <image id="quotes_1_" data-name="quotes (1)" width="46" height="32" xlink:href="data:img/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC4AAAAgCAMAAABabbp1AAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAABiVBMVEUAAAAjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUjqEUAAAB3EF4RAAAAgXRSTlMAD0yBp8DQGhZYh6/DBlm4/CANasnwA2biCoAwzkvhaPiMAYsfCe+P/rxwNxG3+a1kLwxymZ7zEzzTuhsI3R31fqirEOdXVkASzVVUOngCo/qz2MUhDveq6zFb1hnpn7XXiNI+BPsYoR516iy7FSUu8QWXbcZeif18JLDIOSJ0qcKfXqE6AAAAAWJLR0QAiAUdSAAAAAlwSFlzAAALEgAACxIB0t1+/AAAAa9JREFUOMt1lNVCAkEUQMcWWFtQwe5EsRsDwS4UXRUbO7ET5s+FnZmd9L7tOeeBvTMLANykpKalZ2RmAXmyLVabprEkJzcvHyanQGwLi4oNYafIUVIK8Qh5mdOOBc1d5RCq84pKU5h5VTVU544aRuC8tg6yU0/rBhsrGhFsIs/NLa1t7ezbdxDj7uzydCPYg1F+r7iTPmz6nQMmG0Trg0MecYFduB4eoWx0DLHOBrEe9yJjrWXgBGKTDukkp5CZYNk0OgPfjD8wy9cuVM/NLyyWmXCJ7qlZsywz+Qo1q2sBDNe5lQc3zHozxJktY8EeyM+2TvIdwezuJWCrAGGYXN990ZSPmm/PzAHODyVzBMCxBOGJUZ9GJBE6A41yfm7kF7KAl0ABr4z8WmFuVDm8ZQ6JG58yv0vm9woRAQ8KevHfb39QbSbymMwf5c3AYxCVIf430WQTBQEZPqH8STaJe/YssjD+JLvDonlOUN0tQD+5Y35BuI3b98LDV3rhX3nzgqjFS9HbO/s9vb9R47UQ+vFJ2Nc3//19fxHz+cHgn99YPGhz6kAa3WkLxmO/P+jpDwhBujH8kfg2AAAAAElFTkSuQmCC"/>
                            </svg>
                        </div>
                        <h2 class="heading">Стремимся дать<br />больше!</h2>
                    </div>
                </div>
            </div>
            <div class="right-side">
                <p class="slogan-text">Этот слоган дался мне нелегко. Я долго думал, как уложить в два слова то, чем мы занимаемся, к чему стремимся, и наше отношение к делу. Стремимся дать больше – это значит, что каждый член нашей команды делает все возможное, чтобы нашим партнерам было удобно и приятно с нами сотрудничать, а наша продукция никогда никого не разочаровала. Мы все стремимся дать больше качества, больше сервиса, больше, чем просто деловые отношения…</p>
                <p class="signification">А.В. Демченко, генеральный директор</p>
            </div>
        </div>
        <div class="our-mission">
            <div class="background-overlay">
                <img src="catalog/view/theme/svetodiodi/image/theme_images/our-mission-bg.jpg" />
            </div>
            <h3 class="mission-heading">наша миссия</h3>
            <h4 class="mission-subheading">«Объединить вокруг себя друзей-партнеров<br />для совместного развития компаний»</h4>
            <p class="mission-text">Мы всегда стремимся к долгосрочным взаимовыгодным отношениям с партнерами.
                <br />За 8 лет сотрудничества многие наши клиенты стали нам надежными друзьями.
                <br />Так приятно видеть, как наши компании растут и развиваются вместе!</p>
        </div>
        <div class="delivery">
            <div class="heading-wrapper">
                <h2 class="heading-text"><span class="greentext">Доставим товар</span> в любую точку России.</h2>
                <span class="heading-bottom-line"></span>
            </div>
            <div class="achievements">
                <div class="deliveries achievement">
                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="60" height="43" viewBox="0 0 60 43">
                      <image id="Слой_10" data-name="Слой 10" width="60" height="43" xlink:href="data:img/png;base64,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"/>
                    </svg>
                    <span class="achievement-text">Более 1000 поставок<br />ежемесячно</span>
                </div>
                <div class="customers achievement">
                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="54" height="54" viewBox="0 0 54 54">
                      <image id="Слой_9" data-name="Слой 9" width="54" height="54" xlink:href="data:img/png;base64,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"/>
                    </svg>
                    <span class="achievement-text">Более 1000 постоянных<br />клиентов</span>
                </div>
            </div>
            <div class="russia-map">
                <img src="catalog/view/theme/svetodiodi/image/theme_images/russia_map.png" />
            </div>
        </div>
        <div class="assortiment">
            <div class="heading-wrapper">
                <h2 class="heading-text">В 2018 году ассортимент компании LEDS<span class="greentext">POWER</span><br /> 
достиг 400 наименований.</h2>
                <span class="heading-bottom-line"></span>
            </div>
            <div class="categories">
                <ul class="cat-list left-side">
                    <li>
                        <a class="" href="" title="">Блоки питания 5В, 12В, 24В</a>
                    </li>
                    <li>
                        <a class="" href="" title="">Светодиодная лента 5В, 12В, 24В, 220В</a>
                    </li>
                    <li>
                        <a class="" href="" title="">Светодиодные линейки</a>
                    </li>
                    <li>
                        <a class="" href="" title="">Светодиодные модули</a>
                    </li>
                </ul>
                <ul class="cat-list right-side">
                    <li>
                        <a class="" href="" title="">Светильники</a>
                    </li>
                    <li>
                        <a class="" href="" title="">Контроллеры RGB, диммеры, усилители </a>
                    </li>
                    <li>
                        <a class="" href="" title="">Светодиодные прожекторы</a>
                    </li>
                    <li>
                        <a class="" href="" title="">Алюминиевый профиль</a>
                    </li>
                </ul>
            </div>
        </div>
        
        <div class="collaboration-benefits">
            <div class="heading-wrapper">
                <h2 class="heading-text">ПРЕИМУЩЕСТВА СОТРУДНИЧЕСТВА С НАМИ</h2>
                <span class="heading-bottom-line"></span>
            </div>
            <div class="benefits-wrapper">
                <div class="benefits-inner-wrapper">
                    <div class="hexagon-connectors">
                        <div class="top-line">
                            <div class="top-left connector">
                                <svg width="200" height="200">
                                    <line x1="0" y1="90" x2="200" y2="190" style="stroke:green;stroke-width:3"></line>
                                </svg>
                            </div>
                            <div class="top-right connector">
                                <svg width="200" height="200">
                                    <line x1="0" y1="190" x2="200" y2="90" style="stroke:green;stroke-width:3" />
                                </svg>
                            </div>
                        </div>
                        <div class="bottom-line">
                            <div class="bottom-left connector">
                                <svg width="200" height="200">
                                    <line x1="0" y1="110" x2="200" y2="10" style="stroke:green;stroke-width:3" />
                                </svg>
                            </div>
                            <div class="bottom-right connector">
                                <svg width="200" height="200">
                                    <line x1="0" y1="10" x2="200" y2="110" style="stroke:green;stroke-width:3" />
                                </svg>
                            </div>
                        </div>
                        <div class="bottom-connector connector">
                            <svg width="0" height="400">
                                <line x1="0" y1="0" x2="0" y2="400" style="stroke:green;stroke-width:6" />
                            </svg>
                        </div>
                    </div>
                    <div class="central-hexagon hexagon-big">
                        <img class="logo-2" src="catalog/view/theme/svetodiodi/image/theme_images/logo_2.png" alt="LEDSPOWER" title="LEDSPOWER" />
                        <div class="background-layer"></div>
                    </div>
                    
                    <div class="radial-hexagons-top-wrapper">
                        <div class="radial-hexagon hexagon-big top-left">
                            <div class="background-layer"></div>
                            <div class="hexagon-content">
                                <h2 class="hexagon-heading">КЛИЕНТЫ – НАША ГЛАВНАЯ ЦЕННОСТЬ</h2>
                                <span class="hexagon-text">Мы прекрасно осознаем, что нас не
                                    существовало бы без наших <span class="bigger-white">КЛИЕНТОВ</span>.<br />
    Мы гарантируем порядочность и честность!
    Наша команда делает все возможное,
    чтобы наши <span class="bigger-white">ПАРТНЕРЫ</span> чувствовали
    <span class="bigger-white">КЛИЕНТООРИЕНТИРОВАННОСТЬ</span>.</span>
                            </div>
                            <div class="icon">
                              <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="63" height="55" viewBox="0 0 63 55">
                                <image id="_1" data-name="1" width="63" height="55" xlink:href="data:img/png;base64,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"/>
                              </svg>
                            </div>
                        </div>
                        <div class="radial-hexagon hexagon-big top-right">
                            <div class="background-layer"></div>
                            <div class="hexagon-content">
                                <h2 class="hexagon-heading">ОПЕРАТИВНАЯ ДОСТАВКА</h2>
                                <span class="hexagon-text">Наш отдел логистики считает своим долгом сформировать и отгрузить каждый заказ в день оплаты. Доставка до терминала транспортной компании «Деловые Линии» <span class="bigger-white">БЕСПЛАТНАЯ</span>.</span>
                            </div>
                            <div class="icon">
                              <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="63" height="55" viewBox="0 0 63 55">
                                <image id="_2" data-name="2" width="63" height="55" xlink:href="data:img/png;base64,iVBORw0KGgoAAAANSUhEUgAAAD8AAAA3CAYAAAC7DJKyAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAABmJLR0QAAAAAAAD5Q7t/AAAACXBIWXMAAAsSAAALEgHS3X78AAAPEklEQVRo3s2aeXxUVZbHv/e9V1Wp7EllIQtCQgiLLCpocF9QW0RHoZXR8dMCtgqMgmijIUorCiLaboAKgsKMNo6IPeDSOHazCSoyNoqEKNlJSAKEUFXZKkm95fYfL2ySQBKYMOfzuZ98Ku/ec97vnHPPPefcJzgDqq2tTYqMjNwIuAHzTHh1gRymaa7SNO3xrjIQZyI9GAz+T2NDw29eeeVlIiIiUVSlW1AfPnyYEVkjuO322zlw4MCApKSkPd0i+AgtXLjwciml/PcpkyUgNVWRDq17BiABWVJSIqWU/9tVDF22vJSy5IcfdqRdcvHFZPTJQHNo3aZ4VVXJy8vjjjvv5MMPV5Gfn39b//79P+0sny75aVVV1SQgbWZ2Nk6nE1eIq9uAA5imSWZmJqtWfcS2bdtISUl5pyt8Om35uro6NSIiIrB69WrnuHHjGHT+QKSU3QoeQFEUysrKyMjIYMcPPwI8LYSY0ykenRUaEhLyTkNDgzNnZjYJ8XEIcUYxs8tkWRa9e/fmhx938tabbwI8V1lZ2fP/DLzf7x/pcDgmTJ/+CMUlpSQlJWFZ1jkBf1QBvc7jsccepbCwkOTk5Fc7s75TZvP5fJt8Pt816enp9Mvsi6Z1X5BrjzRNIy8vj1tuvZU1a9YCpAghqjqytsOWl1IOio6OvmbihPGEhbpxubo3yLVHhmHQr18ma9d+wvr16wFWdHRtZ9z+/c8++5SvtmwlPT0d0+zuhO4UIBQVh6awYvlygBu///77KzuyrkNuL6W8E/joltE3s2nTJtLT089JhD8VGYZJefletm79hmHDh+8VQqSdLfDeDRs3xNww8noGJGbY+dXZDvKtuhTRGjgVsDqnXFVVKSos5NJLL2P9xo14vd4pHo9nyRmBl1K+EWhsfGj4sIuorqkm5ZJ0LMeJL3zGJFp5mRJZFYSACVrntSuEYHfezyxbtpT7739ADwaDKS6X61CXwOfm5g4bNGjQPx59dDqvv76ACy65AGYmI3qEgG512jrtkiJAgAxKjPllWLsbEbGdP0kURcHv9+Pz+dhXUUl0dPRWIcRVXQKv6/rPe/bsGTD8ogvpGZeKKykc5/NpmN/WYv3NC7EOzgrVGigXhKPemYA+rwwrr9F2/y6Qpmns2pXLfffdxzvvvsv27dtvHDFixN/bnNsek5aWlt9pmjYgJzsbhCA01I2JBE1Bljdjbq9D9HCeFeyyWkeEqV2sNE6kI0ffu8uXM2nyZLKysv5jw4YNqSNHjjzJTdsE7/f73U6n861PP/2Uz9et4/yBAzADJqCAKSFURXgciLNleQuIUO2/uoSgBcF2tpSUdjzQRLsxx+l0Eh7m5g+PPcqWrV8nX3fddbcBa389r01du1yuu4HwWU89SWxsNIrSPU0KoHUj2jGgzaEIaLFsI7SzaU3TJC0tna1ff8N/ffABwKy25rVp+ZCQkCeXLn2b3N15DBk8qFsSGqlLaJZoD6Ue+U8bihGIGA1zzSGM9w4gUtrPMqWUJCbEM2vWU4wdO3aYlHKcEOKj4+cobSx6trq6us9TOTmc1zO1+woXATgFsrwZa4sP80sv1gbfsbHeh/nXw1g76lHv6YFyYQTyQBDUts0vpSQxMZGS0r2sWLECYOmaNWsi2gW/c+fOvsDTCxcuoMbrIyYmpvsyOU2AW8VYeQB9+X5kfgBrdyNWXuvID2DtrCf4eAHWRh+Op3tDuAp+o133tyyL1JRk5s6dg8/rjcrMzHzvBJHH/xg6dOh7+8rLeWPRItLTemMYRvcAB9vLLQkWqDfF4pzVG+kzWrt1gFMgPA6CM4rQ5+4l5NthOCaloL+wFxGutqkAKSUej4efduUy+9nZLFiw8HYp5XAhxD/gOMv7/f7RwIicnBwa6uuJiIjo2EufbVIFQlWQNQb6S+Xos0rQn99LcGoB5pdeHPP6QKSKPm8v6j2JKFdFI6ta2nV/wzDom9GHJYsXk5ubC/D+kWdHwUdFRb27ZctXrPzgAzL79eteq/+aFECXtqu3urwsaUZ/bR80mDj+mIbx0QHMTT4cM3tBrAZevd08we12I4RgZnY2QP9gMDj+KPjCwsIcIHFmdjYR4WHnvknRWjiJUBURrtp/k11Qo6M/V4p6RRTKxdHoM4og1oHjoVRknWHnCG2QaZpkZGSw7osv+OSTT3A4HG82NjZqyrp16/r07Nlz3pIli9n23XZ69+59TltTwLEzHeykBsCUiGQX5ld+jP8+hHNOOvKwjv5UCerdiSg3xiIr2nd/RVHwxMbwx6eepKamJszlcr2qjRo16hmA2c88Q5wn9tyCbgWJJRFJThw554HBMXcWIJssUAQiLQTnokyCTxRjvF2F47HzCFbrUNoMkepJbC3LolevXvzw405WrFjO448/8bDq8XhqsrKyJvpr/Xz55d9I6tGjbcvrEtwq6shYew/mNdpR9mxQwEKcF4J6WRTW9lpkUROyrBlZ2WKP8uPGgSCypAnzSy80mODVsbbVoY1LAAusLX5E5MnbVghBTU0NEeHhvDB/Ph5P3CfatGnTtk6ZMmXp3LnPP/jRqlVUVVXRoz0FdAeFq8jKIOaBw6eu6S1pe0C4iohUkdVB20CncPvKqv0sWbyYzMx++P3+SQqAruvTAH3OnLkcqjmMPGtdii6QIcGtIJKciHhH+yPRfo7ABqwJe8u0A7ysrIxhF13IpMmTAWbHxMRUKwChoaEtXq/3kX+96y5GjryWkuJiVPUsufT/AzJNk9q6el559VWAw0KIZ+G4k9Hj8SwG9s6f/yLBoE5LS0vXpQns8jRgQaNpW/NMyJJd5qVqGvn5+dzx27FcffU1AA8ceXZCWlBcXHzv8OEXM2HCRAoKCjtv/dYjStboSK8OcQ5EkhNaLOT+oF2nqx3szbVOk4d0ZK0BcRoiyWXzOhi0XVw5Pa+G+nrcbjcLFy7i4MHqHUKINUeenRAWMzIytpaWlv7nE09kj1+58s8EAoGTLycEdmBpsqD55KAofQbKsAi0uxIhwWFbLSixvvZj/uWQbUG3cmLF2tTavFCwFdRkQcBC1hqo18ag/jYeQlVAggnWei/Gx9WIEPXYPm+jo6yqKiWle5kz5zmSkpPl7t27bz/++UkJYVpa2oS+mX19U6dOpai45ORsr7XIIEyxQRw3ZIuFckkkjtcyIFbDeLkc/YUyrD0BtEd6ok1OQSqAQ5y4NkwBl7C3isv+LYMWSlYkjtm9ocnCeH2fzSu3AW1aT7Q7EpC6dYzHkQ7wERsJQW2tn3hPLFOmTAHIHjx4cEUbzvUrfFLm1NfXz+vfLxOA2NhYZL0BcQ6cL/VBulWo0eH4XaEKqDMRiU7k3iaC0wpby1QFWdmEdn8q2n1JyMoW24rHl8qmDVpEqHaaagIBm5e51Y8+q8Rum4WqWPsa0R7oifa7HnY9H66CJVH6h2Esq8RYXIVIdaGqGrtyc3nxxfk88UR2m5cYbYI/ePBgXEJCwqFlS5fy4KRJdjen2YAQBeWSCESMwwZ7XOtaNlmIFBfqtTHoM4uxdjXgWNAXEefAeH4v1s5GnG/3s9uAW2sRocox6UKALpFNJiJURRoSkexEvTiS4GOFyMM6jnl9UBKc6HNKsUqbcS3rj1XRgvVTvd38BKzcBuTPAZRIB/v37ychPoGfcnOpq6ub5PF4lv4aZ5sVTGJiYo2U8ukHHnzwuaVL36agoIBeab2xdBNzbU2bwUZ6gyiXRqNeGYWsNRDJTpTzw1BSQzD7hyG/9tsv+EsjxlvliNhTtKC8OkpWJMrgcGi2ED1DUC4MRyQ4Ef1CIS8ATgVrqx/jz1U2L0NCtIaI1pCmpOawl6XL3kHTtKaGhoaVbclpt3wTQsyRUk577bXX46686iqMoI6iKIjEttvVIkJFGLZSlCuiMBZVYCypRERpmKurUfqFITLd8H0dIsZ1yra3iFRBl4gQBWVIOMbqaowFFQiPA/MvhxDpbohQWrdGCMJzrIusSoX8wnxGjbqJMWPGsGbNmqljx45tbEvOKc+yqVOn5vfv3//uwoICNm/efOqPEZwKsrIFEaXheDAFWdGCufIg1rZalGQXjj9lIITAeKMCIez57ZLD5qUkOFDv7YH8JYD118OY39SiJDlxzOkDB4J2EzNCO+qFQggCgQA+n4/VH39MYmJi/sCBA3/frpI5DUkpV/m83nFDhwzBMHU8nri2+3oCaLaQAQttYhLqLR7kvhbQ7aJF7m/BmF+OdSBoW+pUV11HeDVaOGb0RLkiGlnaZJe1vUOQZS3os0vtOBOtHeWlqiq7cnczf948snNyANKFEKVdBr9v377Q1NTU+vfff0+5997xDB50fvvWVwU0mPaeHRGJcnUMQgVrTwBzvQ9aLESCs2N3fKqAegPZZKFeEYW4MAKhCayiJsz1XghKW4mt57yiKFRUVJCamsqu3N00NDS8FBERkX0qER29op4B/OmqK68gL283yckp7Xd1W89b6TPsJKg16xMxDgjp5NVzaztL+oxjaa0AEaNBiHoSr59//oXPPv+c0aNH19XU1ETHx8fL07E/LQkhXgaqxo+fgNdXe+q098g7xmh2ZdbDaQdJp+j8ra6F3dCMc9h8jvI6UYlCCMrKyrjppt8wevRo1q5dO+V0wDsMHmDHjh0T/+2ee7hg6BAqKyq69wrrNCSEoKExwPgJEwF2jxkz5oMOreuMECnlT+vXrx9yww03cP7AAecaM9Cav5cUM3ToBXz9zbdIKS9SFOXHjqztrPleuP766xl98ygKCgrOeZdXCEFzczMNjU28/MorAFs6CrzT4IUQH0op//720mVERUfj9XrP2ReYYH+FVVBYxJM5OYwYcSkFBQVTO4WnswKllAnAwQULXmf69Ee77Rb3ZOAKBw8exO12U1xciqqpy4UQv+8Uj84KFUJUV1ZWvvjII9MZOmQI+/btOyfBT0pJ9aEaFixciKqpxsMPP/xwp7GcgXD/F1+si7r55tHdHvxUVaWoqIisrCw2btpMIBCYFhYWtqjbXmDt2rV3Synlv9x6qwRkaIhLhrq7Z7R+kCK3f/edlFKWdxXDGUUrKWVuUVHhoMdnzCAuLq7bOr7Vhw5x+WWX84cZM6ipqbk2Pj5+c7eDDwQCQ9xu9xrs0ri7m/1CSrlZUZTxXWXwT8PfuNQcYOMOAAAAAElFTkSuQmCC"/>
                              </svg>
                            </div>
                        </div>
                    </div>
                    <div class="radial-hexagons-bottom-wrapper">
                        <div class="radial-hexagon hexagon-big bottom-left">
                            <div class="background-layer"></div>
                            <div class="hexagon-content">
                                <h2 class="hexagon-heading">ГАРАНТИЯ и СЕРТИФИКАТЫ</h2>
                                <span class="hexagon-text">Мы уверены в своей продукции, поэтому на весь ассортимент действует гарантия от 1 до 3 лет. Вся продукция cертифицирована в соответствии с законодательством РФ.</span>
                            </div>
                            <div class="icon">
                              <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="63" height="55" viewBox="0 0 63 55">
                                <image id="_3" data-name="3" width="63" height="55" xlink:href="data:img/png;base64,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"/>
                              </svg>
                            </div>
                        </div>
                        <div class="radial-hexagon hexagon-big bottom-right">
                            <div class="background-layer"></div>
                            <div class="hexagon-content">
                                <h2 class="hexagon-heading">ЛУЧШИЕ ЦЕНЫ</h2>
                                <span class="hexagon-text">Благодаря отсутствию посредников,
    отлаженной логистике и долгосрочным
    дружеским отношениям с производителями</span>
                            </div>
                            <div class="icon">
                              <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="63" height="55" viewBox="0 0 63 55">
                                <image id="_4" data-name="4" width="63" height="55" xlink:href="data:img/png;base64,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"/>
                              </svg>
                            </div>
                        </div>
                    </div>
                    
                    <div class="bottom-hexagon hexagon-big">
                        <div class="background-layer"></div>
                        <div class="hexagon-content">
                            <h2 class="hexagon-heading">СТАБИЛЬНОЕ КАЧЕСТВО</h2>
                            <span class="hexagon-text">Компания <span class="bigger-black">LEDS</span><span class="bigger-white">POWER</span> размещает контрактное производство на современных заводах, имеющих многолетний опыт производства LED-оборудования. Как правило, наша продукция не серийная и производится исключительно под наши требования. Таким образом, при производстве используются конкретные комплектующие, которые закупаются специально под нас. Следовательно, качественные характеристики остаются неизменными длительное время до тех
пор, пока инженеры не найдут более конкурентное решение.</span>
                        </div>
                        <div class="icon">
                          <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="63" height="55" viewBox="0 0 63 55">
                            <image id="_5" data-name="5" width="63" height="55" xlink:href="data:img/png;base64,iVBORw0KGgoAAAANSUhEUgAAAD8AAAA3CAYAAAC7DJKyAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAABmJLR0QAAAAAAAD5Q7t/AAAACXBIWXMAAAsSAAALEgHS3X78AAARX0lEQVRo3r2be3xU1bXHv3ufc2YmySSTSQYSkpCERxSBgGK1D9HaFqm1VrSU9latrbdobYt+vCrxgRXFq8C9Kha1grdCr9b2tlqsgv3j4rW3WEClgjyU8EpIQt7DJJk8JjPnse8fJ0EIecwEL+vz4cOHZO+192+ttddv7bUPgjOQSCTy+WAw+HtAAs6Z6EpRBKCZpvlvHo/n2TNRMmpRSh2qrq6e/NyzzzBmzFiEOCN1SUtzcxPXXDOPL19+OS0tLYG8vLzoWVm4XzZs2LBQKaXmzr1CAcrQpTJ07az8AdSYUK6Kx+MqFov9brQYRuWqmpoavbi4OPr6hg1p354/n+nTpqKUOmuG13Wd3Xv2ct+997J8xQpM05zh8Xj2nhXwkUjkGb/fv2jmjBm0trYwbtw4HOfsHXkhBLFYjIaGBvbu+5hJkyZ9JIS4IFU9MtUJ0Wh0fDAYXPTEE//O/spKCgoKzypwAKUUGRkZWKbJ4nvuBjhfKbUgZSOOYuF3q6uqZs+adQHZ2QH8/syzGvIDjfDJ/ko2btzI1Vdf3bZ58+biuXPndiU7PyXPNzY2/hCYvfCWhfT2xggEskcHXOASY4/t/j1KktA0jfy8sdx6y0La2tqCpaUTlqUyPyXwgUDgvrfffpt33vkrkyeXYVnW6HYN4ChI1+AMosZxHPLy8mhsaubRR5dRVjb5lqNHj+rJzk/a5kqp6xzH2TBp4gR6enrIy8s79awLQAHdNngkeMWQZY9qM5EXZaEvKsJaU4+zrQORYww+WBPQbaM6bUSuATqn6U0k4hw7Vs/2996ntLT02ezs7NuTwZSK5/9j7QtrOVpTS37+ENndUhDUXa0JNbRpex3EGA/yvHTEWA/0DmElgXs0/Bry4izQ+tYYIGlp6cR646x78dcEAoFF4XC4+DMDr5RaCuSuX7eOUG4OjmOfPqbDRoz14HmqDO3KXFTYHFqhJiDuoNosiDvuv4da+7iJNjcHz9NliBIfKnL6UbNtm4kTSvjjq3+kvr6e3Nzclz4T8G1tbQHg4RfWrmXHjn9QUFAwaJITGqguGxRo80KIcR7osEdfQAtQ7RZivA/tm7k4B3pQx+KI9MG3nJmZRXNTCw8uWQLw5c7Ozq+eMfjs7OxX6+rqePDBBygqLBia0/0a6mgM6+UmxIQ0tCtyUD2uMYYChxxmBwqIOWhzgojSNOw/NKNqesGvDTrcsizOPfccXnrpP9n697/j9/t/W1FRMUQiSQL8a6+9dj1wxc9/9jOOH4+QGwoNTW0KRI6B/U4bzs5O5NeCiBzdDeuBYivQBSLP64a8PYjOuIMIGciv5eB8EMX+33ZEyBg8ifZRp0caBINBbrjhehKJxLiVK1c+Pyrwra2tYv78+c//5a232LhpE+dNOw+zqcc9y5LBwzldQpuJvSmMnOFHfjGAaj/9jIpsA3WgB+vJWtQnPYjg6Q5SbRbyCwHkLD/2W2FotyBtEK9LwFKoDgu726RwXCE1tXWsWLEc4MeHDh0qGwrjkCeyo6NjZVZWVsX5M8upra2jaEwBfD4TFbVwtrQj8jxgDEJnMQcMgbFiEs677VgvNbljTxa9j77Cpktffu20LK7aTLSvBJFfCmA9e8xlD98AX2kCOi1UxEL7QT5yWgb2mga6W6OEO4+zd98nlJSUvCeE+GLSnrdtOz8rK6vi6VWr2L1nH+MLirA7TLRrQ3ieLkPOCaLq49DjgBxgvwwXiLmkCntzm0tlA8VS4JWIAq8LaBD6ErkenA86MR+rAatP7wDgKmyiOm30WwowHihBFHpRXRaZmVn09PTwwP33A3yhs7PzC0l73jTNR2Kx2EOTJ03E6/USCARwOkzk1AyMhyYg8gysXx7DeqUJkaFB0Dj13Apcw+hi2GJnWOkvgR11OhVqAtWacCPszmK0743F2dqO+VgN6riJyDZwbJv9lQfYsuVvXHrpZRuFENcMXOK0UvCOO+7QdV2/e9myR2hpDTNzRjmWZSGydZwdnSTuOIjxYCn6g6VQ5MVe3wgJB3od93xr4tNqbyjzqgE/H2rswJ8r3HLYkMhz0tDvLUFemIX9h2bMp+ug23Ep1lbouk6mP4P77r2Xrdu2f+vNN9+cdc011+wc1vNKqT/u379/wfRpU5k8eTKGYXw6UoCqT0DIwLg5H+1H47DWNGA+dhQ5KxPtkoDrLaXckr2vgBGGOAFYJVxEwjjJSLZC2QrhkSd2pGzAdMCQiL6IV1JAj439Zhhtdjb6zwux3wxj/VczCBAhzykRKKVk776P2bRpI1/5ylcPZ2RknJL8TvH80aNHrwQWrFj+OFJKfD4ftm2fZHUQRV5UxMRcdQz7wy4Imwi/hv79PLRrQ6jmBJgulZ24uXmlmxzjjpu4gjr0g9OE+7to3zrp0p0X67sj+KQbWQrwSUSOgTAk1stNOHu6UB0WIlNzL0kDKFMpRSg3yJIHlvDR7t2TlVIrhBD3Dep5pVTDtm1bx82+ZDZTppyLlEMwoQQst/RUnRb6t0IY/zoR+63jWOsb3SHnpqPfU4y9OYL9u2ZEto6KOxh3F4NHYD5Zh1Cguiz0G/ORl2VjLqtGNZsQs5GXZqP/tBDrhQacd9vd3OLXMO4vQbWYmPcddg2Xrrn7GaL80DSNPXv3seqpJ7nzX+4CGCeEaOqH0Q98MTCuYvFi/P50dH2Ym6HjzhS5BiJLR16eDQkH+/VW1KEeVGMce2s7qiqGdnEWmA729ggiTSLO92NvjuB8EMWp70UdiWH/5ThkaIhiH85HUVR9HHleOsQdnO0dqNpenIY49rvt2JsjiJkZiElpbgU5DHBwr73jiwpZ/vhywuEwjuOsP9mHVFVVZQIrf/Ob9Wzdtp3S0gkjt6aE63kxOQ15aTb2n8M4e7oQE9NcXu9x3I1OSUf7eg4g0L6XB40JnL93IMd7EVk6otSHc7AHZ3sH+vfyELke5AWZaFfl4rzbgWpOIMb7ENk6YqwH+5026HWQc3PAHB54f+jn5OTQEg7z8NKlSCmvXL169ZdOgNc0/XnHccTDS5eSnzc2ue6MA1gO+rUhMBXW663u2VaADSJLx9negbOnC3lRFtoVIeTFWThb290aIV3r6+K4SczZ1YWY6ENelo28MBMU2H+NQLxvL3061aEY9hthtK/nIs5Nc2+GI1yeLMvinLLJrFnzPLt27eL2229/GUDG4/FLi4vH37B48T3U1NaRl5c3MngBKpxAXpSFvCrkNiR2RhGGQHVYqKgFjsKp7MF+tQUxKR391gKI2djvdqA67RPjVIcFDjjvRHA+7MT40Ti0b4aw3whj/60dTtKpohaq28beFAZDoH016CbGJMTn8+H1eqlYfA+xWGxiZWXlnUIp9UFdXd1F55RNoqCgkPT09JHBJxQ4Cn1JKXJKOvbbEbesPaUtJdyN+TVkuR88AjosnP09rsdPSilCCFS3jZiUhizxuYH1cTeqMY7I1E/dj+3Gq5zhh0wN67EanEM9iMDI3av+fv/rGzZw7XXXtevRaPSpsWPH/n7evOv4059eY9q0aSP35gQoW7ngbIX8XJZLNwNvZ5qAHgfVZkKvACHQZgdcCnNOrgjduFURExUxXUqdnIb8XObpOqU4cVNUXbZrNDly00BKSV1tLTPLy7lk9myAFwWAUuqv9fX1l88on05mZiaZmSO0owUuv2brGA9PRAQ01HHz9Dr//0P6+T5bx1xZg/NeFFHgGbGE7m9zb968mTlz5rQJIXIkQDgcvqmwsJCKigpqauvQNG3EDYiggaqNY73YAIZ0vXk2RLgUa73a8untcgTgmqZx6NBBvn3dtcyZMwfg1j5VrhyPRFZn+v23nz9zBi0tST5BOaAa4+gVxWhfy0FVx4btx52xOAqR70XV9JK4/7BbDmdow9Jd/9NWY0MDH++vpLS0dJcQYhacVOTs2rnzLsMwYo899jjh45Hk6E4D4dewf9uEqut1r69OEvNGIwo3oQqwft/sUqBfG5HnNU3jSFU1d951F6WlpZimedMJw5yiX6l/Bl686htXsmXL35g4cdLI3tcEqq4XOSsT4+EJbhMzan2251/htr2KfVjrGrBfbkIU+0acJoQgEong8/k4dPgINbW1r0ycMOHG/t/LAYPXAVt+8dBSunt6P73UDCe2QhR4cXZ2Yj17zK3B00b2SKoi8j3YG1ux/9DinvMkbCulpKGxiSVLHkRKGdY1beEpOk8zslJjgJb587/Nxjfe4LypU0c2gsDto9X2ot9aiPb9PFRt72eD2laIIh/Ovi7MX1Qh0jQI6CMeLyklTU2NjBkzll0f7ca27avT09PfOmXMaTiEaLVse81TT63CMAy6u7tH/tykPyzzvVi/a8b5IIoo9A7elU1FHIUIGag2E+u5evcoZY8MHFxqaw1HWLbsUTwez7aBwAcFDxDr6XmqpKSEO++6iyNV1SNTX78B/O710lpTj2pMuO9vo8Xfx+d4JdYLDaiavoSahEE1TePIkSPMvWIO87/zHSorKx8dbNyQLj1aU/NKUVHR9ZNKS0gkEsP37E8xp0BVx5BX5GAsLkY1xkfXw1MgxvuwX2vGWtvgJrgkc6hpmhw5coQdO/7BBbNmVQkhJg261aExiJ9qUrL0kWU0Nrck/6WV05cAt7bjbO9AFPpSp7/+cK/vxfpz2O3rJ1lD6brOwUOH+cltt3HBrFn8cvXqm4YaOyyi3t7eu71e7xOXzZ7Nhzs/pKwsyTd5Kdy7fkDDeHSiC6QpkVwB5Cjw64gsDXN5Dc77yZWv4Ca548fDmKbFJ/srCYVCm4QQ3xpy/HDKfD7fk8COF9evR0pJNBpNLgL6PRe2MJfXoLr63tZHigCF28/P0rB+VY+ztQORnxxwcLs2DY3NPPer5wmFQl2xWOy7wxprJIUHDx68vqysjMUVFVQfrRm6rzdQbIXI73uWWtsAaX3NyJFaBeO8bi9wY9gFnuRp0zSNw4cPc9U3vsGCBQswTfPn6enpsWHXSkaxUurXiUTix+XTp9HV1UUwGExuRwAKVF0v+sICtH8ahv/7+fyTbsylVQivhEwtaa+bpkljYyPbtr/HlClT9huGMXWkOUm5cdGiRbd7PB7rJz+5jYbGpuGbm4OsIEIerFeacXZE3SeqgXTlKJcWOyysXx1zGxZZetLApZQcPnyYefPmMX36dICbkpmXdAHe29u7qKur85np06ZiGB4CgUDyX2Jpwm1EjjEwHpmAyNDdVlf/6rpA5BqYq+pw/qcNUZIaQziOw/7KA3zw/vukZ2T8efr06dcl6ZfkxOfzPZubG2qouPc+6o7VJ3/2wQ3psR5UVQz7T60Q0j9tOTsKUejF/u8IzuaIWxmmAFzXdQ5UHuCG67/PRRdfbB88eGhhsnNTunoppe4Gnjh/5gyqq6spLS1N7vLTLwmF6rYx7ilGfjELVd2LyPegOi3MJVWoiOV+0JAkdiEE0WiUSOQ4H39SSXFx8W+FED9IdjsptV+EEE8ClS+uW088HicWi6Uy3c32GpiranH2diM/l4kyFebKGvdYhFIrh4UQ1NYdY/Uzz1FcXGzv27dvcSrbSbn3ZJrmjRdeeCG33fZTDh0+klryc5RbrcUcrLX1ODui2OsaUB93u9fUFC5CmqZRVVXF7Esu4eabbwZYXF5e3pQKllF1HHbt2vV6SUnJtdOmnoeUkmAwmNpnqP1fVMSV+1rr10591k5CbNvm4MGDfLR7D+Xl5fVCiKJUcYyq61hZWXlLMBjkoYeWUt/QmFryA9fD6Zrb7s5IHbiu6xw4cJCbbvoh5eXlxGKxH40Gx6h7TUqpR4CHLjh/Jh/t3kOazztaVSlLrDeO12Nw+EgVRUVFW4QQXz6r4PsM0LZ9+7bs5Y8vp7Cw8Kz9H5uG+noWfHcBN9z4A9ra2kpzcnJqzjr49vb2qwOBwGpSDtzPRER3d/dLfr9/6WgV/B+xdfMk9MiDLQAAAABJRU5ErkJggg=="/>
                          </svg>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        
    </div>
    <?php echo $column_right; ?>
  </div>
</div>
<div class="container collaboration-process">
    <div class="container-row">
        <div class="heading-wrapper">
            <h2 class="heading-text">Процесс сотрудничества</h2>
            <span class="heading-bottom-line"></span>
        </div>
        <div class="content-area">
            <div class="line-1 line">
                <div class="column-1 column">
                    <div class="hexagon"></div>
                </div>
                <div class="column-2 column">
                    <div class="hexagon"></div>
                </div>
                <div class="column-3 column">
                    <div class="hexagon"></div>
                </div>
            </div>
            <div class="line-2 line">
                <div class="column-1 column">
                    <div class="hexagon"></div>
                </div>
                <div class="column-2 column">
                    <div class="hexagon"></div>
                </div>
                <div class="column-3 column">
                    <div class="hexagon"></div>
                </div>
            </div>
            <div class="line-3 line">
                <div class="column-1 column">
                    <div class="hexagon"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="content-bottom" class="container-row">
  <?php echo $content_bottom; ?>
</div>
<div class="left-uzor">
    <img src="catalog/view/theme/svetodiodi/image/theme_images/uzor2.png" />
</div>
<?php echo $footer; ?>