/* In here:
<ul id="boxes">
add boxes in this format

<li class="box" id="ACTUALFONTNAME" class="SERIFORSOMETHING">
            <ul class="tagCloud">
                <li class="tag3">avant garde</li>
                <li class="tag5">cool</li>
                <li class="tag1">eurostile</li>
                <li class="tag5">experimental</li>
            </ul>
            <p class="fontName">ACTUALFONTNAME</p>
</li>
*/

<script>
$(document).ready(function(){
    $.getJSON("test.json",function(result){
      $.each(result, function(i, field){
        $("div").append(field + " ");
      });
    });
});
</script>