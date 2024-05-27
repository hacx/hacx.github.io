jQuery(function() {
    
    jQuery(window).scroll(function(){	
		var header = jQuery('.header'),
		scroll = jQuery(window).scrollTop();
		if (scroll >= 10) {
			header.addClass('sticky');
		} else {
			header.removeClass('sticky');
		}
	});
    
	 
    
    jQuery('.features-area').hide();
    jQuery('.show-more').click(function() {
        jQuery('span', this).text(function(i, txt) {
            return txt === "More" ? "Less" : "More";
        });
        jQuery(".features-area").slideToggle();
        jQuery(this).toggleClass("active");
        return false;
    });
    
    
    jQuery("#arw-dwn").click(function() {
        jQuery('html, body').animate({
            scrollTop: $("#features").offset().top //-80
        }, 'slow');
        jQuery(".navbar-nav li").removeClass("active");
        jQuery(".fe").addClass("active");
    });
    
    
    var lastId,
        topMenu = jQuery(".scroll ul"),
        topMenuHeight = 0,//jQuery(".header").outerHeight(),
        // All list items
        menuItems = topMenu.find("a.sl"),
        // Anchors corresponding to menu items
        scrollItems = menuItems.map(function() {
            var item = jQuery(jQuery(this).attr("href"));
            if (item.length) {
                return item;
            }
        });

    // Bind click handler to menu items
    // so we can get a fancy scroll animation
    menuItems.click(function(e) {
		jQuery(".navbar-nav li").removeClass("active");
        jQuery(this).parent().addClass("active");
        var href = jQuery(this).attr("href"),
            offsetTop = href === "#" ? 0 : jQuery(href).offset().top - topMenuHeight + 1;
        jQuery('html, body').stop().animate({
            scrollTop: offsetTop
        }, 'slow');
        e.preventDefault();
    });
    var fromTop = jQuery(this).scrollTop() + topMenuHeight;
    var cur = scrollItems.map(function() {
        if (jQuery(this).offset().top < fromTop)
            return this;
    });
    cur = cur[cur.length - 1];
    var id = cur && cur.length ? cur[0].id : "";
    if (lastId !== id) {
        lastId = id;
        menuItems
            .parent().removeClass("active")
            .end().filter("[href=#" + id + "]").parent().addClass("active");
    }
	//jQuery(".fe").parent().removeClass("active");
    // Bind to scroll
    jQuery(window).scroll(function() {
		
        var fromTop = jQuery(this).scrollTop() + topMenuHeight;
        var cur = scrollItems.map(function() {
            if (jQuery(this).offset().top < fromTop)
                return this;
        });
        cur = cur[cur.length - 1];
        var id = cur && cur.length ? cur[0].id : "";

        if (lastId !== id) {
            lastId = id;
            menuItems
                .parent().removeClass("active")
                .end().filter("[href=#" + id + "]").parent().addClass("active");
        }
    });
    

    
});

