<div class="jhomeslider-wrapper">
    <div class="jhomeslider" id="jhomeslider-<?php echo $id_suffix; ?>">
        <ul>
        <?php foreach($items as $item): ?>
            <li>
            
            <?php echo link_to_item(
                    item_image('square_thumbnail', array(), 0, $item), 
                    array('class' => 'image'), 'show', $item
                    );
            ?>
                        <p>
            <?php if(isset($configs['homeslider']['showTitles']) && $configs['homeslider']['showTitles'] ): ?>
                <a href="<?php echo record_url($item, 'show'); ?>">
                <?php echo metadata($item, array('Dublin Core', 'Title')); ?>
                </a>
                </p>
            <?php endif; ?>
            </li>
        <?php endforeach; ?>
        </ul>
    </div>

    <a href="#" class="jhomeslider-control-prev">&lsaquo;</a>
    <a href="#" class="jhomeslider-control-next">&rsaquo;</a>

    <p id="jhomeslider-pagination-<?php echo $id_suffix; ?>"></p>
</div>

<script type='text/javascript'>
var homesliderConfig = <?php echo json_encode($configs['homeslider']);?>;
var configs = <?php echo json_encode($configs);?>;
var homeslider = jQuery('#jhomeslider-<?php echo $id_suffix; ?>').jhomeslider(homesliderConfig);
<?php if(isset($configs['autoscroll'])): ?>
var autoscrollConfig = <?php echo json_encode($configs['autoscroll']);?>;
homeslider.jhomesliderAutoscroll(autoscrollConfig);
<?php endif; ?>
</script>
