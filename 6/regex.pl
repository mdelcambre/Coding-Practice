#!/usr/bin/env perl
use LWP::Simple;

# 1. Needle: fox,
# Haystack: The quick brown fox jumped over the lazy dog.
print "Easy\n";
print "\n1: /(fox)/\n$1\n" if "The quick brown fox jumped over the lazy dog." =~ /(fox)/;

# Needle: 299.90,
# Haystack: Price: <a href=’/redirect.php’>$299.90</a>
print "\n2: /\$([0-9\.]+)/\n$1\n" if "Price: <a href=’/redirect.php’>\$299.90</a>" =~ /\$([0-9\.]+)/;

# 3. Needle: model # and sku #
# Haystack:
# http://www.footlocker.com/product/model:94651/sku:677374/adidas­originalssuperstar­2­mens/black/white/
print "\n3: /model:(\d+)\/sku:(\d+)/\n\$1=$1,\$2=$2\n" if "http://www.footlocker.com/product/model:94651/sku:677374/adidas­originalssuperstar­2­mens/black/white/" =~ /model:(\d+)\/sku:(\d+)/;;


$webpage = get("http://www.footlocker.com/product/model:94651/sku:677374/adidas­originalssuperstar­2­mens/black/white/");

# 4. The follow questions require visiting the link mentioned above and pulling from the page. 
# Needle: The “Outsole” material of the shoe from the product page
print "\n4: /(\w+)\W(\w+\W){3}outsole/\n$1\n" if $webpage =~ /(\w+)\W(\w+\W){3}outsole/;


# 5. The time since the product page from was launched
print "\n5: /http-equiv=\"published\" content=\"([^\"]+)\"/\n$1\n" if $webpage =~ /http-equiv="published" content="([^"]+)"/;

# 6. The brand name of this product (name of the subbrand of Adidas)
print "\n6: /adidas (\w+)/\n$1\n" if $webpage =~ /adidas (\w+)/;


# HARDER


# 1. Write a single regex that will match the following:
@test = ("http://www.newegg.com/Product/Product.aspx?Item=N82E16814127726",
    "http://www.newegg.com/Product/Product.aspx?Item=1J8­000M­00001",
    "http://www.newegg.com/Product/Product.aspx?Item=04E­0009­00014",
    "http://www.newegg.com/Product/Product.aspx?Item=20­171­833",
    "http://www.newegg.com/Product/Product.aspx?Item=9SIA05F02K0789"
);
print "\n\nHarder:\n\n";
print '1: /(\w\d{2}\w\d{10}|\d\w\d­\d{3}\w­\d{5})/'."\n";
foreach (@test) {
    if(/(\w\d{2}\w\d{10}|\d\w\d­\d{3}\w­\d{5})/){
        print "$_ = MATCH\n";
    } else {
        print "$_ = NO MATCH\n";
    }
}

# Please make assumptions as to what is a valid link structure and what isn’t.

# 2. HP appends a number at the end of their part numbers. Write a single replacement regex that
# replaces the ending 3 digits of the part number without wrongly replacing the digits from one that
# doesn’t have the suffix. The regex should satisfies all conditions listed below.

# CD972AN140 should turn into CD972AN
# CD962A should turn into CD962A
# CD527 should turn into CD527
# Q5949A should turn into Q5949A
print "\n".'2: s/(\w+\d{3,4}\w*)\d{3}$/$1/'."\n";
@test = ('CD972AN140','CD962A','CD527','Q5949A');
foreach (@test) {
    print "$_ -> ";
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
print "\n3:".' /(\d,){4}\d/'."\n";
foreach (@test) {
    if (/(\d,){4}\d/){
        print "$_ = PASS\n";
    } else {
        print "$_ = FAIL\n";
    }
}

