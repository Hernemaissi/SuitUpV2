// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.slides.min
// require_tree .

$(function() {

    $(".hidden").hide();

    $(".image_upload").change(function() {
        $(this).next().show();
    });

    $("#slides").slidesjs({
        width: 150,
        height: 150
    });

    $("#gender_female").click(function() {
        $("body").addClass('female');
    });
    $("#gender_male").click(function() {
        $("body").removeClass('female');
    });

    // Dropdown nav for small screens
    $(document).click(function() {
        $('#dropdown-nav').removeClass('expanded');
    });

    $('#dropdown-nav')
        .bind('click focus', function(e) {
            $(this).rentClass('expanded');
            $(this).focus();
            e.stopPropagation();
        })
        .blur(function() {
            $(this).removeClass('expanded');
        });

});