
$(function() {
    var availableTags =["thematrix","cray"];
    /*var availableTags = [
    "1950s",
    "1960s",
    "60s",
    "animals",
    "antique",
    "architect",
    "avant garde",
    "bell",
    "blackletter",
    "block",
    "blocks",
    "blood",
    "bold",
    "brush",
    "calligraphic",
    "calligraphy",
    "candy",
    "car",
    "cars",
    "cartoon",
    "casino",
    "century",
    "chalk",
    'children',
    'circus',
    'clarendon',
    'classic',
    'cocktail',
    'cold',
    'college',
    'comic',
    'computer',
    'cool',
    'copperplate',
    'corporate',
    'country',
    'courier',
    'cowboy',
    'curly',
    'cursive',
    'cute',
    'cyrillic',
    'death',
    'deco',
    'decorative',
    'diamond',
    'diamonds',
    'digital',
    'dingbats',
    'disco',
    'display',
    'distressed',
    'doodles',
    'dot',
    'matrix',
    'dots',
    'egyptienne',
    'elegant',
    'engraved',
    'eurostile',
    'experimental',
    'fancy',
    'fantasy',
    'fashion',
    'fat',
    'feminine',
    'film',
    'fire',
    'flower',
    'flowers',
    'food',
    'football',
    'formal',
    'fraktur',
    'frames',
    'free',
    'fresh',
    'fun',
    'funky',
    'funny',
    'futura',
    'future',
    'game',
    'gangster',
    'geometric',
    'girly',
    'gothic',
    'graffiti',
    'greek',
    'grotesk',
    'grunge',
    'halloween',
    'hand',
    'hand',
    'drawn',
    'hand-drawn',
    'handwriting',
    'headline',
    'heart',
    'heavy',
    'hippie',
    'horror',
    'humanist',
    'impact',
    'inline',
    'kids',
    'leaves',
    'letterpress',
    'ligatures',
    'light',
    'line',
    'logo',
    'love',
    'marker',
    'math',
    'medieval',
    'metal',
    'metro',
    'military',
    'modern',
    'modular',
    'monogram',
    'monster',
    'movie',
    'music',
    'narrow',
    'nature',
    'nautical',
    'neon',
    'newspaper',
    'old',
    'old',
    'english',
    'old',
    'style',
    'organic',
    'ornament',
    'ornamental',
    'ornaments',
    'outline',
    'paint',
    'pirate',
    'pixel',
    'poster',
    'punk',
    'renaissance',
    'retro',
    'rock',
    'rope',
    'rough',
    'round',
    'rounded',
    'royal',
    'runes',
    'sans',
    'scary',
    'school',
    'science',
    'scribble',
    'script',
    'serif',
    'sexy',
    'shadow',
    'sharp',
    'sign',
    'signature',
    'simple',
    'sketch',
    'slab',
    'slab',
    'serif',
    'space',
    'speed',
    'spooky',
    'sport',
    'sports',
    'square',
    'square',
    'sans',
    'stamp',
    'standard',
    'star',
    'stencil',
    'street',
    'summer',
    'surf',
    'sweet',
    'swirl',
    'swirls',
    'tattoo',
    'tech',
    'technical',
    'techno',
    'thin',
    'tiki',
    'triangle',
    'typewriter',
    'urban',
    'varsity',
    'vintage',
    'water',
    'wedding',
    'western',
    'wide',
    'wood',
    'zombie',
    ];*/

   
        function split( val ) {
            return val.split( /,\s*/ );
        }
        function extractLast( term ) {
            return split( term ).pop();
        }

        $( "#tags" )
            // don't navigate away from the field on tab when selecting an item
            .bind( "keydown", function( event ) {
                if ( event.keyCode === $.ui.keyCode.TAB &&
                        $( this ).data( "autocomplete" ).menu.active ) {
                    event.preventDefault();
                }
            })
            .autocomplete({
                minLength: 1,
                source: function( request, response ) {
                    var matches = $.map( availableTags, function(tag) {
                      if ( tag.toUpperCase().indexOf(request.term.toUpperCase()) === 0 ) {
                        return tag;
                      }
                    });
                    response(matches);
                 },

                focus: function() {
                    // prevent value inserted on focus
                    return false;
                },
                select: function( event, ui ) {
                    var terms = split( this.value );
                    // remove the current input
                    terms.pop();
                    // add the selected item
                    terms.push( ui.item.value );
                    // add placeholder to get the comma-and-space at the end
                    terms.push( "" );
                    //this.value = terms.join( ", " );
                    this.value = terms.join("");
                    return false;
                }
            });
    });
    