Spotifont
=====================

A site for font discovery. "Spotify for fonts." 

## Project Team and Roles
* [Dave Lester](http://davelester.org) - Database and Python Nerd. Bends Flask to his will.
* [Taeil Kwak](http://www.ischool.berkeley.edu/people/students/taeilkwak) - Front-end Design Champion. CSS and all the like. Brings team member Froyo because he's awesome.
* [Aijia Yan](http://aijiayan.com) - Front-end, Javascript, and Python Wiz. Connected the search API with the front-end like a pro.

## Project Description
There are nuances in font description and discovery that can only be expressed by particular words. Serif and Sans-Serif capture style, not the use, meaning, or associations of a font. Fonts can be strong, childish, or elegant; because of this we've sought to make it easier to discover fonts around these terms: we call it Spotifont.

Powered by tags that the online community has added to describe fonts in our database, Spotifont allows users to the site to perform searches based on emotions and characteristics, not just the controlled vocabulary.

Using the Google Webfonts API, we are able to organize and display hundreds of fonts. These fonts are also free to use, lowering the barrier of entry to any user. Most well-organized font sites charge for their fonts, and we want this to be as open as possible. Fork our code, or drop us a line!

__Features / What it Does__
* Login with Facebook Connect
* Search fonts by tags (user generated)
* Filter fonts with a controlled vocabulary (eg. serif)
* Displays fonts their tags
* Fonts displayed in randomly displayed pangrams ([thnx Wikipedia!](http://en.wikipedia.org/wiki/List_of_pangrams))
* Users can add their own tags

## What's Under the Hood
We wrote a script to batch-import about 600 open licenced fonts from the Google Web Font site, and carefully make hand-changes to malformed entries in our database. Since the Google Web Font site does not provide an API for us to directly query their database of fonts, we created our own.

Our database includes four tables with the following fields:

* __Fonts__:  id, font_name (unstructured), and font_display_name (structured)
* __Controlled__: id, font_id, controlled_name (e.g., Sans Serif, Serif, etc.)
* __Tag_Links__: id, font_id, tag_id, user_id, and timestamp. Referring to this table, we can know who tagged for what font at what time.
* __Tags__: id and tag_name. The id here is the same id within tag_links.

## Connection to Cory Doctorow’s straw man

__People are lazy__

All of our tag-fields (both search and tag a font) autocomplete to commonly used tags. By autocompleting, people are assured that their tagging is contributing to the characterization of the font, rather than getting lost as some obscure word.

In the font page, we display some of their most popular tags. This will help people get a feel for tags they could apply. This could be a good starting point, and also serve to work towards a more controlled vocabulary. For example, someone could think that a font is “fancy”, but notice that the word “elegant” is tagged often. They can then tag “elegant” since that feeling is the same as what they intended.

__Our own project__

Often people search for fonts with a certain intention in mind, that they can only put into words that are not normally used. Some examples of words might be “crazy”, “girly”, or “scary”. Since these are such subjective terms, we can only describe them using the power of the community.
It is important to note that there are words that are under a strictly controlled vocabulary. Some examples of these are “serif” and “sans-serif”. There is a very gray area between what should be controlled and what should be community driven. Some examples of the gray words might be “script” or “modern”. For now, we used the controlled vocabulary that the Google Webfonts API provides, which are “serif”, “sans-serif”, “display”, and “handwriting”. 

By displaying the fonts in their tags, people get to really feel the word as they read it. This is great for font exploration and inspiration.

### Technologies Used
Python (Flask, Tornado DB), HTML, CSS, Javascript, Oauth and a snazzy library to connect Flask to Facebook

### URL of the repository on github
https://github.com/davelester/spotifont

### Live URL of where it’s hosted
http://spotifont.herokuapp.com/

### Browser Support
Chrome, Firefox 

### Bugs, Quirks, Easter Eggs
No significant bugs so far found. 

## Examples of Search API
We needed a structured way to query and parse font data, so we created the Spotifont search API. The API is accessible by visiting ```http://spotifont.herokuapp.com/search/tagname```, where ```tagname``` is the uncontrolled term that's being searched for.

The response looks like this: ```[ {"fontname": "arial", "fontdisplayname": "Arial", "controlled": "Sans-Serif" }, {"fontname": "partytime", "fontdisplayname": "Party Time", "controlled": "Serif" } ]```
