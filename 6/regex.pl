#!/usr/bin/env perl


# 1. Needle: fox,
# Haystack: The quick brown fox jumped over the lazy dog.
print "$1\n" if "The quick brown fox jumped over the lazy dog." =~ /(fox)/;

# Needle: 299.90,
# Haystack: Price: <a href=’/redirect.php’>$299.90</a>
print "$1\n" if "Price: <a href=’/redirect.php’>\$299.90</a>" =~ /\$([0-9\.]+)/;

# 3. Needle: model # and sku #
# Haystack:
# http://www.footlocker.com/product/model:94651/sku:677374/adidas­originalssuperstar­2­mens/black/white/
print "Model:$1 suk:$2\n" if "http://www.footlocker.com/product/model:94651/sku:677374/adidas­originalssuperstar­2­mens/black/white/" =~ /model:(\d+)\/sku:(\d+)/;;


$webpage = webpage();

# 4. The follow questions require visiting the link mentioned above and pulling from the page. 
# Needle: The “Outsole” material of the shoe from the product page
print "$1\n" if $webpage =~ /(\w+)\W(\w+\W){3}outsole/;


# 5. The time since the product page from was launched
print "$1\n" if $webpage =~ /http-equiv="published" content="([^"]+)"/;

# 6. The brand name of this product (name of the subbrand of Adidas)
print "$1\n" if $webpage =~ /adidas (\w+)/;


# HARDER


# 1. Write a single regex that will match the following:
$regex = qr/(\w\d{2}\w\d{10}|\d\w\d­\d{3}\w­\d{5})/;

print "$1\n" if "http://www.newegg.com/Product/Product.aspx?Item=N82E16814127726" =~ $regex;
print "$1\n" if "http://www.newegg.com/Product/Product.aspx?Item=1J8­000M­00001" =~ $regex;
# While not matching the following:
print "$1\n" if "http://www.newegg.com/Product/Product.aspx?Item=04E­0009­00014" =~ $regex;
print "$1\n" if "http://www.newegg.com/Product/Product.aspx?Item=20­171­833" =~ $regex;
print "$1\n" if "http://www.newegg.com/Product/Product.aspx?Item=9SIA05F02K0789" =~ $regex;
# Please make assumptions as to what is a valid link structure and what isn’t.

# 2. HP appends a number at the end of their part numbers. Write a single replacement regex that
# replaces the ending 3 digits of the part number without wrongly replacing the digits from one that
# doesn’t have the suffix. The regex should satisfies all conditions listed below.

# CD972AN140 should turn into CD972AN
# CD962A should turn into CD962A
# CD527 should turn into CD527
# Q5949A should turn into Q5949A

@test = ('CD972AN140','CD962A','CD527','Q5949A');
foreach (@test) {
    $_ =~ s/(\w+\d{3,4}\w*)\d{3}$/$1/;
    print "$_\n";
}


# 3. Write a single regex that passes when at least 5 numbers appear delimited by a comma.
# Example:
# “1,2” = FAIL
# “1,2,3” = FAIL
# “1,2,3,4,5” = PASS
# “1,2,3,4,5,6” = PASS
# “1,2,3,4,5,6,7” = PASS

@test = ('1,2','1,2,3','1,2,3,4','1,2,3,4,5','1,2,3,4,5,6','1,2,3,4,5,6,7');
foreach (@test) {
    if (/(\d,){4}\d/){
        print "$_ = PASS\n";
    } else {
        print "$_ = FAIL\n";
    }
}



















sub webpage {
    $content = <<"EOT";

        <!DOCTYPE html>

<html xmlns:fb="http://www.facebook.com/2008/fbml">
        <head>
                <script type="text/javascript" src="/images/common/jquery/jquery.latest.js"></script>
                
                <script type="text/javascript" src="/ns/common/coradiant/tsedge_instr-min.js"> </script>
                <meta name="msvalidate.01" content="EDC57CBB5433904007B934915238FE4A" />
                

        
        <meta name="format-detection" content="telephone=no">

        
                <title>adidas Originals Superstar 2 - Men's - Basketball - Shoes - Black/White</title>
                <meta name="description" content="The iconic shell-toe shoes were once THE shoe of the NBA in the '70s.  Upper made with durable yet breathable materials.">
                <meta name="keywords" content="adidas, Originals, Superstar, 2, -, Men's, Black/White, 677374">
        

        <meta http-equiv="published" content="Wednesday, November 26, 2014 9:59:12">

        

        <script language="JavaScript">
                
                var tagMgt = {page_id:null,cart_id:null,device:null,department:null,category:null,subcategory:null,brand:null,gender:null,sport:null,team:null,product_sku:null,product_image:null,referrer_source:null,matchback_id:null,customer_id:null,vip_id:null,breadcrumb:null,img_url:null,cg:null,video_id:null,video_name:null,article_id:null,article_name:null,special_page:null,order_id:null,total_value:null,total_items:null,cart_lines:null};
                tagMgt.device = "Desktop";
                
        </script>

        <script>
        var RBM = new Object();

        function rbAdd(name, value){
            var t = name.split(".");
            try {
                rbObjectify(RBM, t, value);
            } catch (err) {
                console.log(err);
                console.log(name);
            }
        }
        function rbObjectify(to, from, value) {
            var next = from[0];
            from.shift();

            if(from.length == 0){
                to[next] = value;
            } else {
                if (to[next] === undefined){
                    to[next] = {};
                }
                rbObjectify(to[next], from, value);
            }
        }
                
                function fitToViewport(maxWidth, marginToAdjust) {
                        if (typeof marginToAdjust === 'undefined') {
                                var marginToAdjust = 32;
                        }
                        var adjustedMaxWidth = $(window).width() - marginToAdjust;
                        return adjustedMaxWidth < maxWidth ? adjustedMaxWidth : maxWidth;
                }
        </script>

        
        <!--[if lt IE 9]>
          <script type="text/javascript" src="/shared/scripts/excanvas.js"></script>
        <![endif]-->
        <script type="text/javascript" src="/combine?type=js&files=shared/tipped/tipped.js,shared/scripts/jquery.bgiframe.pack.js,shared/scripts/ajax.js,shared/scripts/common.js,shared/search/scripts/sizesearch.js,shared/scripts/jquery.mask.min.js&locale=en_US&ver=1099b&cd=1d"></script>

        
                <script type="text/javascript" src="/combine?type=js&files=shared/storepickup/modal.js,shared/storepickup/boris.js&locale=en_US&ver=1099b&cd=1d"></script>
                

        <script type="text/javascript">//<![CDATA[
                var locale = 'en_US';
                var sizeSearchActionURL = 'http://www.footlocker.com/includes/sizeSearchForm';

                var premierBogoEnabled = true;
                var premierBogoCalloutsEnabled = true;
                
                        var premierBogoDetails = {"ipfl4knt":{"icon":"Buy One, Get One 50% Off","bubble":"Discount will be applied once both items are in your cart. Only one discount per order.","callout":"Buy One, Get One 50% Off"}};
                
        //]]>
        </script>

        
        <script>
        var wishlistpostCardURL = 'https://www.footlocker.com/wishlist/wl_postcard.cfm';
        var wishlistmailSender  = 'https://www.footlocker.com/wishlist/wl_mailSender.cfm';
        var dsnname = 'PRO-WFL-LB-ALT';
        
                var microsite = '';
        
                var doCoreMetrix = true;        
        
        </script>
        
        <IgnoreURLReformat>
                

                <script type="text/javascript">
                        
                                var login_template_path = "http://www.footlocker.com/login/login.cfm?secured=false&bv_RR_enabled=false&bv_AA_enabled=false&bv_JS_enabled=true&ignorebv=false";
                        
                        var register_url = "https://www.footlocker.com/account/default.cfm?action=accountCreate";
            </script>

            
        </IgnoreURLReformat>

        <script type="text/javascript">
        $(document).ready(function() {
            $(".loginRequired").each(initializeLoginRequired);
        });
    </script> 

<script type="text/javascript">
        $(document).ready(function() {
                $(".showUntilLoaded").hide();
                $(".hideUntilLoaded").show();
        });
</script>

<script language="javascript">
<!--
                function updateWelcome (coremetricsEventId, CoremetricsCategoryId) {
                        //cmCreateConversionEventTag(coremetricsEventId, 2, CoremetricsCategoryId, 0);
                        
                                window.location.reload();
                        
                }
                // coremetricsEventId, CoremetricsCategoryId
                function logout(coremetricsEventId, CoremetricsCategoryId, coreMetricsDo) {
                        if ((coremetricsEventId) && (CoremetricsCategoryId) && coreMetricsDo == 'true')
                                { cmCreateConversionEventTag(coremetricsEventId, 1, CoremetricsCategoryId, 0);  }
                        if ((coremetricsEventId) && (CoremetricsCategoryId) && coreMetricsDo == 'true')
                                { cmCreateConversionEventTag(coremetricsEventId, 2, CoremetricsCategoryId, 0);  }
                
                var logoutPath = "http://www.footlocker.com/account/default.cfm?action=accountSignOut";
                
                        var thisurl = window.location.toString();
                        // remove any anchor reference in the url so that the page can reload with updated login status
                        if (thisurl.indexOf("#") > 0) {
                                thisurl = thisurl.split("#")[0];
                        }
                        var regex = "/" + "&bvdisplaycode=[a-zA-Z0-9%._&=]*" + "/g";
                        if (thisurl.indexOf('&bvdisplaycode=') > 0 && thisurl.indexOf('submitReview') < 0) {
                                thisurl = thisurl.replace(eval(regex), '');
                        }
                
                        var ret_val= $.ajax({ type: "GET", url: logoutPath, data: {Next: escape(thisurl)}, async: false, cache : false }).responseText;
                        eraseCookie('BAZAARVOICEUSER');

                        //revmove any URL params after logout only if in shopping cart
                        if(thisurl.indexOf("shoppingcart/default.cfm") !== -1){
                                thisurl = thisurl.substring(0, thisurl.indexOf('?'));
                        }

                        window.location=thisurl;
                }
                
//-->
</script>

                <script type="text/javascript" src="/combine?type=js&files=shared/wishlist/wl_sharedWishList.js,shared/myAccount/login.js&locale=en_US&ver=1099b&cd=1d"></script>
        
<script type="text/javascript" language="javascript" src="//www.footlocker.com/ns/chat/js/hours-toggle.js"></script> 
<script type="text/javascript" language="javascript" src="//www.footlocker.com/ns/common/js/responseLiveChat.js"></script>

        
                <script language="javascript">
                        function clickSearch(fieldObj) {
                                fieldObj.value="";
                                fieldObj.style.color="black";
                        }
                        
                </script>
                        
        
<script language="javascript1.1" src="//libs.coremetrics.com/eluminate.js" type="text/javascript"></script>
<script language="javascript1.1" src="//www.footlocker.com/shared/coremetrics/cmcustom.js" type="text/javascript"></script>

        <link rel="canonical" href="http://www.footlocker.com/product/model:94651/adidas-originals-superstar-2-mens"> <link rel="alternate" href=" http://m.footlocker.com/?uri=product&sku=677374&model=94651" /> 
                        <style type="text/css">
                                @import '/combine?type=css&files=shared/tipped/tipped.css,/css/typography.css,/css/style.css,/css/default_template.css,shared/storepickup/style.css,/storepickup/style.css,shared/wishlist/wl_sharedWishList.css,shared/myAccount/login.css&locale=en_US&ver=1099b&cd=1d';
                        </style>
                
                        <style type="text/css">
                                
                        .loading {
                                background: transparent url(http://www.footlocker.com/images/fl/quickview/quickview_loader.gif) center no-repeat;
                        }
        
        .hideUntilLoaded {
                display: none;
        }
        .showUntilLoaded {
                display: block;
        }

                        </style>
                
                        <style type="text/css">
                                </style>

<meta property="og:type" content="website" />
<meta property="og:image" content="http://www.footlocker.com/ns/hp/launch/images/fl-release-calendar-approved-icon-facebook-share.png" />

<!-- Bookmark Icons -->
<link href="/ns/common/images/bookmark-icons/PB-apple-icons-60x60-FL.png" rel="apple-touch-icon" />
<link href="/ns/common/images/bookmark-icons/PB-apple-icons-76x76-FL.png" rel="apple-touch-icon" sizes="76x76" />
<link href="/ns/common/images/bookmark-icons/PB-apple-icons-120x120-FL.png" rel="apple-touch-icon" sizes="120x120" />
<link href="/ns/common/images/bookmark-icons/PB-apple-icons-152x152-FL.png" rel="apple-touch-icon" sizes="152x152" />
<!-- End Bookmark Icons -->

<link href="/ns/common/css/jquery.lib.1.1.4.css" rel="stylesheet" />
<link rel="stylesheet" href="/images/common/css/global-styles.css" />
<script src="//cdn.optimizely.com/js/658920926.js"></script>
<script src="/ns/common/js/backtomobile_v1.2.js"></script>
<link rel="stylesheet" type="text/css" href="/ns/css/fl_master_combine.css" />
<link rel="stylesheet" href="/ns/common/mta/css/mta.css" />
<link rel="stylesheet" href="/ns/common/mta/css/mta-fl.css" />
<link rel="stylesheet" type="text/css" href="/ns/shadowbox/shadowbox.css" />
<link rel="stylesheet" href="/ns/common/css/global-btn-styles.css" />
<link rel="stylesheet" href="/ns/css/fl-btn-styles.css" />
<meta name="google-site-verification" content="tVMcsBqneHdBje4Q4dlVnwb3_ABxlSwzGXPVBCyIG08" />
<!--[if IE]>
<style>
 #endecaNav .fb_edge_widget_with_comment {
     display:none;
 }
        </style>
<![endif]-->
<!--[if lte IE 8]>
<style type='text/css'>
    #product_images .alt_view, #product_images .alt_view[data-zoom="in"] {
        cursor: auto !important;
    }
    #product_images .alt_view[data-zoom="out"] {
        cursor: auto !important;
    }
</style>
<![endif]-->

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-50007301-5', 'footlocker.com');
  ga('send', 'pageview');

</script>

<style> @import 'http://t.p.mybuys.com/css/mbstyles.css'; 
        .checkout_step {
                height: 35px;
                background-color: transparent;
                background-position: top left;
                background-repeat: no-repeat;
        }
        #checkout_step_shipping { 
                background-image: url(http://www.footlocker.com/images/fl/checkout/header-shipping.gif);
        }
        #checkout_step_payment {
                background-image: url(http://www.footlocker.com/images/fl/checkout/header-payment.gif);
        }
        #checkout_step_review {
                background-image: url(http://www.footlocker.com/images/fl/checkout/header-review.gif);
        }
        #checkout_step_receipt {
                background-image: url(http://www.footlocker.com/images/fl/checkout/header-receipt.gif);
        }

                        </style>
                
        <meta property="og:title" content="adidas Originals Superstar 2 - Men's at Foot Locker" />
        <meta property="og:image" content="//images.footlocker.com/pi/677374/zoom/adidas-originals-superstar-2-mens" />
        <meta property="fb:app_id" content="118945454801413" />
        <meta name="title" content="adidas Originals Superstar 2 - Men's" />
        <meta property="og:type" content="product" />
        <meta property="og:url" content="http://www.footlocker.com/product/model:94651/adidas-originals-superstar-2-mens"/>
        <link rel="image_src" href="//images.footlocker.com/pi/677374/zoom/adidas-originals-superstar-2-mens" / >
        
<script type="text/javascript">
        var ie6 = false;
</script>

<!--[if lt IE 7]>
<script type="text/javascript">
        ie6 = true;
</script>



        <script type="text/javascript" src="http://www.footlocker.com/shared/scripts/jquery.bgiframe.pack.js"></script>
    

<![endif]-->

<script type="text/javascript">
var bubble = function() {
        
                var     thisWidth = 250; // minimum width
                var     thisHeight = 75; // minimum height
        //      var thisWidth = 283; // minimum width
        //      var thisHeight = 150; // minimum height
        
        var content = null;
        var wrapper = '<div id="bubbleContainer"><table id="bubble"><tr> <td class="top_left">&nbsp;</td> <td class="top_center" colspan="3">&nbsp;</td> <td class="top_right">&nbsp;</td></tr><tr> <td class="middle_left">&nbsp;</td> <td class="middle_center" colspan="3">&nbsp;</td> <td class="middle_right">&nbsp;</td></tr><tr> <td class="bottom_left">&nbsp;</td> <td class="bottom_center">&nbsp;</td> <td class="bottom_arrow">&nbsp;</td> <td class="bottom_center">&nbsp;</td> <td class="bottom_right">&nbsp;</td></tr></table></div>';
        var mapping = new Object();
        
                mapping['billTextMessageMoreInfo'] = '<span class=mobile_opt_info>By providing your cell number, you agree that Foot Locker may deliver to you at the wireless number provided advertising text messages using an automatic telephone dialing system, and that your consent is not a condition of purchasing any property, goods, or services from Foot Locker.  Foot Locker will send approximately 4-8 text messages per month.  After clicking \"submit,\" a text message will be sent to your phone.  Please reply with \"YES\" to ensure you continue to receive the latest updates.  You may unsubscribe from mobile text messages at any time by texting &quot;<span class=call_out>FOOTSTOP</span>&quot; to <span class=call_out>562537</span>.  Text &quot;<span class=call_out>HELP</span>&quot; to <span class=call_out>562537</span> for help.  Message and Data Rates may apply.</span>';
                mapping['pickupTextMessageMoreInfo'] = '<span class=mobile_opt_info>By providing your cell number, you agree that Foot Locker may deliver to you at the wireless number provided advertising text messages using an automatic telephone dialing system, and that your consent is not a condition of purchasing any property, goods, or services from Foot Locker.  Foot Locker will send approximately 4-8 text messages per month.  After clicking \"submit,\" a text message will be sent to your phone.  Please reply with \"YES\" to ensure you continue to receive the latest updates.  You may unsubscribe from mobile text messages at any time by texting &quot;<span class=call_out>FOOTSTOP</span>&quot; to <span class=call_out>562537</span>.  Text &quot;<span class=call_out>HELP</span>&quot; to <span class=call_out>562537</span> for help.  Message and Data Rates may apply.</span>';
                mapping['billCountryNotListed'] = 'If your country is not listed, you will need to pay by Western Union QUICK Pay. Please email us or call Customer Service at <span id=phNum>1.715.261.9588</span> for further information on placing your order.';
                mapping['shipCountryNotListed'] = 'If your country is not listed, you will need to pay by Western Union QUICK Pay. Please email us or call Customer Service at <span id=phNum>1.715.261.9588</span> for further information on placing your order.';
                mapping['countryNotListed'] = 'If your country is not listed, you will need to pay by Western Union QUICK Pay. Please email us or call Customer Service at <span id=phNum>1.715.261.9588</span> for further information on placing your order.';
                mapping['shipStreetAddrTooltip'] = 'Street addresses are required to ensure proper delivery for online orders. Orders sent to PO Boxes can only be sent via Standard delivery (5-6 Business days). Please allow up to 10 business days for delivery. If you do not have a street address (i.e. PO Box), please contact our Customer Service Department for assistance at <span id=\"phNum\">1.800.991.6815</span>.';
                mapping['multiShipMoreInfo'] = 'If you would like to ship one order to multiple addresses, please contact our Customer Service Department at <span id=\"phNum\">1.800.991.6815</span> immediately after placing your order on-line so that we may make the proper arrangements to ensure your packages are delivered.';
                
        

        return {
                initializeMoreInfoLinks:function() {
                        for (id in mapping) {
                                if ($("#" + id).length > 0) 
                                        $("#" + id).attr("href", "javascript:bubble.open('#" + id + "', '" + mapping[id] + "')");
                        }
                },
                open:function(selector, content, width, height) {
                        $("#bubbleContainer").remove();
                        
                        // abort if selector is not found
                        if ($(selector).length == 0) {
                                return;
                        }                       
                        
                        if (width != null && width > thisWidth) thisWidth = width;
                        if (height != null && height > thisHeight) thisHeight = height;
                        
                        $("body").prepend(wrapper);
                        $("#bubbleContainer .middle_center").html(content);
                        $("#bubbleContainer").css({width: thisWidth, height: thisHeight});
                        
                        var targetOffset = $(selector).offset();
                        var targetWidth = $(selector).width();
                        //var targetHeight = $(selector).height();
                        var left = targetOffset.left + ((targetWidth - thisWidth) / 2);
                        var top = targetOffset.top - $("#bubble").height();
                        
                        $("#bubbleContainer").css({top: top, left: left});

                        // IE
                        if (!jQuery.support.leadingWhitespace) {
                                var bottom_center_width = Math.ceil((thisWidth - 44 - 20 - 20) / 2);
                                $("#bubbleContainer .bottom_center").css({width: bottom_center_width});
                        }
                        
                        $(document).bind("click", bubble.close);
                        if (ie6) $("#bubbleContainer").bgiframe();
                },
                close:function() {
                        //$(document).unbind("click");
                        $("#bubbleContainer").remove();
                }
        }
}();

$(document).ready(function() { 
        bubble.initializeMoreInfoLinks(); 
        if (Tipped) {
                Tipped.create("#promoCodeToolTip_0", 'If you have received a special promotional source code from an email, flyer, online banner, ad, etc., please enter it in this field (only one code valid per order).', { skin: 'tiny', showOn: ['click', 'mouseover'], maxWidth: fitToViewport(350), closeButton: isTouchDevice() });
                $("#promoCodeToolTip_0").attr("title", "What is a promotional code?");
                Tipped.create("#militaryPromoCodeToolTip", 'Foot Locker offers a discount for current, or former, members of our military. Just submit the appropriate documentation to help us verify your service.', { skin: 'tiny', showOn: ['click', 'mouseover'], maxWidth: fitToViewport(350), closeButton: isTouchDevice() });
                $("#militaryPromoCodeToolTip").attr("title", "What is a military discount?");
        }
});
</script>


<script type="text/javascript">
        var borderImages = new Object();
        borderImages.top_left = new Image();
        borderImages.top_left.src = "http://www.footlocker.com/images/fl/new_checkout/bubble/top_left.png";
        borderImages.top_right = new Image();
        borderImages.top_right.src = "http://www.footlocker.com/images/fl/new_checkout/bubble/top_right.png";
        borderImages.top_center = new Image();
        borderImages.top_center.src = "http://www.footlocker.com/images/fl/new_checkout/bubble/top_center.png";
        borderImages.middle_left = new Image();
        borderImages.middle_left.src = "http://www.footlocker.com/images/fl/new_checkout/bubble/middle_left.png";
        borderImages.middle_right = new Image();
        borderImages.middle_right.src = "http://www.footlocker.com/images/fl/new_checkout/bubble/middle_right.png";
        borderImages.bottom_left = new Image();
        borderImages.bottom_left.src = "http://www.footlocker.com/images/fl/new_checkout/bubble/bottom_left.png";
        borderImages.bottom_right = new Image();
        borderImages.bottom_right.src = "http://www.footlocker.com/images/fl/new_checkout/bubble/bottom_right.png";
        borderImages.bottom_center = new Image();
        borderImages.bottom_center.src = "http://www.footlocker.com/images/fl/new_checkout/bubble/bottom_center.png";
        borderImages.bottom_arrow = new Image();
        borderImages.bottom_arrow.src = "http://www.footlocker.com/images/fl/new_checkout/bubble/bottom_arrow.png";     
</script>

<style type="text/css">
#bubbleContainer {
        position: absolute;
        z-index: 9999;
}

#bubble {
        font-family: Arial, Helvetica, sans-serif;
        font-size: 12px;
        border-collapse: collapse;
}

#bubble td {
        padding: 0;
}

#bubble td.top_left {
        background: transparent url(http://www.footlocker.com/images/fl/new_checkout/bubble/top_left.png) top right no-repeat;
        width: 20px;    
        height: 20px;
}

#bubble td.top_right {
        background: transparent url(http://www.footlocker.com/images/fl/new_checkout/bubble/top_right.png) top left no-repeat;
        width: 20px;
        height: 20px;
}

#bubble td.top_center {
        background: transparent url(http://www.footlocker.com/images/fl/new_checkout/bubble/top_center.png) top left repeat-x;
        height: 20px;
}

#bubble td.middle_left {
        background: transparent url(http://www.footlocker.com/images/fl/new_checkout/bubble/middle_left.png) top right repeat-y;
        width: 20px;
}

#bubble td.middle_right {
        background: transparent url(http://www.footlocker.com/images/fl/new_checkout/bubble/middle_right.png) top left repeat-y;
        width: 20px;
}

#bubble td.middle_center {
        background-color: white;
        text-align: left;
}

#bubble td.bottom_left {
        background: transparent url(http://www.footlocker.com/images/fl/new_checkout/bubble/bottom_left.png) top right no-repeat;
        width: 20px;
        height: 44px;   
}

#bubble td.bottom_right {
        background: transparent url(http://www.footlocker.com/images/fl/new_checkout/bubble/bottom_right.png) top left no-repeat;
        width: 20px;
        height: 44px;   
}

#bubble td.bottom_center {
        background: transparent url(http://www.footlocker.com/images/fl/new_checkout/bubble/bottom_center.png) top left repeat-x;
        height: 44px;   
}

#bubble td.bottom_arrow {
        background: transparent url(http://www.footlocker.com/images/fl/new_checkout/bubble/bottom_arrow.png) top right no-repeat;
        width: 44px;
        #width: 42px;
        height: 44px;
}

</style>

<!--[if lt IE 7]>

<script type="text/javascript">
        borderImages = new Object();
        borderImages.top_left = new Image();
        borderImages.top_left.src = "http://www.footlocker.com/images/fl/new_checkout/bubble/top_left.gif";
        borderImages.top_right = new Image();
        borderImages.top_right.src = "http://www.footlocker.com/images/fl/new_checkout/bubble/top_right.gif";
        borderImages.top_center = new Image();
        borderImages.top_center.src = "http://www.footlocker.com/images/fl/new_checkout/bubble/top_center.gif";
        borderImages.middle_left = new Image();
        borderImages.middle_left.src = "http://www.footlocker.com/images/fl/new_checkout/bubble/middle_left.gif";
        borderImages.middle_right = new Image();
        borderImages.middle_right.src = "http://www.footlocker.com/images/fl/new_checkout/bubble/middle_right.gif";
        borderImages.bottom_left = new Image();
        borderImages.bottom_left.src = "http://www.footlocker.com/images/fl/new_checkout/bubble/bottom_left.gif";
        borderImages.bottom_right = new Image();
        borderImages.bottom_right.src = "http://www.footlocker.com/images/fl/new_checkout/bubble/bottom_right.gif";
        borderImages.bottom_center = new Image();
        borderImages.bottom_center.src = "http://www.footlocker.com/images/fl/new_checkout/bubble/bottom_center.gif";
        borderImages.bottom_arrow = new Image();
        borderImages.bottom_arrow.src = "http://www.footlocker.com/images/fl/new_checkout/bubble/bottom_arrow.gif";     
</script>

<style type="text/css">
#bubble td.top_left {
        background: transparent url(http://www.footlocker.com/images/fl/new_checkout/bubble/top_left.gif) top right no-repeat;
}

#bubble td.top_right {
        background: transparent url(http://www.footlocker.com/images/fl/new_checkout/bubble/top_right.gif) top left no-repeat;
}

#bubble td.top_center {
        background: transparent url(http://www.footlocker.com/images/fl/new_checkout/bubble/top_center.gif) top left repeat-x;
}

#bubble td.middle_left {
        background: transparent url(http://www.footlocker.com/images/fl/new_checkout/bubble/middle_left.gif) top right repeat-y;
}

#bubble td.middle_right {
        background: transparent url(http://www.footlocker.com/images/fl/new_checkout/bubble/middle_right.gif) top left repeat-y;
}

#bubble td.bottom_left {
        background: transparent url(http://www.footlocker.com/images/fl/new_checkout/bubble/bottom_left.gif) top right no-repeat;       
}

#bubble td.bottom_right {
        background: transparent url(http://www.footlocker.com/images/fl/new_checkout/bubble/bottom_right.gif) top left no-repeat;
}

#bubble td.bottom_center {
        background: transparent url(http://www.footlocker.com/images/fl/new_checkout/bubble/bottom_center.gif) top left repeat-x;
}

#bubble td.bottom_arrow {
        background: transparent url(http://www.footlocker.com/images/fl/new_checkout/bubble/bottom_arrow.gif) top right no-repeat;
}
</style>
<![endif]-->
</head>
        
        <body class="en" >
                
                <!-- START DOCTYPE COMMON STYLES -->
<style>
    #helpheader {
        position: relative;
    }

    .chat-custserv-header-button {
        position: absolute;
        top: 0;
        left: 566px;
        z-index: 100;
    }

    .accordion_left {
        left: 8px;
        height: 39px;
    }

    .accordion_wrapper {
        height: 40px;
    }

    .accordion_right {
        top: 0;
        line-height: 40px;
    }

    #pdp_info {
        height: auto !important;
    }

    #storegrid ul {
        min-width: 905px;
        width: 885px;
    }

    .sticker_wrapper ul li .sticker_menu.hover, .sticker_wrapper ul li.hover .sticker_menu {
        display: block !important;
    }

    #storegrid ul li {
        padding-left: 0 !important;
    }

        #storegrid ul li p, #storegrid ul li div {
            margin-left: 25px;
        }

    #promoCodeFields {
        width: 100%;
    }

    #giftCardLabel, #addMoreContainer {
        width: 50px !important;
    }

    #editPaneHeader > table, #loginPane_edit > table {
        width: 100%;
    }

    .view_pane .data {
        width: 267px;
    }

    body:not(:-moz-handler-blocked) #billAddressPane_edit #editPaneHeader > table, body:not(:-moz-handler-blocked) #loginPane_edit > table, body:not(:-moz-handler-blocked) #billAddressPane_view .view_pane > table {
        position: relative;
        left: -181px;
    }

    .screenreader {
        position: absolute;
        left: -10000px;
        top: auto;
        width: 1px;
        height: 1px;
        overflow: hidden;
    }

    .screenreader_show {
        left: 0px;
        top: 50px;
        width: auto;
        height: 40px;
        padding: 5px 0;
        overflow: hidden;
        text-align: center;
        background-color: #fff;
        color: #000;
        border: 1px solid #000;
        display: block;
        border-radius: 5%;
    }

        .screenreader_show.close_menu {
            position: relative;
            right: 0px;
            top: 0px;
            font-size: 14px;
            line-height: 1;
            height: 25px;
            width: 50%;
        }

        .screenreader_show.skip {
            position: absolute;
            right: 0px;
            top: 0px;
            width: 100px;
            height: 40px;
            z-index: 1006;
        }

    #endeca_search_results .screenreader_show.skip {
        position: relative;
        bottom: 0px;
        right: 0px;
    }

    #social-tab a {
        float: left;
    }

    .screenreader.smaller {
        font-size: 12px;
    }

    #inner-fixed a.social {
        height: 32px;
        text-decoration: none;
        width: 47px;
        float: left;
        padding: 8px 0px;
    }

        #inner-fixed a.social:last-of-type {
            border-right: 1px solid #636363;
        }

    #skiptomaincontent .screenreader_show {
        height: 0px !important;
        width: 0px !important;
        background-color: transparent !important;
    }
</style>
<!-- END DOCTYPE COMMON STYLES -->

<script type="text/javascript" language="javascript" src="/ns/common/js/shadowbox-jquery.js"></script>
<script type="text/javascript" language="javascript">
    $(document).ready(function () {
        $("#helpheader").append("<div class=\"chat-custserv-header-button\"><a href=\"#\" onClick=\"startChatAndCobrowse(gIChannel, gServer, gAttachedData, prefillValues, agentOnlyValues, bEnterOnQueuePage); return false;\"><img src=\"http://www.footlocker.com/images/fl/global/pixel.gif\" height=\"186\" width=\"254\" border=\"0\" /></a></div>");
        var siteprotocol = window.location.protocol;
        var fbLoad = '<div id="fb_iframe"><iframe src="//www.facebook.com/plugins/like.php?href=http%3A%2F%2Fwww.facebook.com%2Ffootlocker&amp;send=false&amp;layout=button_count&amp;width=90&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font&amp;height=21" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:90px; height:21px;" allowTransparency="true"></iframe></div><a href="http://www.youtube.com/footlocker" title="Foot Locker YouTube Channel" target="_blank"><img src="http://www.footlocker.com/images/fl/global/pixel.gif" height="30" width="30" border="0" class="bg-sprite icon_yt" /></a><a href="http://www.instagram.com/footlocker" title="Foot Locker Instagram Page" target="_blank"><img src="http://www.footlocker.com/images/fl/global/pixel.gif" height="30" width="30" border="0" class="bg-sprite icon_inst" /></a><a href="http://www.twitter.com/footlocker" title="Foot Locker Twitter Page" target="_blank" ><img src="http://www.footlocker.com/images/fl/global/pixel.gif" height="30" width="30" border="0" class="bg-sprite icon_twit" /></a>';
        if (siteprotocol == 'http:') {
            $('#social-tab').empty();
            $('#social-tab').append(fbLoad);
        }
    });
</script>

<!-- START TABLET FIXES -->
<script type="text/javascript">
    var TOUCH_DEVICE = (typeof document.ontouchstart != "undefined") ? true : false;
    if (TOUCH_DEVICE) {
        $("<link/>", {
            rel: "stylesheet",
            type: "text/css",
            href: "/ns/common/css/tablet-styles.css?cd=0"
        }).appendTo("head");
    }
</script>
<!-- END TABLET FIXES -->

<style type="text/css">
    body {
        background-color: #000 !important;
    }
</style>

<noscript>
    <div class="noscript_error">
        <p>We're Sorry! You must have JavaScript enabled in your browser to experience all of the features of our site and to be able to place an order.</p>
        <p>To continue, please enable JavaScript by changing the preferences in your browser, then fresh the page.  <a href="http://www.footlocker.com/promotion/promoId:5002798/" title="JavaScript Help Page">Click Here</a> for detailed instructions.<br />You may also call <strong>1.800.863.8932</strong> to place your order!</p>
    </div>
</noscript>

<!--[if lte IE 7]>
<style type="text/css">
    .ie-seven-banner {
        width:100%;
        height:auto;
        font-family:Arial, Helvetica, sans-serif;
        color:#000000;
        background-color:#000;
        font-size:12px;
        text-align:center;

        overflow:visible;
        padding-top: 50px;
    }
</style>
<div class="ie-seven-banner">
    <img src="/ns/common/ie6-banner/IE7upgrade-banner.jpg" alt="Internet Explorer Upgrade Options" width="966" height="100" border="0" usemap="#banner" />
    <map id="banner" name="banner">
        <area shape="rect" coords="469,7,573,92" target="_blank" href="http://www.google.com/chrome/" manual_cm_sp="Header-_-IE6Upgrade-_-Chrome" alt="Download Google Chrome" title="Download Google Chrome" />
        <area shape="rect" coords="600,4,693,93" target="_blank" href="http://www.mozilla.com/en-US/firefox" manual_cm_sp="Header-_-IE6Upgrade-_-Firefox" alt="Download Firefox" title="Download Firefox" />
        <area shape="rect" coords="730,4,810,94" target="_blank" href="http://www.apple.com/safari/" manual_cm_sp="Header-_-IE6Upgrade-_-Safari" alt="Download Safari" title="Download Safari" />
        <area shape="rect" coords="850,6,941,93" target="_blank" href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home/" manual_cm_sp="Header-_-IE6Upgrade-_-IE" alt="Download a Newer Internet Explorer" title="Download a Newer Internet Explorer" />
    </map>
</div>
<![endif]-->
<!-- start bg div -->
<div id="bg-div">

    <!-- START TOP FIXED BAR -->

    <script type="text/javascript" src="/ns/header/js/fl-header-ui.js?cd=0"></script>
    <a class="screenreader skip" tabindex="2" href="#skiptomaincontent">Skip to main content</a>

    <div tabindex="-1" id="fixed-head-wrapper">
        <div id="inner-fixed">
            <!-- <div tabindex="2" id="social-tab"> -->
            <div tabindex="5" id="fb_iframe" title="Like Foot Locker on Facebook"><iframe src="//www.facebook.com/plugins/like.php?href=http%3A%2F%2Fwww.facebook.com%2Ffootlocker&amp;send=false&amp;layout=button_count&amp;width=90&amp;show_faces=false&amp;action=like&amp;colorscheme=light&amp;font&amp;height=21" scrolling="no" frameborder="0" title="Like Foot Locker on Facebook" style="border:none; overflow:hidden; width:90px; height:21px;" allowtransparency="true"></iframe></div></a>
            <a class="social" tabindex="6" href="http://www.twitter.com/footlocker" title="Follow Foot Locker on Twitter" target="_blank"><img src="http://www.footlocker.com/images/fl/global/pixel.gif" height="30" width="30" border="0" class="bg-sprite icon_twit" /></a>
            <a class="social" tabindex="7" href="http://www.instagram.com/footlocker" title="Follow Foot Locker on Instagram" target="_blank"><img src="http://www.footlocker.com/images/fl/global/pixel.gif" height="30" width="30" border="0" class="bg-sprite icon_inst" /></a>
            <a class="social" tabindex="8" href="http://www.youtube.com/footlocker" title="Subscribe to Foot Locker on Youtube" target="_blank"><img src="http://www.footlocker.com/images/fl/global/pixel.gif" height="30" width="30" border="0" class="bg-sprite icon_yt" /></a>
            <!-- </div> -->
            <div tabindex="9" title="Contact Us at 1-800-991-6815" id="phone-tab" class="bg-sprite icon_phone">
                <p>1.800.991.6815</p>
            </div>
            <div class="fixedBarNav">
                <div id="account-tab" class="bg-sprite icon_acct fixedBar-navBtn">
                    <a tabindex="10" href="https://www.footlocker.com/account/default/" title="My Account" rel="nofollow">My Account</a>
                </div>
                <!-- DROPDOWN MY ACCOUNT -->
                <div id="acct-drop" class="fixedBarDrop">

                    <div class="drop-inner bg-pattern">
                        <a href="https://www.footlocker.com/account/default/action--orderStatus/" title="Order Status" rel="nofollow">Order Status</a>
                    </div>
                    <div class="drop-inner bg-pattern">
                        <a href="https://www.footlocker.com/wishlist/" rel="nofollow" title="My Wish List">My Wish List</a>
                    </div>
                    <div class="drop-inner bg-pattern">
                        <a href="http://www.footlocker.com/promotion/promoId:5002563" title="VIP Club" rel="nofollow"><strong><span class="yellow">VIP</span> CLUB</strong></a>
                    </div>
                    <span class="shopAll_TabletOnly">
                        <div class="drop-inner bg-pattern">
                            <a href="https://www.footlocker.com/account/default/" title="My Account" rel="nofollow">Go To My Account</a>
                        </div>
                    </span>
                </div>
                <!-- END DROPDOWN MY ACCOUNT -->
            </div>
            <div class="fixedBarNav">
                <div id="help-tab" class="bg-sprite icon_help fixedBar-navBtn">
                    <a tabindex="11" href="http://www.footlocker.com/customerserv/" title="Help">Help</a>
                </div>
                <!-- DROPDOWN HELP -->
                <div id="help-drop" class="fixedBarDrop">
                    <div class="drop-inner bg-pattern">
                        <a tabindex="12" href="http://www.footlocker.com/customerserv/help:contactUs/" title="Contact Us">Contact Us</a>
                    </div>
                    <div class="drop-inner bg-pattern">
                        <a tabindex="13" href="#" title="Live Chat" rel="nofollow" onclick="cmCreateConversionEventTag('Live Chat',1,'Chat',0); cmCreateConversionEventTag('Live Chat',2,'Chat',0); startChatAndCobrowse(gIChannel, gServer, gAttachedData, prefillValues, agentOnlyValues, bEnterOnQueuePage); return false;"><span class="bg-sprite live-chat"></span><span class="icon-indent">Live Chat Online</span></a>
                    </div>
                    <div class="drop-inner bg-pattern">
                        <a tabindex="14" href="http://www.footlocker.com/customerserv/help:orderInfo/" rel="nofollow" title="Order Information">Order Information</a>
                    </div>
                    <div class="drop-inner bg-pattern">
                        <a tabindex="15" href="http://www.footlocker.com/customerserv/help:shipInfo/" rel="nofollow" title="Shipping Information">Shipping Information</a>
                    </div>
                    <div class="drop-inner bg-pattern">
                        <a tabindex="16" href="http://www.footlocker.com/customerserv/help:sportSpecificSizing/" rel="nofollow" title="Sizing Help">Sizing Help</a>
                    </div>
                    <div class="drop-inner bg-pattern">
                        <a tabindex="17" href="http://www.footlocker.com/customerserv/help:returnsExchanges/" rel="nofollow" title="Returns and Exchanges">Returns and Exchanges</a>
                    </div>
                    <div class="drop-inner bg-pattern">
                        <a tabindex="18" href="https://www.footlocker.com/feedback/" rel="nofollow" title="Site Feedback">Site Feedback</a>
                    </div>
                    <span class="shopAll_TabletOnly">
                        <div class="drop-inner bg-pattern">
                            <a tabindex="19" href="http://www.footlocker.com/customerserv/" title="Customer Service">View All Help Pages</a>
                        </div>
                    </span>
                </div>
                <!-- END DROPDOWN HELP -->
            </div>
            <div class="fixedBarNav">
                <div id="login-tab">
                    <div id="login-msg">
                        <div id="welcome_area"><span id="guest_welcome">Welcome, Guest, click here to <a title="Log In" href="javascript:openLoginDialogForID('guest_welcome_login', null, null, function() {updateWelcome()}, null,'Guest Message', 'Log In', 'true', 'true')" id="guest_welcome_login" rel="nofollow">log in</a> 
                                                                or <a title="Register" href="https://www.footlocker.com/account/default.cfm?action=accountCreate" rel="nofollow">register</a>.</span></div>
                    </div>
                </div>
            </div>
            <!-- start shipping details -->
            <div id="shipping-txt" style="display:none">
                <div class="global-banner">
                    <h2 tabindex="27" title="Free shipping on over 10,000 items or all orders over $75.">Free shipping on over 10,000 items* or all orders over $75.** Guaranteed to Fit***</h2>
                    <p tabindex="27"> Free shipping on over 10,000 items.*</p>
                    <p tabindex="27">* Free shipping offer valid only on eligible items. Eligible items will indicate "this item ships FREE" in blue type on the product's description page. Items in your cart that are not eligible are subject to shipping charges. Shipping will be automatically deducted at checkout. Valid only at footlocker.com. Offer is limited to standard delivery within the 48 contiguous United States and APO/FPO addresses. Excludes bulk orders and drop ships. Entire order must ship to a single address. Does not apply to prior purchases or open orders and cannot be combined with any other offer. Customer is responsible for shipping costs on returned merchandise. May not be used toward purchase of gift cards or team orders. Promotion may be modified or terminated at any time. Certain restrictions and exclusions may apply.</p>
                    <p tabindex="27">Free shipping on orders over $75.** </p>
                    <p tabindex="27">**Use promotion code IPFL2R52 at checkout. Promotion/source code box is located in step 4 of checkout. Order value must total $75 or more before services, taxes, shipping and handling. Valid online at footlocker.com, by phone or mail. Offer is limited to standard ground delivery within the 48 contiguous United States and APO/FPO addresses. Excludes bulk orders and drop ships. Entire order must be shipped to a single address. Does not apply to prior purchases or open orders and cannot be combined with any other offer. Customer is responsible for shipping costs on returned merchandise. May not be used toward purchase of gift cards or team orders. Promotion may be modified or terminated at any time. Certain restrictions and exclusions may apply.</p>
                    <p tabindex="27">Guaranteed to Fit!*** </p>
                    <p tabindex="27">*** Free shipping on exchanges is limited to standard delivery within the 48 contiguous United States and APO/FPO addresses. Excludes bulk orders and drop ships. If express or overnight shipping is requested you will be responsible for the full shipping cost. Entire order must ship to a single address. Standard return policy applies (details). Returned/exchanged items must be repackaged in the original boxes with all labels, and all products being returned or exchanged must be in new condition. All orders come with a prepaid return-shipping label which must be affixed to the package and shipped back within 60 days of receipt. Make sure to specify whether the item is being exchanged or a refund is being requested. Items not being exchanged will be refunded the full price minus a $6.99 restocking fee. Promotion may be modified or terminated at any time. Other restrictions and exclusions may apply.</p>
                    <p tabindex="27">*** Items may be exchanged or returned to any Foot Locker store nationwide. Shipping invoice must accompany any returns/exchanges. Standard return policy applies (details). Returned/exchanged items must be repackaged in the original boxes with all labels, and all products being returned or exchanged must be in new condition. Items will be refunded the full price paid minus shipping and handling fees paid on original order. Certain restrictions and exclusions may apply.</p>
                    <p tabindex="27">Click <a href="http://www.footlocker.com/fit">here</a> for details on our Fit Guarantee.</p> --><!-- Production -->
                    <!-- <p tabindex="27">Click <a href="http://www.footlocker.com/promotion/promoId:5002801">here</a> for details on our Fit Guarantee.</p><!-- UAT -->
                </div>
            </div>
            <!-- end shipping details -->

            <div id="checkout-tab" class="bg-sprite">

                <a href="http://www.footlocker.com/catalog/shoppingCart" rel="nofollow" title="View Shopping Cart"><img src="http://www.footlocker.com/images/fl/global/pixel.gif" height="48" width="65x" border="0" class="right" /></a>
                <div id="order_summary"><a tabindex="22" href="http://www.footlocker.com/catalog/shoppingCart" rel="nofollow" title="View Shopping Cart">
<span class="order_summary_value" id="order_summary_content">

        <span class="item_count_value">0</span> <span class="label">Items</span><span class="subtotal_value invisible">0</span>

</span>
</a></div>
            </div>




        </div>
    </div><!-- END FIXED TOP BAR -->

    <div id="toolbar-space"> </div>


    <!--- START HEADER --->
    <div id="header-wrap">

        <div id="header">

            <div id="mta-wrapper"></div> <!-- Merchandised Type Ahead wrapper -->
            <!-- START LOGO -->
            <div id="logo" class="bg-sprite icon_logo">
                <a tabindex="23" href="http://www.footlocker.com" title="Foot Locker Home"><img src="http://www.footlocker.com/images/fl/global/pixel.gif" width="132" height="91" alt="Foot Locker Home" border="0" /></a>
            </div><!-- END LOGO -->
            <!-- START SEARCH AREA -->
            <div id="search-wrapper" class="bg-sprite icon_search_bg">
                <!-- <p>What's <span class="red">trending:</span>
                    <a href="http://www.footlocker.com/_-_/keyword-nike+kobe+7?Ns=P_StyleSalePrice|1&cm_SORT=Price+%28High+to+Low%29/?cm_sp=Header-_-Trending-_-retros&cm=TnDdKobe" title="Nike Kobe 7">Kobe 7<span id="trending-arrow" class="bg-sprite icon_arrow"></span></a>
                    <a href="http://www.footlocker.com/_-_/keyword-jordan+retro+9?Ns=P_StyleSalePrice|1&cm_SORT=Price+%28High+to+Low%29/?cm_sp=Header-_-Trending-_-Retro9&cm=TnDdRetro9" title="Jordan Retro 9"> Retro 9 <span id="trending-arrow" class="bg-sprite icon_arrow"></span></a>
                    <a href="http://www.footlocker.com/_-_/keyword-nike+lebron+10?cm_sp=Header-_-Trending-_-Melo5&cm=TnDdlebron" title="Nike Lebron X"> Lebron 10<span id="trending-arrow" class="bg-sprite icon_arrow"></span></a> -->
                </p>

                <div id="searchform">
                    <form name="keywordSearch" action="/searchresults/" method="GET" id="searchform">

                        <input type="hidden" name="search" value="k">
                        <input tabindex="24" title="Enter your search" type="text" id="reduce_input_text_height" name="keyword" size="40" maxlength="40" placeholder="What are you searching for?" autocomplete="off" autofocus />
                        <a tabindex="25" href="javascript:mta.submitKeywordSearch();" title="Submit Search"><img id="sbmt-btn" class="bg-sprite submitbutton" src="http://www.footlocker.com/images/fl/global/pixel.gif" width="39" height="32" alt="GO" title="GO" vspace="1" border="0" align="absmiddle" /></a>
                    </form>
                </div>
            </div><!-- END SEARCH AREA -->
            <!-- SET AUTOFOCUS ON SEARCH FOR IE -->
            <script type="text/javascript">
                $(document).ready(function () {
                    $('#searchform input#reduce_input_text_height').focus();

                });
            </script>
            <!-- START SHIPPING DETAILS -->
            <div id="shipping-tab">
                <a tabindex="26" href="http://www.footlocker.com/searchresults/?N=1877&Ns=P_TopSalesAmount|1&cm_SORT=Best+Sellers" title="Free Shipping On Over 10,000 Items"><span class="yellow bold">FREE SHIPPING</span> on over 10,000 Items<br />and all orders over $75. <span class="small_font">Use Code <span class="yellow bold">IPFL2R52</span></span><br />Guaranteed to Fit!*</a>
                <a tabindex="27" class="ship_detail_link" href="#shipping-txt" rel="shadowbox;width=540;height=800" target="_blank" title="Free Shipping Details">DETAILS</a>
                <!--<span id="ship-logo" class="bg-sprite icon_ship"></span> -->
            </div>


            <!-- <script type="text/javascript" src="/ns/common/js/keyword-search.js"></script> -->
            <!-- ------ START GLOBAL NAV ------ -->
            <!--[if lt IE 7]>
            <style type="text/css">
                .dd-top-right {background-image:none}
                .dd-right {background-image:none}
                .dd-bottom-right {background-image:none}
                .dd-bottom-left {background-image:none}
                .dd-bottom {background-image:none}
            </style>
            <![endif]-->
            <!-- [if IE 8]>
            <style type="text/css">
                .core_height_mens {height:342px}
                .core_height_womens {height:420px}
                .core_height_kids {height:320px}

                .core_height_fangear {height:200px}
                .core_height_casual {height:190px}
                .core_height_accessories {height:210px}
                .core_height_brands {height:185}
                .core_height_store {height:70}

                .dd-right-1 {height:342px}
                .dd-right-2 {height:420px}
                .dd-right-3 {height:320px}
                .dd-right-4 {height:200px}
                .dd-right-5 {height:190px}
                .dd-right-6 {height:210px}
                .dd-right-7 {height:185px}
                .dd-right-8 {height:70px}
            </style>

            <![endif]-->

            <script type="text/javascript" src="//www.footlocker.com/shared/scripts/jquery.bgiframe.pack.js"></script>

            <!--[if lt IE 7]>
            <script type="text/javascript">
                $(document).ready(function() {
                    $(".sticker_wrapper ul li .sticker_menu").bgiframe();
                });
            </script>
            <![endif]-->
            <script>
                $(document).ready(function () {
                    $('#login-msg #guest_welcome_login').attr('title', 'Log In');
                    $('#login-msg a[href$=accountCreate]').attr('title', 'Register');
                    $('#login-msg a[href*=logout]').attr('title', 'Log Out');
                });
            </script>
            <div class="sticker_menu_container">

                <!-- START New Arrivals Item -->
                <div class="sticker_wrapper">

                    <ul>
                        <li>
                            <div class="navBtn navButtonNew"><a tabindex="40" href="http://www.footlocker.com/_-_/N-1z141xe?Ns=P_TopSalesAmount|1&cm_SORT=Best+Sellers" manual_cm_sp="TopNav-_-NewArrivals-_-Newall" title="Shop New Arrivals"><span class="new-arr">New Arrivals</span></a></div><a tabindex="40" class="screenreader expand_menu" title="Expand New Arrivals Menu" href="javascript:void(0);">Expand New Arrivals</a>

                            <div class="sticker_menu menu_store">
                                <div class="dd_top core_width_store"><div class="tablet_close"><div class="tablet_close_x">X CLOSE</div></div></div>
                                <div class="clear"></div>
                                <div class="sticker_menu_inner core_width_store core_height_store">

                                    <div class="dd_column_d di-right-8">


                                        <div class="m-title"><a tabindex="41" href="http://www.footlocker.com/Shoes/_-_/N-rjZ1z141xe" manual_cm_sp="TopNav-_-NewArrivals-_-Newshoes" title="Shop New Shoes">New Shoes</a></div>
                                        <div class="m-title"><a tabindex="42" href="http://www.footlocker.com/Clothing/_-_/N-rkZ1z141xe" manual_cm_sp="TopNav-_-NewArrivals-_-Newclothing" title="Shop New Clothing">New Clothing</a></div>
                                        <div class="m-title"><a tabindex="43" href="http://www.footlocker.com/Accessories/_-_/N-rlZ1z141xe" manual_cm_sp="TopNav-_-NewArrivals-_-Newaccess" title="Shop New Accessories">New Accessories</a></div>
                                        <div class="m-title shopAll_TabletOnly"><a tabindex="44" href="http://www.footlocker.com/_-_/N-1z141xe?Ns=P_TopSalesAmount|1&cm_SORT=Best+Sellers" manual_cm_sp="TopNav-_-NewArrivals-_-Newall" title="SHop New Arrivals">Shop All New Arrivals</a></div>
                                        <a tabindex="45" class="screenreader close_menu" title="Close New Arrivals Menu" href="javascript:void(0);">Close New Arrivals</a>
                                    </div>
                                </div><!-- close sticker_menu_inner -->
                            </div><!-- close sticker_menu -->
                        </li>
                    </ul>

                </div><!-- close sticker_wrapper -->
                <!-- END New Arrivals Item -->
                <!-- START Mens Drop Item -->
                <div class="sticker_wrapper">

                    <ul>
                        <li>
                            <div class="navBtn navButtonMens"><a tabindex="50" href="http://www.footlocker.com/Mens/_-_/N-24" manual_cm_sp="TopNav-_-Mens-_-Mensall" title="Shop Men's Shoes and Clothing"><span class="mens-txt">Men's</span></a></div><a tabindex="50" class="screenreader expand_menu" title="Expand Men's Products Menu" href="javascript:void(0);">Expand Men's</a>

                            <div class="sticker_menu menu_mens">
                                <div class="dd_top core_width_mens"></div>
                                <div class="clear"></div>
                                <div class="sticker_menu_inner core_width_mens core_height_mens">
                                    <!-- <div class="m-head"><a href="#" title="Mens | Foot Locker">Shop All Mens</a></div> -->


                                    <div class="dd_column di-right-1">


                                        <div class="m-title"><a tabindex="52" href="http://www.footlocker.com/Mens/Shoes/_-_/N-24Zrj" manual_cm_sp="TopNav-_-Mens-_-Mensshoes" title="Shop Men's Shoes">Men's Shoes</a></div>
                                        <div class="m-item"><a tabindex="53" href="http://www.footlocker.com/Mens/Basketball/Shoes/_-_/N-24ZfmZrj" manual_cm_sp="TopNav-_-Mens-_-Mensbasketballshoes" title="Shop Men's Basketball Shoes">Basketball</a></div>
                                        <div class="m-item"><a tabindex="54" href="http://www.footlocker.com/Mens/Boots/_-_/N-24Zhb" manual_cm_sp="TopNav-_-Mens-_-Mensboots" title="Shop Men's Boots">Boots</a></div>
                                        <div class="m-item"><a tabindex="55" href="http://www.footlocker.com/Mens/Casual/Shoes/_-_/N-24Z1h5Zrj" manual_cm_sp="TopNav-_-Mens-_-Menscasualshoes" title="Shop Men's Casual Shoes">Casual</a></div>
                                        <div class="m-item"><a tabindex="56" href="http://www.footlocker.com/Mens/Running/Shoes/_-_/N-24Zf9Zrj" manual_cm_sp="TopNav-_-Mens-_-Mensrunshoes" title="Shop Men's Running Shoes">Running</a></div>
                                        <div class="m-item"><a tabindex="57" href="http://www.footlocker.com/Mens/Sandals/_-_/N-24Zi3" manual_cm_sp="TopNav-_-Mens-_-Menssandals" title="Shop Men's Sandals">Sandals</a></div>
                                        <div class="m-item"><a tabindex="58" href="http://www.footlocker.com/Mens/Training/Shoes/_-_/N-24ZfhZrj" manual_cm_sp="TopNav-_-Mens-_-Menstrainshoes" title="Shop Men's Training Shoes">Training</a></div>
                                        <div class="m-item"><a tabindex="59" href="http://www.footlocker.com/Mens/Shoes/_-_/N-24ZrjZ1z141xe" manual_cm_sp="TopNav-_-Mens-_-Mensnewshoes" title="Shop Men's New Shoes">New Arrivals</a></div>
                                        <div class="m-item"><a tabindex="60" href="http://www.footlocker.com/Sale/Mens/Shoes/_-_/N-1z141ydZ24Zrj" manual_cm_sp="TopNav-_-Mens-_-Menssaleshoes" title="Shop Sale Men's Shoes">Sale</a></div>


                                        <div class="item_spacer"></div>

                                        <div class="m-title"><a tabindex="61" href="http://www.footlocker.com/Mens/Clothing/_-_/N-24Zrk" manual_cm_sp="TopNav-_-Mens-_-Mensclothing" title="Shop Men's Clothing">Men's Clothing</a></div>
                                        <div class="m-item"><a tabindex="62" href="http://www.footlocker.com/Mens/Socks/_-_/N-24Zn9" manual_cm_sp="TopNav-_-Mens-_-Menssocks" title="Shop Men's Socks">Socks</a></div>
                                        <div class="m-item"><a tabindex="63" href="http://www.footlocker.com/Mens/Hats/_-_/N-24Zlq" manual_cm_sp="TopNav-_-Mens-_-Menshats" title="Shop Men's Hats">Hats</a></div>
                                        <div class="m-item"><a tabindex="64" href="http://www.footlocker.com/Mens/Hoodies/_-_/N-24Z1li" manual_cm_sp="TopNav-_-Mens-_-Menshoodies" title="Shop Men's Hoodies">Hoodies</a></div>
                                        <div class="m-item"><a tabindex="65" href="http://www.footlocker.com/Mens/Jackets/_-_/N-24Zj7" manual_cm_sp="TopNav-_-Mens-_-Mensjackets" title="Shop Men's Jackets">Jackets</a></div>
                                        <div class="m-item"><a tabindex="66" href="http://www.footlocker.com/Mens/Pants/_-_/N-24Zjr" manual_cm_sp="TopNav-_-Mens-_-Menspants" title="Shop Men's Pants">Pants</a></div>
                                        <div class="m-item"><a tabindex="67" href="http://www.footlocker.com/Mens/Shorts/_-_/N-24Zjf" manual_cm_sp="TopNav-_-Mens-_-Mensshorts" title="Shop Men's Shorts">Shorts</a></div>
                                        <div class="m-item"><a tabindex="68" href="http://www.footlocker.com/Mens/T-Shirts/_-_/N-24Zif" manual_cm_sp="TopNav-_-Mens-_-Menstees" title="Shop Men's T-shirts">T-Shirts</a></div>
                                        <div class="m-item"><a tabindex="69" href="http://www.footlocker.com/Mens/Clothing/_-_/N-24ZrkZ1z141xe" manual_cm_sp="TopNav-_-Mens-_-Mensnewcloth" title="Shop Men's New Clothing">New Arrivals</a></div>
                                        <div class="m-item"><a tabindex="70" href="http://www.footlocker.com/Sale/Mens/Clothing/_-_/N-1z141ydZ24Zrk" manual_cm_sp="TopNav-_-Mens-_-Menssalecloth" title="Shop Sale Men's Clothing">Sale</a></div>

                                        <div class="item_spacer"></div>

                                        <div class="m-title shopAll_TabletOnly"><a tabindex="71" href="http://www.footlocker.com/Mens/_-_/N-24" manual_cm_sp="TopNav-_-Mens-_-Mensall" title="Shop Men's Shoes, Clothing">Shop All Men's</a></div>
                                    </div>

                                    <div class="dd_column_a di-right-1">
                                        <div class="m-item"><p>Shoe Brands</p></div>
                                        <div class="m-item"><a tabindex="72" href="http://www.footlocker.com/Mens/adidas/Shoes/_-_/N-24ZzcZrj" manual_cm_sp="TopNav-_-Mens-_-Mensadidas" title="Shop Men's adidas Shoes">adidas</a></div>
                                        <div class="m-item"><a tabindex="73" href="http://www.footlocker.com/Mens/ASICS/Shoes/_-_/N-24Z10iZrj" manual_cm_sp="TopNav-_-Mens-_-Menasicss" title="Shop Men's ASICS Shoes">ASICS&reg;</a></div>
                                        <div class="m-item"><a tabindex="74" href="http://www.footlocker.com/Mens/Converse/_-_/N-24Z108" manual_cm_sp="TopNav-_-Mens-_-Mensconv" title="Shop Men's Converse Shoes">Converse</a></div>
                                        <div class="m-item"><a tabindex="75" href="http://www.footlocker.com/Mens/Jordan/Shoes/_-_/N-24Z11cZrj" manual_cm_sp="TopNav-_-Mens-_-Mensjordan" title="Shop Men's Jordan Shoes">Jordan</a></div>
                                        <div class="m-item"><a tabindex="76" href="http://www.footlocker.com/Mens/Nike/Shoes/_-_/N-24ZzzZrj" manual_cm_sp="TopNav-_-Mens-_-Mensnike" title="Shop Men's Nike Shoes">Nike</a></div>
                                        <div class="m-item"><a tabindex="77" href="http://www.footlocker.com/Mens/Reebok/Shoes/_-_/N-24ZzlZrj" manual_cm_sp="TopNav-_-Mens-_-Mensreebok" title="Shop Men's Reebok Shoes">Reebok</a></div>

                                        <div class="m-item"><a tabindex="78" href="http://www.footlocker.com/Mens/Timberland/_-_/N-24Zzt" manual_cm_sp="TopNav-_-Mens-_-Menstimberland" title="Shop Men's Timberland Boots">Timberland</a></div>
                                        <div class="m-item"><a tabindex="79" href="http://www.footlocker.com/Mens/Under-Armour/Shoes/_-_/N-24Z10qZrj" manual_cm_sp="TopNav-_-Mens-_-Mensua" title="Shop Men's Under Armour Shoes">Under Armour</a></div>

                                        <div class="item_spacer"></div>

                                        <div class="m-item"><p>Clothing Brands</p></div>

                                        <div class="m-item"><a tabindex="80" href="http://www.footlocker.com/Mens/adidas/Clothing/_-_/N-24ZzcZrk" manual_cm_sp="TopNav-_-Mens-_-Mensadidascl" title="Shop Men's adidas Clothing">adidas </a></div>
                                        <div class="m-item"><a tabindex="81" href="http://www.footlocker.com/Mens/adidas-Originals/Clothing/_-_/N-24ZzrZrk" manual_cm_sp="TopNav-_-Mens-_-Mensorigcl" title="Shop Men's adidas Originals Clothing">adidas Originals</a></div>
                                        <div class="m-item"><a tabindex="82" href="http://www.footlocker.com/Mens/Jordan/Clothing/_-_/N-24Z11cZrk" manual_cm_sp="TopNav-_-Mens-_-Mensjordancl" title="Shop Men's Jordan Clothing">Jordan</a></div>
                                        <div class="m-item"><a tabindex="83" href="http://www.footlocker.com/Mens/Nike/Clothing/_-_/N-24ZzzZrk" manual_cm_sp="TopNav-_-Mens-_-Mensnikecl" title="Shop Men's Nike Clothing">Nike</a></div>
                                        <div class="m-item"><a tabindex="84" href="http://www.footlocker.com/Mens/PUMA/Clothing/_-_/N-24ZzqZrk" manual_cm_sp="TopNav-_-Mens-_-Menspumacl" title="Shop Men's PUMA Clothing">PUMA</a></div>
                                        <div class="m-item"><a tabindex="85" href="http://www.footlocker.com/Mens/Under-Armour/Clothing/_-_/N-24Z10qZrk" manual_cm_sp="TopNav-_-Mens-_-Mensuacl" title="Shop Men's Under Armour Clothing">Under Armour</a></div>

                                        <a tabindex="99" class="screenreader close_menu" title="Close Men's Products Menu" href="javascript:void(0);">Close Men's</a>
                                    </div>
                                </div><!-- close sticker_menu_inner -->
                            </div><!-- close sticker_menu -->
                        </li>
                    </ul>

                </div>
                <!-- END Mens Drop Item -->
                <!-- START Womens Drop Item -->
                <div class="sticker_wrapper">

                    <ul>
                        <li>
                            <div class="navBtn navButtonWomens"><a tabindex="100" href="http://www.footlocker.com/Womens/_-_/N-25" manual_cm_sp="TopNav-_-Womens-_-Womensall" title="Shop Women's Shoes and Clothing"><span class="womens-txt">Women's</span></a></div> <a tabindex="100" class="screenreader expand_menu" title="Expand Women's Products Menu" href="javascript:void(0);">Expand Women's</a>

                            <div class="sticker_menu menu_womens">
                                <div class="dd_top core_width_womens"></div>
                                <div class="clear"></div>
                                <div class="sticker_menu_inner core_width_womens core_height_womens">


                                    <div class="dd_column di-right-2">

                                        <div class="m-title"><a tabindex="102" href="http://www.footlocker.com/Womens/Shoes/_-_/N-25Zrj" manual_cm_sp="TopNav-_-Womens-_-Womensshoes" title="Shop Women's Shoes">Women's Shoes</a></div>
                                        <div class="m-item"><a tabindex="103" href="http://www.footlocker.com/Womens/Basketball/Shoes/_-_/N-25ZfmZrj" manual_cm_sp="TopNav-_-Womens-_-Womensbball" title="Shop Women's Basketball Shoes">Basketball</a></div>
                                        <div class="m-item"><a tabindex="104" href="http://www.footlocker.com/Womens/Boots/_-_/N-25Zhb" manual_cm_sp="TopNav-_-Womens-_-TnDdWomensboots" title="Shop Women's Boots">Boots</a></div>
                                        <div class="m-item"><a tabindex="105" href="http://www.footlocker.com/Womens/Casual/Shoes/_-_/N-25Z1h5Zrj" manual_cm_sp="TopNav-_-Womens-_-Womenscasual" title="Shop Women's Casual Shoes">Casual</a></div>
                                        <div class="m-item"><a tabindex="106" href="http://www.footlocker.com/Womens/Running/Shoes/_-_/N-25Zf9Zrj" manual_cm_sp="TopNav-_-Womens-_-Womensrun" title="Shop Women's Running Shoes">Running</a></div>
                                        <div class="m-item"><a tabindex="107" href="http://www.footlocker.com/Womens/Sandals/_-_/N-25Zi3" manual_cm_sp="TopNav-_-Womens-_-Womenssandals" title="Shop Women's Sandals">Sandals</a></div>
                                        <div class="m-item"><a tabindex="108" href="http://www.footlocker.com/Womens/Training/Shoes/_-_/N-25ZfhZrj" manual_cm_sp="TopNav-_-Womens-_-Womenstrain" title="Shop Women's Training Shoes">Training</a></div>
                                        <div class="m-item"><a tabindex="109" href="http://www.footlocker.com/Womens/Volleyball/Shoes/_-_/N-25ZfdZrj" manual_cm_sp="TopNav-_-Womens-_-Womensall" title="Shop Women's Volleyball Shoes">Volleyball</a></div>
                                        <div class="m-item"><a tabindex="110" href="http://www.footlocker.com/Womens/Walking/Shoes/_-_/N-25ZfoZrj" manual_cm_sp="TopNav-_-Womens-_-Womensvball" title="Shop Women's Volleyball Shoes">Walking</a></div>
                                        <div class="m-item"><a tabindex="111" href="http://www.footlocker.com/Womens/Shoes/_-_/N-25ZrjZ1z141xe" manual_cm_sp="TopNav-_-Womens-_-Womensnewshoes" title="Shop Women's New Shoes">New Arrivals</a></div>
                                        <div class="m-item"><a tabindex="112" href="http://www.footlocker.com/Sale/Womens/Shoes/_-_/N-1z141ydZ25Zrj" manual_cm_sp="TopNav-_-Womens-_-Womenssaleshoes" title="Shop Sale Women's Shoes">Sale</a></div>

                                        <div class="item_spacer"></div>

                                        <div class="m-title"><a tabindex="113" href="http://www.footlocker.com/Womens/Clothing/_-_/N-25Zrk" manual_cm_sp="TopNav-_-Womens-_-Womensclothing" title="Shop Women's Clothing">Women's Clothing</a></div>
                                        <div class="m-item"><a tabindex="114" href="http://www.footlocker.com/Womens/Socks/_-_/N-25Zn9" manual_cm_sp="TopNav-_-Womens-_-Womenssocks" title="Shop Women's Socks">Socks</a></div>
                                        <div class="m-item"><a tabindex="115" href="http://www.footlocker.com/Womens/Hoodies/_-_/N-25Z1li" manual_cm_sp="TopNav-_-Womens-_-Womenshoodies" title="Shop Women's Hoodies">Hoodies</a></div>
                                        <div class="m-item"><a tabindex="116" href="http://www.footlocker.com/Womens/Jackets/_-_/N-25Zj7" manual_cm_sp="TopNav-_-Womens-_-Womensjackets" title="Shop Women's Jackets">Jackets</a></div>
                                        <div class="m-item"><a tabindex="117" href="http://www.footlocker.com/Womens/Shorts/_-_/N-25Zjf" manual_cm_sp="TopNav-_-Womens-_-Womensshorts" title="Shop Women's Shorts">Shorts</a></div>
                                        <div class="m-item"><a tabindex="118" href="http://www.footlocker.com/Womens/Sports-Bras/_-_/N-25Zkc" manual_cm_sp="TopNav-_-Womens-_-Womensbras" title="Shop Sports Bras">Sports bras</a></div>
                                        <div class="m-item"><a tabindex="119" href="http://www.footlocker.com/Womens/Tanks-Singlets/_-_/N-25Zij" manual_cm_sp="TopNav-_-Womens-_-Womenstanks" title="Shop Women's Tank Tops">Tank tops</a></div>
                                        <div class="m-item"><a tabindex="120" href="http://www.footlocker.com/Womens/T-Shirts/_-_/N-25Zif" manual_cm_sp="TopNav-_-Womens-_-Womenstees" title="Shop Women's T-shirts">T-Shirts</a></div>
                                        <div class="m-item"><a tabindex="121" href="http://www.footlocker.com/Womens/Pants-Workout-Pants/_-_/N-25Zjv" manual_cm_sp="TopNav-_-Womens-_-Womensworkpants" title="Shop Women's Workout Pants">Workout Pants</a></div>
                                        <div class="m-item"><a tabindex="122" href="http://www.footlocker.com/Womens/Capris/_-_/N-25Zjs" manual_cm_sp="TopNav-_-Womens-_-Womenscapris" title="Shop Women's Capris">Capris</a></div>
                                        <div class="m-item"><a tabindex="123" href="http://www.footlocker.com/Womens/Clothing/_-_/N-25ZrkZ1z141xe" manual_cm_sp="TopNav-_-Womens-_-Womensnewshoes" title="Shop Women's New Clothing">New Arrivals</a></div>
                                        <div class="m-item"><a tabindex="124" href="http://www.footlocker.com/Sale/Womens/Clothing/_-_/N-1z141ydZ25Zrk" manual_cm_sp="TopNav-_-Womens-_-Womenssalecl" title="Shop Sale Women's Clothing">Sale</a></div>

                                        <div class="item_spacer"></div>

                                        <div class="m-title shopAll_TabletOnly"><a tabindex="125" href="http://www.footlocker.com/Womens/_-_/N-25" manual_cm_sp="TopNav-_-Womens-_-Womensall" title="Shop Women's Shoes, Clothing">Shop All Women's</a></div>
                                    </div>

                                    <div class="dd_column_b di-right-2">
                                        <div class="m-item"><p>Shoe Brands</p></div>
                                        <div class="m-item"><a tabindex="126" href="http://www.footlocker.com/Womens/adidas/Shoes/_-_/N-25ZzcZrj" manual_cm_sp="TopNav-_-Womens-_-Womensadidas" title="Shop Women's adidas Shoes">adidas</a></div>
                                        <div class="m-item"><a tabindex="127" href="http://www.footlocker.com/Womens/ASICS/Shoes/_-_/N-25Z10iZrj" manual_cm_sp="TopNav-_-Womens-_-Womensasics" title="Shop Women's ASICS Shoes">ASICS</a></div>
                                        <div class="m-item"><a tabindex="128" href="http://www.footlocker.com/Womens/Brooks/Shoes/_-_/N-25Z12aZrj" manual_cm_sp="TopNav-_-Womens-_-Womensbrooks" title="Shop Women's Brooks Shoes">Brooks</a></div>
                                        <div class="m-item"><a tabindex="129" href="http://www.footlocker.com/Womens/Converse/_-_/N-25Z108" manual_cm_sp="TopNav-_-Womens-_-Womenscons" title="Shop Women's Converse Shoes">Converse</a></div>

                                        <div class="m-item"><a tabindex="130" href="http://www.footlocker.com/Womens/Mizuno/Shoes/_-_/N-25Z104Zrj" manual_cm_sp="TopNav-_-Womens-_-Womensmizuno" title="Shop Women's Mizuno Shoes">Mizuno</a></div>
                                        <div class="m-item"><a tabindex="131" href="http://www.footlocker.com/Womens/New-Balance/Shoes/_-_/N-25Z10eZrj" manual_cm_sp="TopNav-_-Womens-_-Womensnb" title="Shop Women's New Balance Shoes">New Balance</a></div>
                                        <div class="m-item"><a tabindex="132" href="http://www.footlocker.com/Womens/Nike/Shoes/_-_/N-25ZzzZrj" manual_cm_sp="TopNav-_-Womens-_-Womensnike" title="Shop Women's Nike Shoes">Nike</a></div>
                                        <div class="m-item"><a tabindex="133" href="http://www.footlocker.com/Womens/PUMA/Shoes/_-_/N-25ZzqZrj" manual_cm_sp="TopNav-_-Womens-_-Womenspuma" title="Shop Women's PUMA Shoes">PUMA</a></div>
                                        <div class="m-item"><a tabindex="134" href="http://www.footlocker.com/Womens/Reebok/Shoes/_-_/N-25ZzlZrj" manual_cm_sp="TopNav-_-Womens-_-Womensreebok" title="Shop Women's Reebok Shoes">Reebok</a></div>
                                        <div class="m-item"><a tabindex="135" href="http://www.footlocker.com/Womens/Saucony/Shoes/_-_/N-25ZzoZrj" manual_cm_sp="TopNav-_-Womens-_-Womenssaucony" title="Shop Women's Saucony Shoes">Saucony</a></div>
                                        <div class="m-item"><a tabindex="136" href="http://www.footlocker.com/Womens/Under-Armour/Shoes/_-_/N-25Z10qZrj" manual_cm_sp="TopNav-_-Womens-_-Womensua" title="Shop Women's Under Armour Shoes">Under Armour</a></div>

                                        <div class="item_spacer"></div>

                                        <div class="m-item"><p>Clothing Brands</p></div>
                                        <div class="m-item"><a tabindex="137" href="http://www.footlocker.com/Womens/adidas/Clothing/_-_/N-25ZzcZrk" manual_cm_sp="TopNav-_-Womens-_-Womensadidascl" title="Shop Women's adidas Clothing">adidas</a></div>
                                        <div class="m-item"><a tabindex="138" href="http://www.footlocker.com/Womens/adidas-Originals/Clothing/_-_/N-25ZzrZrk" manual_cm_sp="TopNav-_-Womens-_-Womensorigcl" title="Shop Women's adidas Originals Clothing">adidas Originals</a></div>
                                        <div class="m-item"><a tabindex="139" href="http://www.footlocker.com/Womens/Mizuno/Clothing/_-_/N-25Z104Zrk" manual_cm_sp="TopNav-_-Womens-_-Womensmizunocl" title="Shop Women's Mizuno Clothing">Mizuno</a></div>
                                        <div class="m-item"><a tabindex="140" href="http://www.footlocker.com/Womens/Nike/Clothing/_-_/N-25ZzzZrk" manual_cm_sp="TopNav-_-Womens-_-Womensnikecl" title="Shop Women's Nike Clothing">Nike</a></div>
                                        <div class="m-item"><a tabindex="141" href="http://www.footlocker.com/Womens/PUMA/Clothing/_-_/N-25ZzqZrk" manual_cm_sp="TopNav-_-Womens-_-Womenspumacl" title="Shop Women's PUMA Clothing">PUMA</a></div>

                                        <div class="m-item"><a tabindex="142" href="http://www.footlocker.com/Womens/Saucony/Clothing/_-_/N-25ZzoZrk" manual_cm_sp="TopNav-_-Womens-_-Womenssaucony" title="Shop Women's Saucony Clothing">Saucony</a></div>
                                        <div class="m-item"><a tabindex="143" href="http://www.footlocker.com/Womens/Under-Armour/Clothing/_-_/N-25Z10qZrk" manual_cm_sp="TopNav-_-Womens-_-Womensuacl" title="Shop Women's Under Armour Clothing">Under Armour</a></div>

                                        <a tabindex="199" class="screenreader close_menu" title="Close Women's Products Menu" href="javascript:void(0);">Close Women's</a>
                                    </div>
                                </div><!-- close sticker_menu_inner -->
                            </div><!-- close sticker_menu -->
                        </li>
                    </ul>

                </div>
                <!-- END Womens Drop Item -->
                <!-- START Kids Drop Item -->
                <div class="sticker_wrapper">

                    <ul>
                        <li>
                            <div class="navBtn navButtonKids"><a tabindex="200" href="http://www.footlocker.com/_-_/keyword-kids" manual_cm_sp="TopNav-_-Kids-_-Kidsall" title="Shop Kids' Shoes and Clothing"><span class="kids-txt">Kids</span></a></div><a tabindex="200" class="screenreader expand_menu" title="Expand Kids' Product Menu" href="javascript:void(0);">Expand Kids'</a>

                            <div class="sticker_menu menu_kids">
                                <div class="dd_top core_width_kids"></div>
                                <div class="clear"></div>
                                <div class="sticker_menu_inner core_width_kids core_height_kids">

                                    <div class="dd_column_f di-right-3">
:15
                                        <div class="m-title"><a tabindex="202" href="http://www.footlocker.com/_-_/keyword-kids+shoes" manual_cm_sp="TopNav-_-Kids-_-Kidsshoes" title="Shop Kids' Shoes">Kids' Shoes</a></div>
                                        <div class="m-item"><a tabindex="203" href="http://www.footlocker.com/_-_/keyword-kids+basketball+shoes" manual_cm_sp="TopNav-_-Kids-_-Kidsbball" title="Shop Kids' Basketball Shoes">Basketball</a></div>
                                        <div class="m-item"><a tabindex="204" href="http://www.footlocker.com/_-_/keyword-kids+boots" manual_cm_sp="TopNav-_-Kids-_-Kidsboots" title="Shop Kids' Boots">Boots</a></div>
                                        <div class="m-item"><a tabindex="205" href="http://www.footlocker.com/_-_/keyword-kids+casual+shoes" manual_cm_sp="TopNav-_-Kids-_-Kidscasualshoes" title="Shop Kids' Casual Shoes">Casual</a></div>
                                        <div class="m-item"><a tabindex="206" href="http://www.footlocker.com/_-_/keyword-kids+running+shoes" manual_cm_sp="TopNav-_-Kids-_-Kidsrunshoes" title="Shop Kids' Running Shoes">Running</a></div>
                                        <div class="m-item"><a tabindex="207" href="http://www.footlocker.com/_-_/N-1z141xe/keyword-kids+shoes" manual_cm_sp="TopNav-_-Kids-_-Kidsnewshoes" title="Shop Kids New Shoes">New Arrivals</a></div>
                                        <div class="m-item"><a tabindex="208" href="http://www.footlocker.com/_-_/keyword-sale+kids+shoes" manual_cm_sp="TopNav-_-Kids-_-Kidssaleshoes" title="Shop Sale Kids' Shoes">Sale</a></div>

                                        <div class="item_spacer"></div>







                                        <div class="m-title"><a tabindex="210" href="http://www.footlocker.com/_-_/keyword-kids+clothing" manual_cm_sp="TopNav-_-Kids-_-Kidsclothing" title="Shop Kids' Clothing">Kids' Clothing</a></div>
                                        <div class="m-item"><a tabindex="211" href="http://www.footlocker.com/Socks/_-_/N-n9/keyword-kids" manual_cm_sp="TopNav-_-Kids-_-Kidssocks" title="Shop Kids' Socks">Socks</a></div>
                                        <div class="m-item"><a tabindex="212" href="http://www.footlocker.com/_-_/keyword-kids+hoodies" manual_cm_sp="TopNav-_-Kids-_-Kidshoodies" title="Shop Kids' Hoodies">Hoodies</a></div>
                                        <div class="m-item"><a tabindex="213" href="http://www.footlocker.com/_-_/keyword-kids+pants" manual_cm_sp="TopNav-_-Kids-_-Kidspants" title="Shop Kids' Pants">Pants</a></div>
                                        <div class="m-item"><a tabindex="214" href="http://www.footlocker.com/_-_/keyword-kids+shorts" manual_cm_sp="TopNav-_-Kids-_-Kidsshorts" title="Shop Kids' Shorts">Shorts</a></div>
                                        <div class="m-item"><a tabindex="215" href="http://www.footlocker.com/_-_/keyword-kids+t+shirts" manual_cm_sp="TopNav-_-Kids-_-Kidstees" title="Shop Kids' T-shirts">T-Shirts</a></div>
                                        <div class="m-item"><a tabindex="216" href="http://www.footlocker.com/_-_/N-1z141xe/keyword-kids+clothing" manual_cm_sp="TopNav-_-Kids-_-Kidsnewcl" title="Shop Kids' New Clothing">New Arrivals</a></div>
                                        <div class="m-item"><a tabindex="217" href="http://www.footlocker.com/_-_/keyword-sale+kids+clothing" manual_cm_sp="TopNav-_-Kids-_-Kidsnewcl" title="Shop Sale Kids' Clothing">Sale</a></div>

                                        <div class="item_spacer"></div>







                                        <div class="m-title shopAll_TabletOnly"><a tabindex="218" href="http://www.footlocker.com/_-_/keyword-kids" manual_cm_sp="TopNav-_-Kids-_-Kidsall" title="Shop Kids' Shoes, Clothing">Shop All Kids</a></div>
                                    </div>

                                    <div class="dd_column_b di-right-3">
                                        <div class="m-item"><p>Shoe Brands</p></div>
                                        <div class="m-item"><a tabindex="220" href="http://www.footlocker.com/_-_/keyword-kids+adidas+shoes" manual_cm_sp="TopNav-_-Kids-_-Kidsadidas" title="Shop Kids' adidas Shoes">adidas</a></div>
                                        <div class="m-item"><a tabindex="221" href="http://www.footlocker.com/_-_/keyword-kids+converse+shoes" manual_cm_sp="TopNav-_-Kids-_-Kidscons" title="Shop Kids' Converse Shoes">Converse</a></div>
                                        <div class="m-item"><a tabindex="222" href="http://www.footlocker.com/_-_/keyword-kids+jordan+shoes" manual_cm_sp="TopNav-_-Kids-_-Kidsjordan" title="Shop Kids' Jordan Shoes">Jordan</a></div>
                                        <div class="m-item"><a tabindex="223" href="http://www.footlocker.com/_-_/keyword-kids+new+balance+shoes" manual_cm_sp="TopNav-_-Kids-_-Kidsnb" title="Shop Kids' New Balance Shoes">New Balance</a></div>
                                        <div class="m-item"><a tabindex="224" href="http://www.footlocker.com/_-_/keyword-kids+nike+shoes" manual_cm_sp="TopNav-_-Kids-_-Kidsnike" title="Shop Kids' Nike Shoes">Nike</a></div>
                                        <div class="m-item"><a tabindex="225" href="http://www.footlocker.com/_-_/keyword-kids+puma+shoes" manual_cm_sp="TopNav-_-Kids-_-Kidspuma" title="Shop Kids' PUMA Shoes">PUMA</a></div>
                                        <div class="m-item"><a tabindex="226" href="http://www.footlocker.com/_-_/keyword-kids+timberland+boots" manual_cm_sp="TopNav-_-Kids-_-Kidstimb" title="Shop Kids' Timberland Boots">Timberland</a></div>
                                        <div class="m-item"><a tabindex="227" href="http://www.footlocker.com/_-_/keyword-kids+under+armour+shoes" manual_cm_sp="TopNav-_-Kids-_-Kidsuashoes" title="Shop Kids' Under Armour Shoes">Under Armour</a></div>



                                        <div class="item_spacer"></div>

                                        <div class="m-item"><p>Clothing Brands</p></div>
                                        <div class="m-item"><a tabindex="230" href="http://www.footlocker.com/_-_/keyword-kids+adidas+clothing" manual_cm_sp="TopNav-_-Kids-_-Kidsadidascl" title="Shop Kids' adidas Clothing">adidas</a></div>
                                        <div class="m-item"><a tabindex="231" href="http://www.footlocker.com/_-_/keyword-kids+jordan+clothing" manual_cm_sp="TopNav-_-Kids-_-Kidsjordancl" title="Shop Kids' Jordan Clothing">Jordan</a></div>
                                        <div class="m-item"><a tabindex="232" href="http://www.footlocker.com/_-_/keyword-kids+nike+clothing" manual_cm_sp="TopNav-_-Kids-_-Kidsnikecl" title="Shop Kids' Nike Clothing">Nike</a></div>
                                        <div class="m-item"><a tabindex="233" href="http://www.footlocker.com/_-_/keyword-kids+under+armour+clothing" manual_cm_sp="TopNav-_-Kids-_-Kidsuacl" title="Shop Kids' Under Armour Clothing">Under Armour</a></div>
                                    </div>

                                    <div class="dd_column_end di-right-3">
                                        <div class="m-title"><a tabindex="240" href="http://www.footlocker.com/Boys/Shoes/_-_/N-1gfZrj" manual_cm_sp="TopNav-_-Kids-_-Boysshoes" title="Shop Boys Shoes">Boys' Shoes</a></div>
                                        <div class="m-title"><a tabindex="241" href="http://www.footlocker.com/Girls/Shoes/_-_/N-1gkZrj" manual_cm_sp="TopNav-_-Kids-_-Girlsshoes" title="Shop Girls Shoes">Girls' Shoes</a></div>
                                        <div class="m-title"><a tabindex="242" href="http://www.footlocker.com/_-_/keyword-toddler+shoes" manual_cm_sp="TopNav-_-Kids-_-Kidstoddlersh" title="Shop Toddler Shoes">Toddler Shoes</a></div>
                                        <div class="m-title"><a tabindex="243" href="http://www.footlocker.com/_-_/keyword-infant+shoes" manual_cm_sp="TopNav-_-Kids-_-Kidsinfantsh" title="Shop Infant Shoes">Infant Shoes</a></div>




                                        <a tabindex="298" class="screenreader close_menu" title="Close Kids' Products Menu" href="javascript:void(0);">Close Kids'</a>

                                    </div>
                                </div><!-- close sticker_menu_inner -->
                            </div><!-- close sticker_menu -->
                        </li>
                    </ul>

                </div>
                <!-- END Kids Drop Item -->
                <!-- START Release Calendar Drop Item -->
                <div class="sticker_wrapper">
                    <ul>
                        <li>
                            <div class="navBtn navButtonCalendar"><a tabindex="299" href="http://www.footlocker.com/release-dates/" manual_cm_sp="TopNav-_-Promo-_-Release_Calendar" title="View Release Calendar"><span class="no-drop">Release Calendar</span></a></div>
                        </li>
                    </ul>
                </div><!-- close sticker_wrapper -->
                <!-- END Release Calendar Drop Item -->
                <!-- START new Brands Tab -->
                <div class="sticker_wrapper">

                    <ul>
                        <li>
                            <div class="navBtn navButtonBrands"><a href="http://www.footlocker.com/Brands/" tabindex="300" manual_cm_sp=" topnav-_-brands-_-brandsall" title="Brands"><span class="brands-txt">Brands</span></a></div><!-- Production -->
                            <!-- <div class="navBtn navButtonBrands"><a tabindex="300" href="http://www.footlocker.com/catalog/advancedSearch?N=13+1878" manual_cm_sp="TopNav-_-Brands-_-Brandsall" title="Shop All Brands"><span class="brands-txt">Brands</span></a></div><!-- UAT --><a tabindex="300" class="screenreader expand_menu" title="Expand Brands Menu" href="javascript:void(0);">Expand Brands</a>

                            <div class="sticker_menu menu_brands">
                                <div class="dd_top core_width_brands"></div>
                                <div class="clear"></div>
                                <div class="sticker_menu_inner core_width_brands core_height_brands">

                                    <div class="dd_column di-right-7">
                                        <div class="m-item"><p>Top Brands</p></div>
                                        <div class="m-item"><a tabindex="302" href="http://www.footlocker.com/adidas/_-_/N-zc" manual_cm_sp="TopNav-_-Brands-_-Brandadidas" title="Shop adidas Shoes, Clothing">adidas</a></div>
                                        <div class="m-item"><a tabindex="303" href="http://www.footlocker.com/adidas-Originals/_-_/N-zr" manual_cm_sp="TopNav-_-Brands-_-Brandorig" title="Shop adidas Originals Shoes, Clothing">adidas Originals</a></div>
                                        <div class="m-item"><a tabindex="304" href="http://www.footlocker.com/ASICS/_-_/N-10i" manual_cm_sp="TopNav-_-Brands-_-Brandasics" title="Shop ASICS Shoes, Clothing">ASICS&reg;</a></div>
                                        <div class="m-item"><a tabindex="305" href="http://www.footlocker.com/Jordan/_-_/N-11c" manual_cm_sp="TopNav-_-Brands-_-Brandjordan" title="Shop Jordan">Jordan</a></div>
                                        <div class="m-item"><a tabindex="306" href="http://www.footlocker.com/New-Era/_-_/N-11v" manual_cm_sp="TopNav-_-Brands-_-Brandnewera" title="Shop New Era Hats">New Era</a></div>
                                        <div class="m-item"><a tabindex="307" href="http://www.footlocker.com/Nike/_-_/N-zz/" manual_cm_sp="TopNav-_-Brands-_-Brandnike" title="Shop Nike Shoes">Nike</a></div>
                                        <div class="m-item"><a tabindex="308" href="http://www.footlocker.com/PUMA/_-_/N-zq" manual_cm_sp="TopNav-_-Brands-_-Brandpuma" title="Shop PUMA Shoes, Clothing">PUMA</a></div>
                                        <div class="m-item"><a tabindex="309" href="http://www.footlocker.com/Under-Armour/_-_/N-10q" manual_cm_sp="TopNav-_-Brands-_-Brandua" title="Shop Under Armour Shoes, Clothing">Under Armour</a></div>
                                        <div class="menu_shop_all"><a tabindex="310" href="http://www.footlocker.com/Brands/" manual_cm_sp="TopNav-_-Brands-_-Brandall" title="Shop View All Brands">View All Brands</a></div> <!-- Production -->
                                        <!-- <div class="menu_shop_all"><a tabindex="310" href="http://www.footlocker.com/catalog/advancedSearch?N=13+1878" manual_cm_sp="TopNav-_-Brands-_-Brandall" title="View All Brands">View All Brands</a></div><!-- UAT -->
                                        <a tabindex="320" class="screenreader close_menu" title="Close Brands Menu" href="javascript:void(0);">Close Brands</a>
                                    </div>
                                </div><!-- close sticker_menu_inner -->
                            </div><!-- close sticker_menu -->
                        </li>
                    </ul>

                </div><!-- close sticker_wrapper -->
                <!-- END new Brands Tab -->
                <!-- START Outlet Drop Item -->
                <div class="sticker_wrapper">
                    <ul>
                        <li>
                            <div class="navBtn navButtonOutlet"><a tabindex="329" href="http://www.footlocker.com/outlet/category/?cm_sp=TopNav-_-Outlet-_-Outletall&cm=TnDOutletAllBtn" title="Shop Sale Shoes and Clothing"><span class="no-drop">Outlet</span></a></div>
                        </li>
                    </ul>
                </div><!-- close sticker_wrapper -->
                <!-- END Outlet Drop Item -->
                <!-- START Collections Drop Item -->
                <div class="sticker_wrapper">

                    <ul>
                        <li>
                            <div class="navBtn navButtonCollections"><a tabindex="330" title="View Foot Locker Collections"><span class="collection-txt">Collections</span></a></div><a tabindex="330" class="screenreader expand_menu" title="Expand Collections Menu" href="javascript:void(0);">Expand Collections</a>

                            <div class="sticker_menu menu_collection">
                                <div class="dd_top core_width_collection"></div>


                                <div class="clear"></div>
                                <div class="sticker_menu_inner core_width_collection core_height_collection">
                                    <a tabindex="332" href="http://www.footlocker.com/_-_/keyword-history+of+air+jordan" manual_cm_sp="TopNav-_-Collections-_-Jordan" title="View History of Air Jordan" class="collect-item"><img alt="" src="/ns/header/images/jordan.jpg" height="40" width="100" border="0" /></a>
                                    <a tabindex="333" href="http://houseofhoops.footlocker.com/" manual_cm_sp="TopNav-_-Collections-_-HOH" title="View House Of Hoops Kicks Calendar" class="collect-item"><img alt="" src="/ns/header/images/house.jpg" height="40" width="100" border="0" /></a>
                                    <a tabindex="334" href="http://www.footlocker.com/promotion/promoId:5003654/puma-lab/" manual_cm_sp="TopNav-_-Collections-_-PumaLab" title="Shop PUMA Lab" class="collect-item"><img alt="" src="/ns/header/images/fl-puma-lab-collection.jpg" height="40" width="100" border="0" /></a>
                                    <a tabindex="336" href="http://www.footlocker.com/jordanwishlist" manual_cm_sp="TopNav-_-Collections-_-jordanwishlist" title="Create Your Jordan Wish List" class="collect-item"><img alt="" src="/ns/header/images/collectionlogo-JordanWishlist.jpg" height="40" width="100" border="0" /></a>
                                    <a tabindex="335" href="http://www.footlocker.com/The-a-Standard" manual_cm_sp="TopNav-_-Collections-_-adidasAstandard" title="Shop Adidas a Standard" class="collect-item"><img alt="" src="/ns/header/images/astandardlogo.jpg" height="40" width="100" border="0" /></a>
                                    <a tabindex="337" href="http://www.footlocker.com/Basketball/Shoes/_-_/N-fmZrj" manual_cm_sp=" topnav-_-collections-_-basketball" title="Shop Basketball Shoes" class="collect-item"><img alt="" src="/ns/header/images/basketball.jpg" height="40" width="100" border="0" /></a>
                                </div><!-- close sticker_menu_inner -->

                            </div><!-- close sticker_menu -->
                        </li>
                    </ul>

                </div><!-- close sticker_wrapper -->
                <!-- END Collections Drop Item -->
                <!-- START new Locations Tab -->
                <div class="sticker_wrapper">

                    <ul>
                        <li>
                            <div class="navBtn navButtonLocation"><a tabindex="350" href="http://www.footlocker.com/content/locator/?cm=TnDStoreLctrBtn" title="View the Store Locator"><img src="/ns/header/images/store.png" width="33" height="31" border="0" class="store-icon" /><span class="store-indent location-txt">Find A Store</span></a></div><a tabindex="350" class="screenreader expand_menu" title="Expand Find A Store Menu" href="javascript:void(0);">Expand Find a Store</a>

                            <div class="sticker_menu menu_location">
                                <div class="dd_top core_width_location"></div>
                                <div class="sticker_menu_inner core_width_location core_height_location">

                                    <div class="dd_column_c">
                                        <form id="locationInputWrapper" onsubmit="open_locator(); return false;">
                                            <div class="footer_sprite find_store">
                                                <input tabindex="352" title="Enter Zip Code or City, State" type="text" id="locationInput" value="Enter zip or city, state" onfocus="if(this.value=='Enter zip or city, state'){this.value=''};checkStoreLocator();" onblur="if(this.value==''){this.value='Enter zip or city, state'};restoreStoreLocator();" />
                                                <img src="http://www.footlocker.com/images/fl/global/pixel.gif" alt="Search for Stores" height="47" width="20" border="0" class="email_submit_btn" onclick="open_locator()" />
                                            </div>
                                        </form>
                                         <div class="m-title"><a href="http://www.footlocker.com/content/locator/" " manual_cm_sp=" topnav-_-findastore-_-fllocations" title="View Foot Locker Locations">Foot Locker Locations</a></div>
                                        <div class="m-title"><a href="http://houseofhoops.footlocker.com/" manual_cm_sp="TopNav-_-FindaStore-_-hoh" title="View House of Hoops Locations">House of Hoops Locations</a></div>
                                        <div class="m-title"><a href="http://unlocked.footlocker.com/launchlocator" " manual_cm_sp=" topnav-_-findastore-_-launchlocator" target="_blank" title="View Launch Locator">Launch Locator</a></div>
                                        <a tabindex="355" class="screenreader close_menu" title="Close Find a Store Menu" href="javascript:void(0);">Close Find a Store</a>
                                    </div>
                                </div><!-- close sticker_menu_inner -->

                            </div><!-- close sticker_menu -->
                        </li>
                    </ul>

                </div><!-- close sticker_wrapper -->
                <!-- END new Locations Tab -->
                <!-- START Approved Drop Down -->
                <div class="sticker_wrapper">

                    <ul>
                        <li>
                            <div class="navBtn navButtonApproved" title="Foot Locker Approved"><a tabindex="360" title="Foot Locker Approved"><img src="http://www.footlocker.com/images/fl/global/pixel.gif" height="21" width="80" border="0" id="approved-img" class="bg-sprite approved-icon" /></a></div><a tabindex="360" class="screenreader expand_menu smaller" href="javascript:void(0);">Expand Foot Locker Approved</a>

                            <div class="sticker_menu menu_approved">
                                <div class="dd_top core_width_approved"></div>
                                <div class="clear"></div>
                                <div class="sticker_menu_inner core_width_approved core_height_approved">

                                    <div class="dd_column_b di-right-8">
                                        <div class="m-title"><a tabindex="362" href="http://unlocked.footlocker.com/" manual_cm_sp="TopNav-_-Approved-_-unlocked" title="Foot Locker Unlocked">Unlocked</a></div>
                                        <div class="m-title"><a tabindex="363" href="http://unlocked.footlocker.com/blog/" manual_cm_sp="TopNav-_-Approved-_-blog" title="Unlocked Blog">Blog</a></div>
                                        <div class="m-title"><a tabindex="364" href="http://www.footlocker.com/approved/" target="_blank" manual_cm_sp="TopNav-_-Approved-_-hub" title="Approved Social Hub">Approved Social Hub</a></div>
                                        <div class="m-title"><a tabindex="365" href="http://unlocked.footlocker.com/sneakers/" manual_cm_sp="TopNav-_-Approved-_-vault" title="Unlocked Vault">Vault</a></div>
                                        <div class="m-title"><a tabindex="366" href="http://unlocked.footlocker.com/vip/welcome/" manual_cm_sp="TopNav-_-Approved-_-vip" title="Unlocked VIP">VIP</a></div>
                                        <a tabindex="368" class="screenreader close_menu" title="Close Foot Locker Approved Menu" href="javascript:void(0);">Close Foot Locker Approved</a>
                                    </div>
                                </div><!-- close sticker_menu_inner -->
                            </div><!-- close sticker_menu -->
                        </li>
                    </ul>

                </div><!-- close sticker_wrapper -->
                <!-- END Approved Drop Down -->


            </div><!-- close sticker_menu_container -->
            <a tabindex="500" name="skiptomaincontent" id="skiptomaincontent" class="screenreader">&nbsp;</a>
            <!-- ------ END GLOBAL NAV ------ -->
            <!-- start menu div -->
            <div id="menu-wrap">&nbsp;</div>
            <!-- end menu div -->
            <!-- end header div -->
        </div>

        <!--- end header wrap --->
    </div>
    <!-- start outside div -->
    <!--<div id="outside">-->

    <div id="inside">

        <script language="javascript">
                <!--
                viewBannerEvent("15% Off - NO MIN", 90); 
                //-->
        </script>

<script language="javascript">

        var excludeBannerFromDiscount = false;

</script>
<div id="global_Banner">
        
                <!-- tpbann --><div class="banner-wrapper">
    <a href="#global-banner-html" rel="shadowbox[banner];width=540;height=200" target="_blank" title="15% Off No Minimum Purchase Required">
        <div><img src="/ns/banners/flgb112114a-15nominv2.gif" border="0"></div>
    </a>
</div>


<div id="global-banner-html" style="display:none">
<div class="global-banner">
        <h2>15% Off No Minimum Purchase Required</h2>
    <p>
        *No minimum purchase required. Use promotion code IPFL4N77 at checkout. Promotion/source code box is located in step 4 of checkout. Valid at footlocker.com, by phone or mail. Does not apply to prior purchases or open orders and cannot be combined with any other offers. May not be used toward purchase of gift cards or team orders. Promotion may be modified or terminated at any time. Certain restrictions and exclusions may apply. Launch products are excluded from discount. Some items are not eligible for discount and will indicate "excluded from discount" in red type on the product's description page. Offer expires 11/29/2014 (11:59 pm CT).
    </p>
   
</div>
</div><!-- end tpbann -->
        
</div>  

<!-- MyBuys integration -->

        <!-- requestProtocol: http -->
        
        <script type="text/javascript" src="http://t.p.mybuys.com/js/mybuys3.js"></script>
        <script type="text/javascript" src="http://t.p.mybuys.com/clients/FOOTLOCKER/js/setup.js"></script>

<script language="Javascript">          
        var inlineAddToCartEnabled = true;
        var useMyBuyYMALS = true;
        var MyBuysDisabledForHL = false;
        var co_cd = '21';
</script>

<script type="text/javascript">
        var isIntangible = false;
</script>



<script>


var secured_dialog = false;
var loginTemplatePath = '/wishlist/wl_iframe';
var miniCartYmalsTemplate = '/miniAddToCart/miniCartYmals';

var savedLocation = ''; 

var cm_CategoryID = '';
var cm_isProductMaskedPricing = 'N';
var cm_ProductTemplate = '';
var cm_microsite = '';
var cm_isLaunchSku = 'N';

var sku_nbr = '677374';
var model_nbr = 94651;

var scene7url = 'http://images.footlocker.com/is/image/EBFL2';
var scene7url = 'http://images.footlocker.com/is/image/';

var reviewSubmissionURL = 'http://www.footlocker.com/catalog/submitReview';

var launchISA = false;
var ISAEnabled = false;
var BORISEnabled = true;
var freeShippingEnabled = true;
var maskedPricingEnabled = false;

var model = {"ALLSKUS":["S84872","20729","M21232","M21231","74391","D65603","223001","117205","208832","209880","209879","355533","060337","677374","676228"],"NBR":"94651","PRICERANGE":"$24.99 - $74.99","GENDER_AGE":"Men's","PRICEADJUSTDATE":"","AVAILABLE_SIZES":[" 04.0"," 04.5"," 05.0"," 05.5"," 06.0"," 06.5"," 07.0"," 07.5"," 08.0"," 08.5"," 09.0"," 09.5"," 10.0"," 10.5"," 11.0"," 11.5"," 12.0"," 12.5"," 13.0"," 14.0"," 15.0"," 16.0"," 17.0"," 18.0"," 19.0"," 20.0"],"DISCOUNT_PERCENT":"6","isFieldTestable":false,"SORT":"5788","HASCUSTOMPRODUCTTEMPLATE":false,"PR_LIST":"79.99","SPORTS":[{"ID":"3","NM":"Basketball"},{"ID":"39","NM":"Casual"}],"SIZECHART_CD":"S0449","HASSIZES":true,"PR_SALE":"74.99","LOCALIZATION":{},"MODELTEMPLATE":{"ISMODELTEMPLATEACTIVE":"N","MODELTEMPLATE_IMAGE":""},"ISCUSTOMPRODUCT":false,"INTRODUCTIONDATE":"","SKU":"S84872","ISINTANGIBLE":false,"PROD_TP":"Shoes","CUSTPROD_CD":"","NM":"adidas Originals Superstar 2 - Men's","REVIEWS":{"HASREVIEWS":true,"TOTALREVIEWCOUNT":"278","WEIGHTEDAVERAGERATING":"4.54","WEIGHTEDAVERAGERECOMMENDED":"256"},"BRAND":"adidas Originals","INET_COPY":"<p>The iconic shell-toe shoes were once THE shoe of the NBA in the '70s.<\/p> <ul> <li>Upper made with durable yet breathable materials.<\/li> <li>Iconic rubber shell toe and outsole for durability.<\/li> <li>Wt. 14.4 oz.<\/li> <\/ul>"};
var styles = {"D65603":["<span class='attType_color'>Bluebird\/White\/White<\/span> | <span class='attType_width'>Width - D - Medium<\/span>",false,true,"","truesize.gif","74.99","49.99",[[" 04.0","74.99","49.99","","Y","N","N","887373900065;4524240004040"]],true,false,false,[],{"PRODUCT_TOP_SALES_AMOUNT":"0.00","SHOE_UPPER_HEIGHT":"Low","PRODUCT_RELEVANCE_RANKING":"0.47400000000000","FREE_STANDARD_SHIPPING":false,"PLAYER_PROFILE_-_BASKETBALL":"Center, Forward, Point Guard, Power Forward, Shooting Guard","SHOE_CLOSURE":"Lace","SHOE_OUTSOLE":"Rubber","CHANNEL_AVAIL_ICON":"IN_STORE","ELIGIBLE_SHIPTOSTORE":true,"PRODUCT_NEW_ARRIVAL_DATE":"02\/11\/2014","SHOE_CUSHIONING":"Rubber Cup","SPECIFIC_PRODUCT_TYPE":"Casual Basketball Shoes","SHOE_WEIGHT":"14.6 oz","PREMIER_BOGO":"","SHOE_UPPER_MATERIAL":"Leather"},"","","Bluebird\/White\/White","Width - D - Medium","","","","","",false,false,"Blue","White",[],{}],"355533":["<span class='attType_color'>White\/Black\/White<\/span> | <span class='attType_width'>Width - D - Medium<\/span>",false,true,"","truesize.gif","74.99","69.99",[[" 09.0","74.99","69.99","","Y","N","N","884894636077;4104539304090"],[" 09.5","74.99","69.99","","Y","N","N","884894636084;4104539304095"],[" 10.0","74.99","69.99","","Y","N","N","884894636091;4104539304100"],[" 10.5","74.99","69.99","","Y","N","N","884894636107;4104539304105"],[" 11.0","74.99","69.99","","Y","N","N","884894636114;4104539304110"],[" 11.5","74.99","69.99","","Y","N","N","884894636121;4104539304115"],[" 12.0","74.99","69.99","","Y","N","N","884894636138;4104539304120"],[" 13.0","74.99","69.99","","Y","N","N","884894636152;4104539304130"],[" 14.0","74.99","69.99","","Y","N","N","884894636176;4104539304140"],[" 15.0","74.99","69.99","","Y","N","N","884895959373;4104539304150"],[" 16.0","74.99","69.99","","Y","N","N","884894636190;4104539304160"],[" 17.0","74.99","69.99","","Y","N","N","884894636206;4104539304170"],[" 18.0","74.99","69.99","","Y","N","N","884894636213;4104539304180"],[" 19.0","74.99","69.99","","Y","N","N","884894636220;4104539209190"],[" 20.0","74.99","69.99","","Y","N","N","884894636237 ;4104539209200"]],true,false,false,[],{"PRODUCT_TOP_SALES_AMOUNT":"2244.68","SHOE_UPPER_HEIGHT":"Low","PRODUCT_RELEVANCE_RANKING":"0.99000000000000","FREE_STANDARD_SHIPPING":false,"PLAYER_PROFILE_-_BASKETBALL":"Center, Forward, Point Guard, Power Forward, Shooting Guard","SHOE_CLOSURE":"Lace","SHOE_OUTSOLE":"Rubber","CHANNEL_AVAIL_ICON":"IN_STORE","ELIGIBLE_SHIPTOSTORE":true,"PRODUCT_NEW_ARRIVAL_DATE":"11\/02\/2009","SHOE_CUSHIONING":"Rubber Cup","SPECIFIC_PRODUCT_TYPE":"Casual Basketball Shoes","SHOE_WEIGHT":"14.6 oz","PREMIER_BOGO":"","SHOE_UPPER_MATERIAL":"Leather"},"","","White\/Black\/White","Width - D - Medium","","","","","",false,false,"White","Black",[],{}],"060337":["<span class='attType_color'>White\/White\/White<\/span> | <span class='attType_width'>Width - D - Medium<\/span>",false,true,"","truesize.gif","74.99","69.99",[[" 04.0","74.99","69.99","","Y","N","N","884894636817 ;4104500409040"],[" 04.5","74.99","69.99","","Y","N","N","884894636824 ;4104500409045"],[" 05.0","74.99","69.99","","Y","N","N","884894636831 ;4104500409050"],[" 05.5","74.99","69.99","","Y","N","N","884894636848 ;4104500409055"],[" 06.0","74.99","69.99","","Y","N","N","884894636855 ;4104500409060"],[" 06.5","74.99","69.99","","Y","N","N","884894636862;4104500504065"],[" 07.0","74.99","69.99","","Y","N","N","884894636879;4104500504070"],[" 07.5","74.99","69.99","","Y","N","N","884894636886;4104500504075"],[" 08.0","74.99","69.99","","Y","N","N","884894636893;4104500504080"],[" 08.5","74.99","69.99","","Y","N","N","884894636909;4104500504085"],[" 09.0","74.99","69.99","","Y","N","N","884894636916;4104500504090"],[" 09.5","74.99","69.99","","Y","N","N","884894636923;4104500504095"],[" 10.0","74.99","69.99","","Y","N","N","884894636930;4104500504100"],[" 10.5","74.99","69.99","","Y","N","N","884894636947;4104500504105"],[" 11.0","74.99","69.99","","Y","N","N","884894636954;4104500504110"],[" 11.5","74.99","69.99","","Y","N","N","884894636961;4104500504115"],[" 12.0","74.99","69.99","","Y","N","N","884894636978;4104500504120"],[" 12.5","74.99","69.99","","Y","N","N","884894636985;4104500409125"],[" 13.0","74.99","69.99","","Y","N","N","884894636992;4104500504130"],[" 14.0","74.99","69.99","","Y","N","N","884894637012;4104500504140"],[" 15.0","74.99","69.99","","Y","N","N","884895959403;4104500504150"],[" 16.0","74.99","69.99","","Y","N","N","884894637036;4104500504160"],[" 17.0","74.99","69.99","","Y","N","N","884894637043;4104500504170"],[" 18.0","74.99","69.99","","Y","N","N","884894637050;4104500504180"],[" 19.0","74.99","69.99","","Y","N","N","884894637067 ;4104500409190"],[" 20.0","74.99","69.99","","Y","N","N","884894637074 ;4104500409200"]],true,false,false,[],{"PRODUCT_TOP_SALES_AMOUNT":"2449.65","SHOE_UPPER_HEIGHT":"Low","PRODUCT_RELEVANCE_RANKING":"0.99300000000000","FREE_STANDARD_SHIPPING":false,"PLAYER_PROFILE_-_BASKETBALL":"Center, Forward, Point Guard, Power Forward, Shooting Guard","SHOE_CLOSURE":"Lace","SHOE_OUTSOLE":"Rubber","CHANNEL_AVAIL_ICON":"IN_STORE","ELIGIBLE_SHIPTOSTORE":true,"PRODUCT_NEW_ARRIVAL_DATE":"11\/02\/2009","SHOE_CUSHIONING":"Rubber Cup","SPECIFIC_PRODUCT_TYPE":"Casual Basketball Shoes","SHOE_WEIGHT":"14.6 oz","PREMIER_BOGO":"","SHOE_UPPER_MATERIAL":"Leather"},"","","White\/White\/White","Width - D - Medium","","","","","",false,false,"All White","White",[],{}],"223001":["<span class='attType_color'>White\/White<\/span> | <span class='attType_width'>Width - D - Medium<\/span>",false,true,"","truesize.gif","79.99","71.99",[[" 06.0","79.99","71.99","","Y","N","N","886833999151;4112485904060"]],true,false,false,[],{"PRODUCT_TOP_SALES_AMOUNT":"0.00","SHOE_UPPER_HEIGHT":"Low","PRODUCT_RELEVANCE_RANKING":"0.27500000000000","FREE_STANDARD_SHIPPING":false,"PLAYER_PROFILE_-_BASKETBALL":"Center, Forward, Point Guard, Power Forward, Shooting Guard","SHOE_CLOSURE":"Lace","SHOE_OUTSOLE":"Rubber","CHANNEL_AVAIL_ICON":"IN_STORE","ELIGIBLE_SHIPTOSTORE":true,"PRODUCT_NEW_ARRIVAL_DATE":"04\/02\/2013","SHOE_CUSHIONING":"Rubber Cup","SPECIFIC_PRODUCT_TYPE":"Casual Basketball Shoes","SHOE_WEIGHT":"14.6 oz","PREMIER_BOGO":"","SHOE_UPPER_MATERIAL":"Leather"},"","","White\/White","Width - D - Medium","","","","","",false,false,"White","Grey",[],{}],"209880":["<span class='attType_color'>White\/Fairway Green<\/span> | <span class='attType_width'>Width - D - Medium<\/span>",false,true,"","truesize.gif","74.99","69.99",[[" 07.0","74.99","69.99","","Y","N","N","884894636312;4102403404070"],[" 08.0","74.99","69.99","","Y","N","N","884894636336;4102403404080"],[" 10.0","74.99","69.99","","Y","N","N","884894636374;4102403404100"],[" 10.5","74.99","69.99","","Y","N","N","884894636381;4102403404105"],[" 11.0","74.99","69.99","","Y","N","N","884894636398;4102403404110"],[" 11.5","74.99","69.99","","Y","N","N","884894636404;4102403404115"],[" 12.0","74.99","69.99","","Y","N","N","884894636411;4102403404120"],[" 12.5","74.99","69.99","","Y","N","N","884894636428;4105140904125"],[" 13.0","74.99","69.99","","Y","N","N","884894636435;4102403404130"],[" 14.0","74.99","69.99","","Y","N","N","884894636459;4102403404140"],[" 15.0","74.99","69.99","","Y","N","N","884895959380;4102403404150"],[" 16.0","74.99","69.99","","Y","N","N","884894636473;4105140904160"],[" 17.0","74.99","69.99","","Y","N","N","884894636480;4105140904170"],[" 18.0","74.99","69.99","","Y","N","N","884894636497;4105140904990"],[" 19.0","74.99","69.99","","Y","N","N"," "],[" 20.0","74.99","69.99","","Y","N","N"," "]],true,false,false,[],{"PRODUCT_TOP_SALES_AMOUNT":"419.94","SHOE_UPPER_HEIGHT":"Low","PRODUCT_RELEVANCE_RANKING":"0.95100000000000","FREE_STANDARD_SHIPPING":false,"PLAYER_PROFILE_-_BASKETBALL":"Center, Forward, Point Guard, Power Forward, Shooting Guard","SHOE_CLOSURE":"Lace","SHOE_OUTSOLE":"Rubber","CHANNEL_AVAIL_ICON":"IN_STORE","ELIGIBLE_SHIPTOSTORE":true,"PRODUCT_NEW_ARRIVAL_DATE":"11\/02\/2009","SHOE_CUSHIONING":"Rubber Cup","SPECIFIC_PRODUCT_TYPE":"Casual Basketball Shoes","SHOE_WEIGHT":"14.6 oz","PREMIER_BOGO":"","SHOE_UPPER_MATERIAL":"Leather"},"","","White\/Fairway Green","Width - D - Medium","","","","","",false,false,"White","Green",[],{}],"208832":["<span class='attType_color'>White\/Navy\/Navy<\/span> | <span class='attType_width'>Width - D - Medium<\/span>",false,true,"","truesize.gif","74.99","69.99",[[" 09.5","74.99","69.99","","Y","N","N","884894637487;4114434504095"],[" 10.0","74.99","69.99","","Y","N","N","884894637494;4114434504100"],[" 10.5","74.99","69.99","","Y","N","N","884894637500;4114434504105"],[" 11.0","74.99","69.99","","Y","N","N","884894637517;4114434504110"],[" 11.5","74.99","69.99","","Y","N","N","884894637524;4114434504115"],[" 12.0","74.99","69.99","","Y","N","N","884894637531;4114434504120"],[" 12.5","74.99","69.99","","Y","N","N","884894637548;4114434504125"],[" 13.0","74.99","69.99","","Y","N","N","884894637555;4114434504130"],[" 15.0","74.99","69.99","","Y","N","N","884895959397;4114434504150"],[" 16.0","74.99","69.99","","Y","N","N","884894637593;4114434409160"],[" 17.0","74.99","69.99","","Y","N","N","884894637609;4114434409170"],[" 18.0","74.99","69.99","","Y","N","N","884894637616;4114434409180"],[" 19.0","74.99","69.99","","Y","N","N","884894637623;4114434409190"],[" 20.0","74.99","69.99","","Y","N","N","884894637630;4114434409200"]],true,false,false,[],{"PRODUCT_TOP_SALES_AMOUNT":"699.90","SHOE_UPPER_HEIGHT":"Low","PRODUCT_RELEVANCE_RANKING":"0.97300000000000","FREE_STANDARD_SHIPPING":false,"PLAYER_PROFILE_-_BASKETBALL":"Center, Forward, Point Guard, Power Forward, Shooting Guard","SHOE_CLOSURE":"Lace","SHOE_OUTSOLE":"Rubber","CHANNEL_AVAIL_ICON":"IN_STORE","ELIGIBLE_SHIPTOSTORE":true,"PRODUCT_NEW_ARRIVAL_DATE":"11\/02\/2009","SHOE_CUSHIONING":"Rubber Cup","SPECIFIC_PRODUCT_TYPE":"Casual Basketball Shoes","SHOE_WEIGHT":"14.6 oz","PREMIER_BOGO":"","SHOE_UPPER_MATERIAL":"Leather"},"","","White\/Navy\/Navy","Width - D - Medium","","","","","",false,false,"White","Navy",[],{}],"209879":["<span class='attType_color'>White\/Light Scarlet<\/span> | <span class='attType_width'>Width - D - Medium<\/span>",false,true,"","truesize.gif","74.99","69.99",[[" 04.5","74.99","69.99","","Y","N","N","885582656544;4523705304045"],[" 05.0","74.99","69.99","","Y","N","N","885582656551;4523705304050"],[" 08.5","74.99","69.99","","Y","N","N","885582656629;4113628304085"],[" 09.5","74.99","69.99","","Y","N","N","885582656643;4113628304095"],[" 10.0","74.99","69.99","","Y","N","N","885582656650;4113628304100"],[" 10.5","74.99","69.99","","Y","N","N","885582656667;4113628304105"],[" 11.5","74.99","69.99","","Y","N","N","885582656681;4113628304115"],[" 13.0","74.99","69.99","","Y","N","N","885582656711;4113628304130"],[" 14.0","74.99","69.99","","Y","N","N","885582656735;4113628304140"],[" 15.0","74.99","69.99","","Y","N","N","886037032081;4113628304150"],[" 16.0","74.99","69.99","","Y","N","N","886037032098;4523705304160"],[" 17.0","74.99","69.99","","Y","N","N","886037032104 ;4523705304170"],[" 18.0","74.99","69.99","","Y","N","N","886037032111;4523705304180"],[" 19.0","74.99","69.99","","Y","N","N","886037032128;4523705304190"],[" 20.0","74.99","69.99","","Y","N","N","886037032135;4523705304200"]],true,false,false,[],{"PRODUCT_TOP_SALES_AMOUNT":"909.87","SHOE_UPPER_HEIGHT":"Low","PRODUCT_RELEVANCE_RANKING":"0.96400000000000","FREE_STANDARD_SHIPPING":false,"PLAYER_PROFILE_-_BASKETBALL":"Center, Forward, Point Guard, Power Forward, Shooting Guard","SHOE_CLOSURE":"Lace","SHOE_OUTSOLE":"Rubber","CHANNEL_AVAIL_ICON":"IN_STORE","ELIGIBLE_SHIPTOSTORE":true,"PRODUCT_NEW_ARRIVAL_DATE":"11\/02\/2009","SHOE_CUSHIONING":"Rubber Cup","SPECIFIC_PRODUCT_TYPE":"Casual Basketball Shoes","SHOE_WEIGHT":"14.6 oz","PREMIER_BOGO":"","SHOE_UPPER_MATERIAL":"Leather"},"","","White\/Light Scarlet","Width - D - Medium","","","","","",false,false,"White","Red",[],{}],"676228":["<span class='attType_color'>Black\/Black<\/span> | <span class='attType_width'>Width - D - Medium<\/span>",false,true,"","truesize.gif","74.99","69.99",[[" 06.5","74.99","69.99","","Y","N","N","884894636589;4104939504065"],[" 07.0","74.99","69.99","","Y","N","N","884894636596;4104939504070"],[" 07.5","74.99","69.99","","Y","N","N","884894636602;4104939504075"],[" 08.0","74.99","69.99","","Y","N","N","884894636619;4104939504080"],[" 08.5","74.99","69.99","","Y","N","N","884894636626;4104939504085"],[" 09.0","74.99","69.99","","Y","N","N","884894636633;4104939504090"],[" 09.5","74.99","69.99","","Y","N","N","884894636640;4104939504095"],[" 10.0","74.99","69.99","","Y","N","N","884894636657;4104939504100"],[" 10.5","74.99","69.99","","Y","N","N","884894636664;4104939504105"],[" 11.0","74.99","69.99","","Y","N","N","884894636671;4104939504110"],[" 11.5","74.99","69.99","","Y","N","N","884894636688;4104939504115"],[" 12.0","74.99","69.99","","Y","N","N","884894636695;4104939504120"],[" 13.0","74.99","69.99","","Y","N","N","884894636718;4104939504130"],[" 14.0","74.99","69.99","","Y","N","N","884894636732;4104939504140"],[" 15.0","74.99","69.99","","Y","N","N","884895959359;4104939504150"],[" 16.0","74.99","69.99","","Y","N","N","884894636756;4104939504160"],[" 17.0","74.99","69.99","","Y","N","N","884894636763;4104939504170"],[" 18.0","74.99","69.99","","Y","N","N","884894636770;4104939504180"],[" 19.0","74.99","69.99","","Y","N","N","884894636787 ;4104939409190"],[" 20.0","74.99","69.99","","Y","N","N","884894636794 ;4104939409200"]],true,false,false,[],{"PRODUCT_TOP_SALES_AMOUNT":"1399.80","SHOE_UPPER_HEIGHT":"Low","PRODUCT_RELEVANCE_RANKING":"0.98700000000000","FREE_STANDARD_SHIPPING":false,"PLAYER_PROFILE_-_BASKETBALL":"Center, Forward, Point Guard, Power Forward, Shooting Guard","SHOE_CLOSURE":"Lace","SHOE_OUTSOLE":"Rubber","CHANNEL_AVAIL_ICON":"IN_STORE","ELIGIBLE_SHIPTOSTORE":true,"PRODUCT_NEW_ARRIVAL_DATE":"11\/02\/2009","SHOE_CUSHIONING":"Rubber Cup","SPECIFIC_PRODUCT_TYPE":"Casual Basketball Shoes","SHOE_WEIGHT":"14.6 oz","PREMIER_BOGO":"","SHOE_UPPER_MATERIAL":"Leather"},"","","Black\/Black","Width - D - Medium","","","","","",false,false,"All Black","Black",[],{}],"117205":["<span class='attType_color'>White\/Royal\/White<\/span> | <span class='attType_width'>Width - D - Medium<\/span>",false,true,"","truesize.gif","74.99","24.99",[[" 19.0","74.99","24.99","","Y","N","N","884896267392 ;4105109309190"],[" 20.0","74.99","24.99","","Y","N","N","884896267408 ;4105109309200"]],true,false,false,[],{"PRODUCT_TOP_SALES_AMOUNT":"0.00","SHOE_UPPER_HEIGHT":"Low","PRODUCT_RELEVANCE_RANKING":"0.28200000000000","FREE_STANDARD_SHIPPING":false,"PLAYER_PROFILE_-_BASKETBALL":"Center, Forward, Point Guard, Power Forward, Shooting Guard","SHOE_CLOSURE":"Lace","SHOE_OUTSOLE":"Rubber","CHANNEL_AVAIL_ICON":"IN_STORE","ELIGIBLE_SHIPTOSTORE":true,"PRODUCT_NEW_ARRIVAL_DATE":"08\/12\/2011","SHOE_CUSHIONING":"Rubber Cup","SPECIFIC_PRODUCT_TYPE":"Casual Basketball Shoes","SHOE_WEIGHT":"14.6 oz","PREMIER_BOGO":"","SHOE_UPPER_MATERIAL":"Leather"},"","","White\/Royal\/White","Width - D - Medium","","","","","",false,false,"White","Blue",[],{}],"74391":["<span class='attType_color'>Brick\/Black\/White Vapour<\/span> | <span class='attType_width'>Width - D - Medium<\/span>",false,true,"","truesize.gif","74.99","67.49",[[" 11.5","74.99","67.49","","Y","N","N","887383542880;4113885904115"]],true,false,false,[],{"PRODUCT_TOP_SALES_AMOUNT":"0.00","SHOE_UPPER_HEIGHT":"Low","PRODUCT_RELEVANCE_RANKING":"0.56800000000000","FREE_STANDARD_SHIPPING":false,"PLAYER_PROFILE_-_BASKETBALL":"Center, Forward, Point Guard, Power Forward, Shooting Guard","SHOE_CLOSURE":"Lace","SHOE_OUTSOLE":"Rubber","CHANNEL_AVAIL_ICON":"IN_STORE","ELIGIBLE_SHIPTOSTORE":true,"PRODUCT_NEW_ARRIVAL_DATE":"05\/21\/2014","SHOE_CUSHIONING":"Rubber Cup","SPECIFIC_PRODUCT_TYPE":"Casual Basketball Shoes","PRODUCT_HIGHLIGHT_COLOR":"Gold, White","SHOE_WEIGHT":"14.6 oz","PREMIER_BOGO":"","SHOE_UPPER_MATERIAL":"Leather"},"","","Brick\/Black\/White Vapour","Width - D - Medium","","","","","",false,false,"Orange","Black",[],{}],"20729":["<span class='attType_color'>Cargo Khaki\/Dark Brown\/White<\/span> | <span class='attType_width'>Width - D - Medium<\/span>",false,true,"","truesize.gif","74.99","74.99",[[" 09.5","74.99","74.99","","Y","N","N","887780014294;4525175704095"],[" 10.0","74.99","74.99","","Y","N","N","887780014300;4525175704100"],[" 10.5","74.99","74.99","","Y","N","N","887780014317;4525175704105"],[" 11.0","74.99","74.99","","Y","N","N","887780014324;4525175704110"],[" 11.5","74.99","74.99","","Y","N","N","887780014331;4525175704115"],[" 12.0","74.99","74.99","","Y","N","N","887780014348;4525175704120"],[" 13.0","74.99","74.99","","Y","N","N","887780014362;4525175704130"]],true,false,false,[],{"PRODUCT_TOP_SALES_AMOUNT":"149.98","SHOE_UPPER_HEIGHT":"Low","PRODUCT_RELEVANCE_RANKING":"0.83900000000000","FREE_STANDARD_SHIPPING":true,"PLAYER_PROFILE_-_BASKETBALL":"Center, Forward, Point Guard, Power Forward, Shooting Guard","SHOE_CLOSURE":"Lace","SHOE_OUTSOLE":"Rubber","CHANNEL_AVAIL_ICON":"IN_STORE","ELIGIBLE_SHIPTOSTORE":true,"PRODUCT_NEW_ARRIVAL_DATE":"09\/10\/2014","SHOE_CUSHIONING":"Rubber Cup","SPECIFIC_PRODUCT_TYPE":"Casual Basketball Shoes","PRODUCT_HIGHLIGHT_COLOR":"Black, Green, White","SHOE_WEIGHT":"14.6 oz","PREMIER_BOGO":"","SHOE_UPPER_MATERIAL":"Leather"},"","","Cargo Khaki\/Dark Brown\/White","Width - D - Medium","","","","0","FREE_STANDARD_SHIPPING",false,false,"Tan","Brown",[],{}],"677374":["<span class='attType_color'>Black\/White<\/span> | <span class='attType_width'>Width - D - Medium<\/span>",false,true,"","truesize.gif","74.99","69.99",[[" 04.0","74.99","69.99","","Y","N","N","884894637098 ;4104940209040"],[" 04.5","74.99","69.99","","Y","N","N","884894637104 ;4104940209045"],[" 06.5","74.99","69.99","","Y","N","N","884894637142 ;4104940304065"],[" 07.0","74.99","69.99","","Y","N","N","884894637159 ;4104940304070"],[" 07.5","74.99","69.99","","Y","N","N","884894637166 ;4104940304075"],[" 08.0","74.99","69.99","","Y","N","N","884894637173 ;4104940304080"],[" 08.5","74.99","69.99","","Y","N","N","884894637180 ;4104940304085"],[" 09.5","74.99","69.99","","Y","N","N","884894637203 ;4104940304095"],[" 10.0","74.99","69.99","","Y","N","N","884894637210 ;4104940304100"],[" 11.0","74.99","69.99","","Y","N","N","884894637234 ;4104940304110"],[" 11.5","74.99","69.99","","Y","N","N","884894637241 ;4104940304115"],[" 12.0","74.99","69.99","","Y","N","N","884894637258 ;4104940304120"],[" 13.0","74.99","69.99","","Y","N","N","884894637272 ;4104940304130"],[" 14.0","74.99","69.99","","Y","N","N","884894637296 ;4104940304140"],[" 15.0","74.99","69.99","","Y","N","N","884895959366 ;4104940304150"],[" 16.0","74.99","69.99","","Y","N","N","884894637319 ;4104940304160"],[" 17.0","74.99","69.99","","Y","N","N","884894637326 ;4104940304170"],[" 18.0","74.99","69.99","","Y","N","N","884894637333 ;4104940304180"],[" 19.0","74.99","69.99","","Y","N","N","884894637340 ;4104940209190"],[" 20.0","74.99","69.99","","Y","N","N","884894637357 ;4104940209200"]],true,false,false,[],{"PRODUCT_TOP_SALES_AMOUNT":"1589.77","SHOE_UPPER_HEIGHT":"Low","PRODUCT_RELEVANCE_RANKING":"0.98300000000000","FREE_STANDARD_SHIPPING":false,"PLAYER_PROFILE_-_BASKETBALL":"Center, Forward, Point Guard, Power Forward, Shooting Guard","SHOE_CLOSURE":"Lace","SHOE_OUTSOLE":"Rubber","CHANNEL_AVAIL_ICON":"IN_STORE","ELIGIBLE_SHIPTOSTORE":true,"PRODUCT_NEW_ARRIVAL_DATE":"11\/02\/2009","SHOE_CUSHIONING":"Rubber Cup","SPECIFIC_PRODUCT_TYPE":"Casual Basketball Shoes","SHOE_WEIGHT":"14.6 oz","PREMIER_BOGO":"","SHOE_UPPER_MATERIAL":"Leather"},"","","Black\/White","Width - D - Medium","","","","","",false,false,"Black","White",[],{}],"S84872":["<span class='attType_color'>Black\/Black\/Power Red<\/span> | <span class='attType_width'>Width - D - Medium<\/span>",false,true,"","truesize.gif","74.99","74.99",[[" 07.0","74.99","74.99","","Y","N","N"," "],[" 07.5","74.99","74.99","","Y","N","N","888168100059;4100273304075"],[" 08.0","74.99","74.99","","Y","N","N","888168100035;4100273304080"],[" 08.5","74.99","74.99","","Y","N","N","888168181652;4100273304085"],[" 09.0","74.99","74.99","","Y","N","N","888168100127;4100273304090"],[" 09.5","74.99","74.99","","Y","N","N","888168100097;4100273304095"],[" 10.0","74.99","74.99","","Y","N","N","888168100189;4100273304100"],[" 10.5","74.99","74.99","","Y","N","N","888168100196;4100273304105"],[" 11.0","74.99","74.99","","Y","N","N","888168100165;4100273304110"],[" 11.5","74.99","74.99","","Y","N","N","888168104286;4100273304115"],[" 12.0","74.99","74.99","","Y","N","N","888168104262;4100273304120"],[" 12.5","74.99","74.99","","Y","N","N"," "],[" 13.0","74.99","74.99","","Y","N","N","888168100066;4100273304130"]],true,false,false,[],{"PRODUCT_TOP_SALES_AMOUNT":"0.00","SHOE_UPPER_HEIGHT":"Low","PRODUCT_RELEVANCE_RANKING":"0.80700000000000","FREE_STANDARD_SHIPPING":true,"PLAYER_PROFILE_-_BASKETBALL":"Center, Forward, Point Guard, Power Forward, Shooting Guard","SHOE_CLOSURE":"Lace","SHOE_OUTSOLE":"Rubber","CHANNEL_AVAIL_ICON":"IN_STORE","ELIGIBLE_SHIPTOSTORE":true,"PRODUCT_NEW_ARRIVAL_DATE":"11\/25\/2014","SHOE_CUSHIONING":"Rubber Cup","SPECIFIC_PRODUCT_TYPE":"Casual Basketball Shoes","PRODUCT_HIGHLIGHT_COLOR":"Dark Green, White","SHOE_WEIGHT":"14.6 oz","PREMIER_BOGO":"","SHOE_UPPER_MATERIAL":"Leather"},"","","Black\/Black\/Power Red","Width - D - Medium","","","","0","FREE_STANDARD_SHIPPING",false,false,"Black","Red",[],{}],"M21231":["<span class='attType_color'>Black\/Collegiate Red\/White<\/span> | <span class='attType_width'>Width - D - Medium<\/span>",false,true,"","truesize.gif","74.99","74.99",[[" 07.5","74.99","74.99","","Y","N","N","887780112556;4105766104075"],[" 09.5","74.99","74.99","","Y","N","N","887780112594;4105766104095"],[" 10.0","74.99","74.99","","Y","N","N","887780112600;4105766104100"],[" 10.5","74.99","74.99","","Y","N","N","887780112617;4105766104105"],[" 11.0","74.99","74.99","","Y","N","N","887780112624;4105766104110"],[" 11.5","74.99","74.99","","Y","N","N","887780112631;4105766104115"],[" 12.0","74.99","74.99","","Y","N","N","887780112648;4105766104120"]],true,false,false,[],{"PRODUCT_TOP_SALES_AMOUNT":"74.99","SHOE_UPPER_HEIGHT":"Low","PRODUCT_RELEVANCE_RANKING":"0.77000000000000","FREE_STANDARD_SHIPPING":true,"PLAYER_PROFILE_-_BASKETBALL":"Center, Forward, Point Guard, Power Forward, Shooting Guard","SHOE_CLOSURE":"Lace","SHOE_OUTSOLE":"Rubber","CHANNEL_AVAIL_ICON":"IN_STORE","ELIGIBLE_SHIPTOSTORE":true,"PRODUCT_NEW_ARRIVAL_DATE":"08\/16\/2014","SHOE_CUSHIONING":"Rubber Cup","SPECIFIC_PRODUCT_TYPE":"Casual Basketball Shoes","PRODUCT_HIGHLIGHT_COLOR":"White","SHOE_WEIGHT":"14.6 oz","PREMIER_BOGO":"","SHOE_UPPER_MATERIAL":"Leather"},"","","Black\/Collegiate Red\/White","Width - D - Medium","","","","0","FREE_STANDARD_SHIPPING",false,false,"Black","Red",[],{}],"M21232":["<span class='attType_color'>White\/Collegiate Royal\/White<\/span> | <span class='attType_width'>Width - D - Medium<\/span>",false,true,"","truesize.gif","74.99","74.99",[[" 10.5","74.99","74.99","","Y","N","N","887780112822;4105770304105"],[" 11.0","74.99","74.99","","Y","N","N","887780112839;4105770304110"],[" 11.5","74.99","74.99","","Y","N","N","887780112846;4105770304115"],[" 12.0","74.99","74.99","","Y","N","N","887780112853;4105770304120"],[" 12.5","74.99","74.99","","Y","N","N","887780112860;4105770304125"],[" 13.0","74.99","74.99","","Y","N","N","887780112877;4105770304130"]],true,false,false,[],{"PRODUCT_TOP_SALES_AMOUNT":"74.99","SHOE_UPPER_HEIGHT":"Low","PRODUCT_RELEVANCE_RANKING":"0.74400000000000","FREE_STANDARD_SHIPPING":true,"PLAYER_PROFILE_-_BASKETBALL":"Center, Forward, Point Guard, Power Forward, Shooting Guard","SHOE_CLOSURE":"Lace","SHOE_OUTSOLE":"Rubber","CHANNEL_AVAIL_ICON":"IN_STORE","ELIGIBLE_SHIPTOSTORE":true,"PRODUCT_NEW_ARRIVAL_DATE":"08\/21\/2014","SHOE_CUSHIONING":"Rubber Cup","SPECIFIC_PRODUCT_TYPE":"Casual Basketball Shoes","SHOE_WEIGHT":"14.6 oz","PREMIER_BOGO":"","SHOE_UPPER_MATERIAL":"Leather"},"","","White\/Collegiate Royal\/White","Width - D - Medium","","","","0","FREE_STANDARD_SHIPPING",false,false,"White","Blue",[],{}]};
var styles_94651 = styles;

var productLaunchTimeUntil = 118847;
var productLaunchStyles = ["05457002","05457003","05457004","05458002","15519610","20659501","20659601","24556","24560","25400","25401","25402","25442023","34235","34236","35741801","35741802","35741803","6663A","69942601","84593301","84722006","85153600","85181302","85184302","85185302","85191302","9477R","9487R","9497R","98902001","98902003","98902004","98903001","98903006","B24558","B24559","S85114","4104255","6576050","84664023","84665023","84666023","84667023"];

var requestKey = '50Fb685F9ADD623D';

var SameDayDeliveryEnabled = false;
var SameDayDeliveryPath = "/sdd/eligibility";
var aSameDayDeliveryItems = [];
var SameDayDeliveryMessage = 'Item may be eligible for same day delivery';
var SameDayDeliveryMessageTipped = "";


</script>
 <!-- START Quick View -->
<p>
<link rel="stylesheet" type="text/css" href="http://www.footlocker.com/shared/quickview/quickview.css" />
<link rel="stylesheet" type="text/css" href="http://www.footlocker.com/ns/css/quickview.css" />
<script type="text/javascript"><!--
        var excludedDetailMessage = 'The dollar value of this item will count toward meeting a required minimum purchase total necessary to receive a discount, but the price of this item itself will not be discounted. Only other eligible items in your cart will be discounted. (Example: You can purchase this product to reach the order threshold to receive a discount, but you will only receive the discount on other eligible items in your cart.)';
        var global_quickViewButtonPath = "/images/fl/quickview/" + "quickview_eb.gif";
        var global_quickViewPDPTemplatePath = "/quickview/quickviewPDP.cfm";
        var global_quickViewZoomImagePath = "/quickview/quickviewZoomImage.cfm";
        var global_quickViewFreeStandardShippingDetails = "Offer only valid on eligible items. Look for \"free shipping\" text. Items in your cart that are not eligible are subject to shipping charges. Shipping will be automatically deducted at checkout. Valid only at eastbay.com. Offer is limited to standard delivery within the contiguous US. Excludes bulk orders, team orders and drop ships. Entire order must be shipped to a single address. Does not apply to prior purchases or open orders and cannot be combined with any other offer. Customer is responsible for shipping costs on returned merchandise. Promotion may be modified or terminated at any time. Certain restrictions and exclusions may apply.";
        var global_quickViewMaskPurchasePriceDetails = "Please add this item to your cart to see a special price just for you!";
        //var global_quickViewUseURLRewrite = true;
// --></script>
<script type="text/javascript" src="http://www.footlocker.com/shared/quickview/quickview.js"></script>
<script type="text/javascript" src="http://www.footlocker.com/shared/quickview/quickviewPDP.js"></script>
<script type="text/javascript"><!--
        // preload the button image
        global_quickviewButtonImage.src = global_quickViewButtonPath;
// --></script>
<script type="text/javascript"><!--
  if (location.protocol === 'https:') {
    var miniCartLegacyYMALTemplate = "https://www.footlocker.com/miniAddToCart/ymal.cfm";
    var cartTemplate = "https://www.footlocker.com/catalog/orderSummary.cfm";
    var miniCartYmalsTemplate = "https://www.footlocker.com/miniAddToCart/miniCartYmals.cfm";
    var moreYmalsTemplate = "https://www.footlocker.com/miniAddToCart/miniCartExtendedYmals.cfm";
    var moreYmalsImage = "https://www.footlocker.com/images/fl/buttons/btn_minicart_more_ymal.jpg";

} else {
    var miniCartLegacyYMALTemplate = "http://www.footlocker.com/miniAddToCart/ymal.cfm";
    var cartTemplate = "http://www.footlocker.com/catalog/orderSummary.cfm";
    var moreYmalsTemplate = "http://www.footlocker.com/miniAddToCart/miniCartExtendedYmals.cfm";
    var miniCartYmalsTemplate = "http://www.footlocker.com/miniAddToCart/miniCartYmals.cfm";
    var moreYmalsImage = "http://www.footlocker.com/images/fl/buttons/btn_minicart_more_ymal.jpg";
}
    
    var miniAddToCartXOffset = 6;
    var BORISEnabled = true;
// --></script>
</p>
<!-- END Quick View -->
<p>
<link rel="alternate" href="http://m.footlocker.com/?uri=product&sku=677374&model=94651" />
</p>
<div id="fb-root"></div>
<p>
<script type="text/javascript"><!--
        (function(d, s, id) {
    
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
// --></script>
</p>
<p>
<link rel="stylesheet" href="http://www.footlocker.com/ns/common/css/jquery.lib.1.1.4.css" />
<!--  PROD
<link rel="stylesheet" href="http://www.footlocker.com/combine?type=css&files=/images/fl/common/pdp/css/pdp_styles.css,/images/fl/pdp/css/pdp_styles.css" mce_href="http://www.footlocker.com/combine?type=css&files=/images/fl/common/pdp/css/pdp_styles.css,/images/fl/pdp/css/pdp_styles.css" />
--><!--  DEV  -->
<link rel="stylesheet" href="http://www.footlocker.com/ns/common/pdp/css/pdp_styles_v1.2.css" />
<!--
<link href="http://www.footlocker.com/ns/pdp/css/pdp_styles_v1.2.css" mce_href="http://www.footlocker.com/ns/pdp/css/pdp_styles_v1.2.css" rel="stylesheet" />
-->
<link rel="stylesheet" href="http://www.footlocker.com/ns/pdp/css/pdp_styles.css?cd=0" />
</p>
<form id="product_form" method="post" name="product_form" action="/catalog/addToCart"><input id="requestKey" name="requestKey" value="50Fb685F9ADD623D" type="hidden" /> <input id="pdp_quantity" name="qty" value="1" type="hidden" /> <input id="pdp_selectedSize" name="size" value="" type="hidden" /> <input id="pdp_model" name="the_model_nbr" value="94651" type="hidden" /> <input id="pdp_selectedSKU" name="sku" value="677374" type="hidden" /> <input id="pdp_storeNumber" name="storeNumber" value="00000" type="hidden" /> <input id="pdp_fulfillmentType" name="fulfillmentType" value="SHIP_TO_HOME" type="hidden" /> <input id="pdp_storeCostOfGoods" name="storeCostOfGoods" value="0.00" type="hidden" /> <input id="pdp_inlineAddToCart" name="inlineAddToCart" value="0" type="hidden" /> <input id="pdp_coremetrics" name="coreMetricsCategory" value="blank" type="hidden" /> <input id="pdp_hasXYPromo" name="hasXYPromo" value="false" type="hidden" />
<div class="pdp_wrapper" itemtype="http://data-vocabulary.org/Product" itemscope="itemscope">
<meta content="adidas Originals" itemprop="brand" />
<div class="main_divider"></div>
<div class="top_heading"><!--  START BREADCRUMBS  -->
<div class="breadCrumb"><a tabindex="510" href="http://www.footlocker.com">Home</a>&nbsp;:<span id="pdp-breadcrumb-backsearch"><a tabindex="511" href="javascript:continueShoppingLink();">Back to Search Results</a> :</span> adidas Originals Superstar 2 - Men's</div>
<!--  END BREADCRUMBS  --><!-- START RECENTLY VIEWED -->
<div class="recently_viewed"><span class="rv_title" tabindex="512">Recently Viewed</span><span class="rv_content"></span></div>
<!-- END RECENTLY VIEWED --></div>
<!-- START RETURN WISH LIST -->
<div class="return_wishlist"><!-- return to wishlist --></div>
<!-- END RETURN WISH LIST -->
<div class="pdp_header"><span class="tab"><a tabindex="520" href="#" data-tab="shoe_image">Images</a></span> <span class="tab"><a tabindex="525" href="#" data-tab="description">Description</a></span> <span class="tab"><a tabindex="530" href="#" data-tab="reviews">Reviews</a></span> <span class="tab"><a tabindex="535" href="#" data-tab="sizing">Size & Fit</a></span> <span class="tab last"><a tabindex="540" href="#" data-tab="questions">Q & A</a></span></div>
<span class="left_column"><!-- START SHOE IMAGES -->
<div class="shoe_images" data-tabcontent="shoe_image">
<div id="product_images" class="product_image" title="adidas Originals Superstar 2 - Men's" data-info="product_images"><img alt="adidas Originals Superstar 2 - Men's" src="//images.footlocker.com/pi/677374/zoom/adidas-originals-superstar-2-mens" border="0" /></div>
<span id="zoominit"></span>
<div class="product_info">
<div class="style_info"><span class="label">Selected Style:</span> <span class="value" data-info="product_attr"><span class='attType_color'>Black/White</span>  |  <span class='attType_width'>Width - D - Medium</span></span></div>
<div class="sku_number"><span class="label">Product #:</span> <span class="value" data-info="product_sku" id="productSKU">677374</span></div>
<div class="sku_messaging"></div>
</div>
<!--  START OTHER STYLES Cartridge  -->
<div class="other_styles" data-info="product_styles"></div>
<!--  END OTHER STYLES Cartridge  --><!--  START VIDEOS Cartridge  -->
<div id="product_videos" class="videos" data-info="product_videos"></div>
<!--  END VIDEOS Cartridge  --><!--  START MyBuys Cartridge  -->
<div class="recommendations" data-info="product_recommendations">
<div class="heading" tabindex="650">Similar Products<span class="highlight"></span></div>
<div id="mybuyszone2" mybuyszone="2"></div>
</div>
<!--  END MyBuys Cartridge --><!--  START FIT Cartridge  -->
<div id="product_fit_info" class="fit_info" data-info="fit_icon"></div>
<!--  END FIT Cartridge  --></div>
<!-- END SHOE IMAGE Cartridge --><!-- START DESCRIPTION Cartridge -->
<div class="pdp_description" data-tabcontent="description">
<div class="icons" data-icon1="" data-icon2=""></div>
<div class="description"><span class="heading" tabindex="525"><span class="highlight"></span></span><span id="model_name" class="product_title" tabindex="525" itemprop="name">adidas Originals Superstar 2 - Men's</span> <span style="display: none;" itemtype="http://data-vocabulary.org/Review-aggregate" itemscope="itemscope" itemprop="review"> 
<meta content="4.54" itemprop="rating" />
<meta content="278" itemprop="count" />
</span><span style="display: none;" itemtype="http://data-vocabulary.org/Offer" itemscope="itemscope" itemprop="offerDetails"> 
<meta content="USD" itemprop="currency" />
<meta content="69.99" itemprop="price" />
</span> 
<meta content="//images.footlocker.com/pi/677374/zoom/adidas-originals-superstar-2-mens" itemprop="image" />
<span tabindex="525" itemprop="description"><p>The iconic shell-toe shoes were once THE shoe of the NBA in the '70s.</p> <ul> <li>Upper made with durable yet breathable materials.</li> <li>Iconic rubber shell toe and outsole for durability.</li> <li>Wt. 14.4 oz.</li> </ul></span></div>
<div class="technical"><span class="heading"><span class="highlight"></span></span></div>
</div>
<!-- END DESCRIPTION Cartridge --><!-- START RATINGS AND REVIEW Cartridge -->
<div id="pdp_tabContent_reviews" class="pdp_reviews" data-tabcontent="reviews">
<div class="heading" tabindex="530">Approved Reviews<span class="highlight"></span></div>
<div id="BVRRSecondarySummaryContainer"></div>
<div id="BVRRContainer"></div>
</div>
<!-- END RATINGS AND REVIEW Cartridge --><!-- START SIZING Cartridge -->
<div class="pdp_sizing" data-tabcontent="sizing">Sizing</div>
<!-- END SIZING Cartridge --><!-- START QUESTIONS Cartridge -->
<div class="pdp_questions" data-tabcontent="questions">
<div id="BVQAContainer"></div>
<div style="display: none;" id="BVQACustomerID"></div>
<div style="display: none;" id="BVQAReturnURL">__RETURN__</div>
<div style="display: none;" id="BVQASessionParams"></div>
</div>
<!-- END QUESTIONS Cartridge --></span><!-- Start Right Column --><span class="right_column"><!-- START Title Cartridge -->
<div class="title" data-info="product_title">
<h1 tabindex="698">adidas Originals Superstar 2 - Men's</h1>
</div>
<!-- END Title Cartridge --><!-- START Price Cartridge -->
<div class="price" tabindex="699" data-info="product_price"></div>
<!-- END Price Cartridge --><!-- START Ratings Cartridge -->
<div class="ratings_reviews" tabindex="700" data-info="product_reviews">
<div id="BVRRSummaryContainer"></div>
</div>
<!-- END Ratings Cartridge --><!-- START Messaging Cartridge -->
<div class="messaging" tabindex="710" data-info="product_messaging"></div>
<!-- END Messaging Cartridge --><!-- START Sizes Cartridge -->
<div class="sizes" title="Select A Size" tabindex="725" data-info="product_sizes"></div>
<!-- END Sizes Cartridge --><!-- START Add To Cart Cartridge -->
<div class="delivery" data-info="product_delivery">
<div id="dm_shiptohome" tabindex="850"><span class="radio_btn"><input id="deliveryMethod_shiptohome" tabindex="850" name="rdo_deliveryMethod" value="shiptohome" type="radio" /></span> <label class="radio_checked" id="lbl_shiptohome" for="deliveryMethod_shiptohome"><span data-image="ship-truck"></span><span class="pdp_sprite" data-image="radio_btn"></span><span>Ship to Home
<div id="pdp_freeShipping">
<div class="black"><span class="red" data-message="free_shipping">FREE!</span></div>
</div>
</span></label></div>
<div id="dm_storepickup" tabindex="860"><span class="radio_btn"><input id="deliveryMethod_storepickup" tabindex="860" name="rdo_deliveryMethod" value="storepickup" type="radio" /> </span><label style="opacity: 1;" id="lbl_storepickup" for="deliveryMethod_storepickup"><span data-image="ship-store"></span><span class="pdp_sprite" data-image="radio_btn"></span><span>Store Pickup
<div id="storepickup_msg"><span class="small_link">(<span id="deliveryMethod_link">find a store</span>)</span></div>
</span></label></div>
</div>
<div class="add_to_cart" data-info="add_to_cart"><input title="Add To Cart Button" tabindex="869" name="pdp_addtocart" value="Add To Cart" type="submit" />
<div data-info="add_errors"></div>
</div>
<!-- END Add To Cart Cartridge --><!-- START Social Cartridge -->
<div class="social"><!-- START FACEBOOK LIKE -->
<div id="social_facebook" class="social_media">
<div class="fb-like" tabindex="870" data-action="like" data-width="5" data-show-faces="false" data-layout="button_count" data-send="false" data-colorscheme="light"></div>
</div>
<!-- END FACEBOOK LIKE --><!-- START FACEBOOK SHARE -->
<div id="social_facebookShare" class="social_media">
<div class="fb_share"><fb:share-button tabindex="871" type="button" href="http://www.footlocker.com/share/product/94651/677374/"></fb:share-button></div>
</div>
<!-- END FACEBOOK SHARE --><!-- START TWITTER -->
<div id="social_twitter" class="social_media" tabindex="872"><a class="twitter-share-button" href="http://twitter.com/share" data-url=" http://www.footlocker.com/product/model:94651/adidas-originals-superstar-2-mens" data-via="Foot Locker" data-count="none">Tweet</a>
<script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
</div>
<!-- END TWITTER --><!--  START GOOGLE -->
<div id="social_google" class="social_media" tabindex="873">
<div class="g-plusone" data-href="http://www.footlocker.com/product/model:94651/adidas-originals-superstar-2-mens" data-size="medium" data-annotation="none"></div>
<script type="text/javascript"><!--
                    (function() {
                        var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
                        po.src = 'https://apis.google.com/js/plusone.js';
                        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
                    })();
// --></script>
</div>
<!-- END GOOGLE --><!-- START PINTEREST -->
<div id="social_pinterest" class="social_media" tabindex="874"><a class="pin-it-button" tabindex="874" href="http://pinterest.com/pin/create/button/?url=http://www.footlocker.com/product/model:94651/adidas-originals-superstar-2-mens&media=//images.footlocker.com/pi/677374/zoom/adidas-originals-superstar-2-mens&description=%0A" data-pin-config="none"><img title="Pin It" src="https://assets.pinterest.com/images/PinExt.png" border="0" /></a>
<script type="text/javascript" src="https://assets.pinterest.com/js/pinit.js"></script>
</div>
<!-- END PINTEREST --></div>
<!-- END Social Cartridge --><!-- START Wishlist Cartridge -->
<div id="addToWishlist" class="add_to_wishlist"><input id="pdp_addtowishlist" title="Add To Wishlist Button" tabindex="875" name="pdp_addtowishlist" value="Add To Wish list" type="button" /></div>
<!-- END Wishlist Cartridge --></span><!-- End Right Column --></div>
</form>
<p>
<script src="http://code.jquery.com/ui/1.9.0/jquery-ui.js"></script>
<script src="http://www.footlocker.com/ns/common/jquery/jquery.ui.touch-punch.min.js"></script>
<!--<mce:script src="http://www.footlocker.com/ns/common/jquery/uat/jquery.lib.1.2.9.js?cd=0" mce_src="http://www.footlocker.com/ns/common/jquery/uat/jquery.lib.1.2.9.js?cd=0"></mce:script>--><!--  PROD <mce:script src="/combine?type=js&files=/images/fl/common/pdp/js/pdp.js,/images/fl/pdp/js/pdp.js" mce_src="/combine?type=js&files=/images/fl/common/pdp/js/pdp.js,/images/fl/pdp/js/pdp.js"></mce:script> --><!-- DEV -->
<script src="http://www.footlocker.com/ns/common/pdp/js/pdp_core.js?cd=0"></script>
<script src="http://www.footlocker.com/ns/pdp/js/pdp_extend.js?cd=0"></script>
<!-- <mce:script src="http://www.footlocker.com/images/fl/common/pdp/js/cms/pdp.js" mce_src="http://www.footlocker.com/images/fl/common/pdp/js/cms/pdp.js" type="text/javascript"></mce:script> -->
<style type="text/css"><!--
@import '/combine?type=css&files=shared/tipped/tipped.css,/css/typography.css,/css/style.css,/css/default_template.css,shared/quickview/quickview.css,shared/quickview/quickviewPDP.css,shared/wishlist/wl_addToWishlist.css,shared/inlineAddToCart/miniAddToCart.css,shared/tellafriend/tellafriend.css,shared/gLightBox/gLightBox.css,shared/wishlist/wl_sharedWishList.css,shared/myAccount/login.css,shared/endeca/css/autosuggest_inquisitor.css,/endeca/autosuggest.css';
--></style>
<style><!--
        /*#moreYmalWindowLoading {
            background: transparent url(http://www.footlocker.com/images/fl/quickview/quickview_loader.gif) center no-repeat;
        }*/
        #moreYmalWindowContent {
            border-color: #ee3a43;
        }
        
        #moreYmalWindow_top {
            background: transparent url(http://www.footlocker.com/images/fl/minicart/background_top_left.png) top left no-repeat;
        }
        
        #moreYmalWindow_topRight {
            background: transparent url(http://www.footlocker.com/images/fl/minicart/background_top_right.png) top right no-repeat;
            font-size: 17px;
            padding-left: 200px;
            padding-top: 30px;
        }
        
        #moreYmalWindow_middle {
            background: transparent url(http://www.footlocker.com/images/fl/minicart/background_middle_left.png) top left repeat-y;
        }
        
        #moreYmalWindow_middleRight {
            background: transparent url(http://www.footlocker.com/images/fl/minicart/background_middle_right.png) top right repeat-y;
        }
        
        #moreYmalWindow_bottom {
            background: transparent url(http://www.footlocker.com/images/fl/minicart/background_bottom_left.png) top left no-repeat;
        }
        
        #moreYmalWindow_bottomRight {
            background: transparent url(http://www.footlocker.com/images/fl/minicart/background_bottom_right.png) top right no-repeat;
        }
    
        .loading {
            background: transparent url(http://www.footlocker.com/images/fl/quickview/quickview_loader.gif) center no-repeat;
        }
--></style>
<script type="text/javascript"><!--
var cm_ClientID = '90101910';
if(typeof(cmSetProduction) == "function") {
    cmSetProduction();
}
cm_HOST = "rpt.footlocker.com" + "/eluminate?";
// --></script>
<script src="http://www.footlocker.com/combine?type=js&files=shared/wishlist/wl_addToWishlist.js,shared/inlineAddToCart/miniAddToCart.js,shared/tellafriend/tellafriend.js,shared/gLightBox/gLightBox.js,shared/wishlist/wl_sharedWishList.js,shared/myAccount/login.js" type="text/javascript"></script>
<script type="text/javascript" src="//footlocker.ugc.bazaarvoice.com/static/8001/bvapi.js"></script>
<script type="text/javascript"><!--
$(document).ready(function(){
if (isIntangible === true) {
    $('div[data-info=product_delivery]').addClass('intangible');
    $('#product_styles a').on('click touchstart', function () {
        if (isIntangible === true) {
            $('div[data-info=product_delivery]').hide();
        }
    });
    $('#product_styles a').hover(function () {
        if (isIntangible === true) {
            $('div[data-info=product_delivery]').hide();
        }
    });
}
});
// --></script>
<style><!--
.intangible{display: none !important;}
--></style>
</p>
 
<script type="text/javascript">
        var dtm_promo_id = "";
        var dtm_customer_id ="";
        var dtm_department = "";
        var dtm_category = "";
        var dtm_sub_category = "";
        var dtm_sport = "";
        var dtm_brand = "";
        var dtm_gender = "";
        var dtm_team = "";
        var dtm_sku = "";
        var dtm_img_url = "";
        var dtm_loc = document.location.href;
        var dtm_cg = "Home\x3APageView";
        var dtm_matchback_id = "85753122614215912211151687";
        var dtm_platform = "Desktop";

        var dtm_video_id = "";
        var dtm_video_name = "";
        var dtm_article_id = "";
        var dtm_article_name = "";

        var dtm_search_term = "";
</script>

        <script type="text/javascript">
                var dtm_promo_id = "4";
        
                var dtm_department = "";
        
                var dtm_brand = "adidas Originals";
                var dtm_gender = "Men's";
                var dtm_team = "";
                var dtm_sku = "677374";
                var dtm_img_url = "http://www.footlocker.com/images/products/large_w/677374_w.jpg";
        </script>
        <script src="http://www.footlocker.com/scripts/dotomi_abandon.js" type="text/javascript"></script>
        
                <script type="text/javascript">
                        mybuys.setPageType("PRODUCT_DETAILS");
                        mybuys.set("productid","677374");
                </script>
         <!-- end inside div -->
</div>
<div class="footer-hr">&nbsp;</div>
<!-- START Full Width Wrapper -->
<div id="fl_footer_fullWidth">
    <script type="text/javascript" language="javascript" src="/ns/chat/js/hours-toggle-footer-v2.js?cd=0"></script>

    <!-- Inner Container 968px -->
    <div id="fl_footer_container">

        <!-- START Column 1 -->
        <div id="fl_footer_col1">
            <a tabindex="9050" href="http://www.footlocker.com/promotion/promoId:5001288/footlocker-gift-cards/?cm_sp=footer-_-Button-_-Giftcards" title="Foot Locker Gift Cards" class="normal">
                <p>
                    <span>Foot Locker Gift Cards</span><br />
                    Never Expires/No Fees.<br />Even if the card says otherwise.
                </p>
                <img src="http://www.footlocker.com/images/fl/global/pixel.gif" height="67" width="120" border="0" class="footer_sprite gift_card" />
            </a>
            <a tabindex="9051" href="http://dailysweeps.footlocker.com/" title="Win Daily Prizes" class="normal">
                <p>
                    <span>Win Daily Sweepstakes</span><br />
                    Hundreds of prizes awarded! A winner <br />every day.
                </p>
                <img src="http://www.footlocker.com/images/fl/global/pixel.gif" height="30" width="100" border="0" class="footer_sprite sweeps" />
            </a>
            <div tabindex="9052" class="footer_live_chat">
                <script type="text/javascript" language="javascript">showFooterChat();</script>
            </div>

            <div id="footer-footlocker-logos-container">
                <a tabindex="9052" id="footlocker-europe-logo" title="Go to Foot Locker Europe website" href="http://www.footlocker.eu/"  target="_blank"></a>
                <div id="footlocker-logos-container-stacker">
                    <a tabindex="9052" id="lady-footlocker-logo" title="Go to Lady Foot Locker website" href="http://www.ladyfootlocker.com/"  target="_blank"></a>
                    <a tabindex="9052" id="kids-footlocker-logo" title="Go to Kids Foot Locker website" href="http://www.kidsfootlocker.com/" target="_blank"></a>
                </div>
                <a tabindex="9052" id="footlocker-canada-logo" title="Go to Foot Locker Canada website" href="http://www.footlocker.ca/"  target="_blank"></a>
            </div>
            
            <script type="text/javascript">
                var touch_device = (typeof document.ontouchstart != "undefined") ? true : false;
    
                if (touch_device) {
                    $('#footer-footlocker-logos-container').addClass('touch');
                } else {
                    $('#footer-footlocker-logos-container').addClass('no-touch');
                }
            </script>

    
        </div> <!-- END Column 1 -->
        <!-- START Column 2 -->
        <div id="fl_footer_col2">
            <h3>TOP SEARCHES</h3>
            <ul>
                <li><a tabindex="9054" href="http://www.footlocker.com/_-_/keyword-asics+running+shoes?cm_sp=footer-_-topsellers-_-asicsrunshoes" title="ASICS Running Shoes">ASICS Running Shoes</a></li>
                <li><a tabindex="9055" href="http://www.footlocker.com/_-_/keyword-nike+elite+socks?cm_sp=footer-_-topsellers-_-EliteSocks" title="Nike Elite Socks">Nike Elite Socks</a></li>
                <li><a tabindex="9056" href="http://www.footlocker.com/_-_/keyword-casual+shoes?cm_sp=footer-_-topsellers-_-casualshoes" title="Casual Shoes">Casual Shoes</a></li>
                <li><a tabindex="9057" href="http://www.footlocker.com/_-_/keyword-nike+running+shoes?cm_sp=footer-_-topsellers-_-nikerunshoes" title="Nike Running Shoes">Nike Running Shoes</a></li>
                <li><a tabindex="9058" href="http://www.footlocker.com/promotion/promoId:5002524/basketball-shoes/?cm_sp=footer-_-topsellers-_-BballShoes" title="Basketball Shoes">Basketball Shoes</a></li>
                <li><a tabindex="9059" href="http://www.footlocker.com/_-_/keyword-nike+air+force+1?cm_sp=footer-_-topsellers-_-af1" title="Nike Air Force 1">Nike Air Force 1</a></li>
                <li><a tabindex="9060" href="http://www.footlocker.com/outlet/category/?cm_sp=footer-_-topsellers-_-SaleShoes" title="Sale Shoes">Sale Shoes</a></li>
            </ul>
            <h3>GET CONNECTED</h3>
            <a tabindex="9061" href="http://www.facebook.com/footlocker" title="Foot Locker Facebook" target="_blank" class="footer_sprite footer_fb"><img src="http://www.footlocker.com/images/fl/global/pixel.gif" height="36" width="36" border="0" /></a>
            <a tabindex="9062" href="https://twitter.com/footlocker" title="Follow Foot Locker on Twitter" target="_blank" class="footer_sprite footer_tw"><img src="http://www.footlocker.com/images/fl/global/pixel.gif" height="36" width="36" border="0" /></a>
            <a tabindex="9063" href="http://instagram.com/" title="Follow Foot Locker on Instagram" target="_blank" class="footer_sprite footer_pt"><img src="http://www.footlocker.com/images/fl/global/pixel.gif" height="36" width="36" border="0" /></a>
            <a tabindex="9064" href="http://www.youtube.com/footlocker" title="Subscribe to Foot Locker on YouTube" target="_blank" class="footer_sprite footer_yt"><img src="http://www.footlocker.com/images/fl/global/pixel.gif" height="36" width="36" border="0" /></a>
        </div> <!-- END Column 2 -->
        <!-- START Column 3 -->
        <div id="fl_footer_col3">
            <h3>CUSTOMER SERVICE</h3>
            <ul>
                <li><a tabindex="9065" href="http://www.footlocker.com/customerserv/help:orderInfo/" title="Ordering Help">Ordering Help</a></li>
                <li><a tabindex="9066" href="http://www.footlocker.com/customerserv/help:privacyPolicy/" title="Privacy Policy">Privacy Policy</a></li>
                <li><a tabindex="9067" href="http://www.footlocker.com/customerserv/help:privacyPolicy/?section=adchoices" title="Ad Choices">Ad Choices</a></li>
                <li><a tabindex="9068" href="http://www.footlocker.com/customerserv/help:terms/" title="Terms of Use">Terms of Use</a></li>
                <li><a tabindex="9069" href="http://www.footlocker-inc.com/company.cfm?page=foot-locker" target="_blank" title="About Us">About Us</a></li>
                <li><a tabindex="9070" href="http://www.footlocker.com/customerserv/help:shipInfo/" title="Shipping Info">Shipping Info</a></li>
                <li><a tabindex="9071" href="http://www.footlocker.com/customerserv/help:sportSpecificSizing/" title="Sizing Help">Sizing Help</a></li>
                <li><a tabindex="9072" href="http://www.footlocker.com/customerserv/help:returnsExchanges/" title="Returns and Exchanges">Returns &amp; Exchanges</a></li>
                <li><a tabindex="9073"href="http://www.footlocker.com/sitemap/" title="Footlocker.com Sitemap">Sitemap</a></li> <!-- Production -->
                <!-- <li><a tabindex="9073" href="http://www.footlocker.com/promotion/promoId:5002730" title="Footlocker.com Sitemap">Sitemap</a></li>--> <!--UAT -->
                <li><a tabindex="9074" href="http://www.footlocker.com/promotion/promoId:5002090/footlocker-affiliate/" title="Affiliates">Affiliates</a></li>
                <li><a tabindex="9075" href="http://www.sneakerjobs.com/" target="_blank" title="Careeer Opportunities">Career Opportunities</a></li>
                <li><a tabindex="9076" href="http://www.footlocker.com/promotion/promoId:5002469/foot-locker-store-locator/?cm_sp=footer-_-Text-_-StoreLocator" title="Foot Locker Store Locator">Store Locator</a></li>
                <li><a tabindex="9077" href="http://www.footlocker-inc.com/" target="_blank" title="Foot Locker, Inc.">Foot Locker, Inc.</a></li>
            </ul>
        </div> <!-- END Column 3 -->
        <!-- START Column 4 -->
        <div id="fl_footer_col4">
            <a tabindex="9078" href="http://www.footlocker.com/promotion/promoId:5002563/?cm_sp=footer-_-Button-_-VIP" title="Become A VIP">
                <span class="footer_sprite footer_vip">&nbsp;</span>
                <p class="vip_par">
                    <span>Join now and get $10 off<br />a future purchase.</span><br />
                    Exclusive offers, updates and VIP access to special events.
                </p>
            </a>
            <p><span>Need to reach us for a question, comment or suggestion?</span></p>
            <p class="tel_num">1.800.991.6815</p>
            <a tabindex="9079" href="http://ebm.cheetahmail.com/r/regf2?a=0&aid=1095704045&n=2" target="_blank" title="Email Sign Up">
                <p>
                    <span>Email Exclusives</span><br />
                    Sign up now to receive special<br />offers and exclusives.
                </p>
            </a>
            <form id="quickEmail" onsubmit="open_emailform(); return false;">
                <div class="footer_sprite footer_email">
                    <input tabindex="9080" title="Enter Email Address" type="email" id="userEmail" value="Enter Email Address" onfocus="if(this.value=='Enter Email Address'){this.value=''}" onblur="if(this.value==''){this.value='Enter Email Address'}" />
                    <img src="http://www.footlocker.com/images/fl/global/pixel.gif" height="47" width="20" border="0" class="email_submit_btn" onclick="open_emailform()" />
                </div>
            </form>
        </div> <!-- END Column 4 -->
        <!-- START Footer Copyright Line -->
        <div id="cleardiv"></div>

        <!-- start back to mobile link -->
        <div id="back_to_mobile_container"><a href="http://m.footlocker.com" id="back_to_mobile">view mobile site</a></div>
        <!-- end back to mobile link -->
        <div id="copyright_line">
            <p>Prices subject to change without notice.  Products shown may not be available in our stores. ( <a href="http://www.footlocker.com/customerserv/help:productInformation/">more info</a> ) &copy; 2014 Footlocker.com, Inc. All Rights Reserved</p>
        </div> <!-- END Copyright Line -->
        <!-- start footer-icons div -->

        <div id="footer-icons">
                   <div class="footer-icons-slot">
                <a href="http://www.footlocker.com/promotion/promoId:5002720/" title="Veterans Discount Program"><img src="/ns/common/images/veterans.png" alt="" width="57" height="45"></a>
            </div>
            <div class="footer-icons-slot"><a href="http://www.footlocker.com/promotion/promoId:5003553" title="SheerID Military Discount Program"><img src="/ns/common/images/fl-sheer-id.png" alt="SheerID Military Discount Program" height="45" /></a></div>
            <div class="footer-icons-slot">
                <!-- BEGIN STELLASERVICE SEAL CODE -->
                    <a class="stella-seal"></a>
                    <script defer src="//seal.stellaservice.com/public/js/seal.js"></script>
                <!-- END STELLASERVICE SEAL CODE -->
            </div>
            <div class="footer-icons-slot"><a target="_blank" href="https://www.mcafeesecure.com/RatingVerify?ref=www.footlocker.com" rel="nofollow"><img width="65" height="37" border="0" src="//images.scanalert.com/meter/www.footlocker.com/31.gif" alt="HACKER SAFE certified sites prevent over 99.9% of hacker crime." oncontextmenu="alert('Copying Prohibited by Law - HACKER SAFE is a Trademark of ScanAlert'); return false;"></a></div>
            <div class="footer-icons-slot"><a href="http://www.bizrate.com/ratings_guide/cust_reviews__mid--17345.html" target="_blank" rel="nofollow"><img src="//medals.bizrate.com/medals/dynamic/small/17345_medal.gif" alt="bizrate Customer Certified Site - Foot Locker Reviews at Bizrate" width="112" height="37" border="0" /></a></div>
            <div class="footer-icons-slot"><a href="javascript:openSponsor('https://www.paypal.com/');"><img alt="PayPal" src="http://www.footlocker.com/images/fl/paypal/btn_paypal_AcceptMark_68x43.gif" width="70" height="37" border="0"></a></div>
            <div class="footer-icons-slot margin-mod"><!--<script type="text/javascript" src="https://seal.verisign.com/getseal?host_name=www.footlocker.com&amp;size=S&amp;use_flash=YES&amp;use_transparent=YES&amp;lang=en"></script>--><br /><img src="/ns/footer/images/fl-footer-vs.jpg" alt="Foot Locker is secured by Norton" title="Foot Locker is secured by Norton" border="0"></div>
        <div class="clear"></div>
        </div>
        <!-- end footer-icons div -->

    </div> <!-- END inner container -->
</div> <!-- END Full Width Wrapper -->
<!-- BEGIN ADD TO HOMESCREEN CODE -->
<script language="javascript">
    if (navigator.userAgent.match(/iPad/i)) {

        var addToHomeConfig = {
            message: 'Install Foot Locker on your %device, tap %icon, and then <strong>"Add to Home Screen</strong>".',
            arrow: false
        };
        document.write('<link rel="apple-touch-icon" sizes="72x72" href="/images/fl/mobile/images/add_to_homescreen/ipad.png">');
        document.write('<link rel="stylesheet" href="/images/common/mobile/js/add_to_homescreen/css/add2home.css">');
        document.write('<script src="/images/common/mobile/js/add_to_homescreen/scripts/add2home.js" type="text/javascript"><\/script>')
    }
</script>
<!-- END ADD TO HOMESCREEN CODE -->
<!-- BEGIN MERCHANDISED TYPE AHEAD SCRIPT -->
<script src="/ns/common/jquery/jquery.lib.1.3.7.js"></script>
<script src="/ns/common/mta/js/mta.js?cd=0"></script>
<script>
    $(document).ready(function () {
        var mtaOptions = {
            halfWidth: 349, // width of type ahead with just the typeahead section and no flyout
            fullWidth: 760, // width of type ahead and flyout combined, set outside of mta object before calling mta.init(); varies per site
            maxChar: 38,    // max amount of characters in type ahead words before they need to be cut off and given '...'
            maxVertProd: 4, // maximum amount of vertical records that can display in flyout space
            maxHoriProd: 6,  // maximum amount of horizontal records that can display in flyout space
            siteName: 'Footlocker',
            searchDelay: 200, // amount of time (ms) to delay typeahead request after keyup
            flyoutActive: true // set this to false to deactivate the flyout
        };

        mta.init(mtaOptions);   // initialize mta with options
    });
    //Make Search left nav hide on no filters
    $(document).ready(function () {
        if ($("#endecaNav .mainsite_guided_navigation").length == 0 && $("#endecaNav").length > 0) {
            $('#endecaNav h3').css('display', 'none');
        }
    });
</script>
<!-- END MERCHANDISED TYPE AHEAD -->

<!-- Sticky Image -->
<script type="text/javascript" src="/ns/common/jquery/jquery.wings.js"></script>
<script>
$('body').wings({
        id:'flCorner',
        enabled: true,
        disableForTouch: true,
        height:165,
        width:140,
        position:'fixed',
        right:0,
        bottom:0,
        buffer:0,
        zOrder:3,
        link:'http://www.footlocker.com/release-dates/',
        image:'/ns/common/images/sticky/fl-stickygiftcardWOG.png',
        title:'Week Of Greatness Sneaker Releases',
        cmtag:'WOG',
        cmdomain:'www.footlocker.com'
});
</script>
<!-- /Sticky Image -->

<!-- Crazy Egg -->
<script type="text/javascript">
    setTimeout(function () {
        var a = document.createElement("script");
        var b = document.getElementsByTagName("script")[0];
        a.src = document.location.protocol + "//dnn506yrbagrg.cloudfront.net/pages/scripts/0018/1001.js?" + Math.floor(new Date().getTime() / 3600000);
        a.async = true; a.type = "text/javascript"; b.parentNode.insertBefore(a, b)
    }, 1);
</script>
<script type="text/javascript" src="/ns/common/js/quickViewReviews.js?cd=0"></script>

<!--[if lte IE 9]>
<script>
    /*
     * simulate placeholder functionality for search input
     */
    $(document).ready(function() {
        var placeholderTxt = $('#reduce_input_text_height').attr('placeholder');
        $('#reduce_input_text_height').val(placeholderTxt);
        $('#reduce_input_text_height').focus(function() {
            if($(this).val() == placeholderTxt) {
                $(this).val('');
            }
        }).blur(function() {
            if($(this).val() == '') {
                $(this).val(placeholderTxt);
            }
        });
    });
</script>
<![endif]-->

<!-- Google Code for Remarketing tag -->
<!-- Remarketing tags may not be associated with personally identifiable information or placed on pages related to sensitive categories. For instructions on adding this tag and more information on the above requirements, read the setup guide: google.com/ads/remarketingsetup -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1066681946;
var google_conversion_label = "SeLlCOaMwQMQ2ozR_AM";
var google_custom_params = window.google_tag_params;
var google_remarketing_only = true;
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/1066681946/?value=1.00&amp;label=SeLlCOaMwQMQ2ozR_AM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>

<script type="text/javascript" src="/ns/common/js/accessibility_tabindex.js"></script>
<script type="text/javascript" src="/ns/common/js/accessibility_checkout.js"></script>
<script type="text/javascript" src="/ns/common/js/accessibility_custserv.js"></script>

         <script type="text/javascript"> 
        try { mybuys.deferInitPage(); } catch(e) {}; 
        $(document).ready(function() { 
            try { mybuys.initPage(); } catch(e) {}; 
        }
    </script>
EOT
 return $content;
}
