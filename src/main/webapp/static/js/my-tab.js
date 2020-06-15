/**
 * Created by fy on 2016/9/19.
 */
jQuery.fn.extend({
    /**
     *
     */
    myTab: function (options) {
        var settings = {clickReload: true};
        jQuery.extend(settings, options);
        this.find('a').each(function () {
            var url = $(this).data('url');
            var showAtOpened = $(this).data('show-at-opened');
            var targetDomId = $(this).attr('href');
            var targetDom = $(targetDomId);
            if (showAtOpened) {
                $(this).parent('li').addClass('active');
                targetDom.addClass('in active');
                targetDom.load(url)
            }
        }).click(function () {
            var url = $(this).data('url');
            var targetDomId = $(this).attr('href');
//        var clickReload = $(this).data('click-reload');
            var targetDom = $(targetDomId);
            if (targetDom.children().size() || settings.clickReload) {
                targetDom.load(url)
            }
        });
        return this;
    },

});

// $('.nav-tabs').myTab();

function reloadTab(id) {
    var url = $(id).data('url');
    var targetDomId = $(id).attr('href');
    var targetDom = $(targetDomId);
    $(id).parent('li').addClass('active');
    targetDom.addClass('in active');
    targetDom.load(url)
}