jQuery(document).ready(function ($) {

    jQuery('.registration_event .woocommerce').on('change', '.quantity .qty', function (event) {
        var total = 0;

        jQuery('.registration_event .woocommerce .products .quantity .qty').each(function (i, el) {
            total += parseInt(jQuery(el).val());
        });
        if (total > 0)
            jQuery('.registration_event .woocommerce .add_to_cart_loop').removeAttr('disabled');
        else
            jQuery('.registration_event .woocommerce .add_to_cart_loop').attr('disabled', 'disabled');
    });

    jQuery('.registration_event .woocommerce').on('click', '.add_to_cart_loop', function (event) {
        var elements = jQuery('.registration_event .woocommerce .products').find('[name=product_id]').filter(function () {
            return parseInt(jQuery(this).parent().find('.quantity .qty').val(), 10) > 0;
        });
        for (var i = 0; i < elements.size(); i++) {
            jQuery.ajax({
                type: 'POST',
                async: false,
                url: wc_add_to_cart_params.ajax_url,
                data: {
                    'action': 'woocommerce_add_to_cart',
                    'product_id': jQuery(elements[i]).val(),
                    'quantity': jQuery(elements[i]).parent().find('.quantity .qty').val()
                },
                success: function (data) {
                    if (i == elements.size() - 1)
                        location.href = wc_add_to_cart_params.cart_url;
                }
            });
        }

        return false;
    });

    jQuery('.registration_event .woocommerce .products').find('.quantity .qty').val(0);
    jQuery('.registration_event .woocommerce .add_to_cart_loop').attr('disabled', 'disabled');
});