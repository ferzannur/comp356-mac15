(function($) {
    $(function() {
        var jhomeslider = $('.jhomeslider');

        jhomeslider
            .on('jhomeslider:reload jhomeslider:create', function () {
                var width = jhomeslider.innerWidth();

                //** comp356-mac15 customisation to reduce whitespace
                //**   show 4 squarethumbs if >800
                if (width >= 800) {
                    width = width / 4; 
                } else if (width >= 600) {
                    width = width / 3;
                } else if (width >= 350) {
                    width = width / 2;
                } 

                jhomeslider.jhomeslider('items').css('width', width + 'px');
            })
            .jhomeslider({
                wrap: 'circular'
            });

        $('.jhomeslider-control-prev')
            .jhomesliderControl({
                target: '-=1'
            });

        $('.jhomeslider-control-next')
            .jhomesliderControl({
                target: '+=1'
            });

        $('.jhomeslider-pagination')
            .on('jhomesliderpagination:active', 'a', function() {
                $(this).addClass('active');
            })
            .on('jhomesliderpagination:inactive', 'a', function() {
                $(this).removeClass('active');
            })
            .on('click', function(e) {
                e.preventDefault();
            })
            .jhomesliderPagination({
                perPage: 1,
                item: function(page) {
                    return '<a href="#' + page + '">' + page + '</a>';
                }
            });
    });
})(jQuery);
