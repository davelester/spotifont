Spotifont
=====================

A site for font discovery. "Spotify for fonts." 

## Project Team and Roles
* [Dave Lester](http://davelester.org) - Database and Python Nerd
* [Taeil Kwak](http://www.ischool.berkeley.edu/people/students/taeilkwak) - Front-end Design Champion. Brings team member Froyo because he's awesome.
* [Aijia Yan](http://aijiayan.com) - Front-end, Javascript, and Python Wiz.


## Project Description (what it does, how you went about it, etc.)

The idea behind Spotifont is that there are a lot of nuances in font that can only be expressed by particular words. This goes beyond the typical vocabulary, such as serif, sans-serif, etc. Fonts can be described as strong, childish, or elegant. But, it is really difficult to characterize these words, because they are so subjective and not concrete. Using the power of tags and the online community, we can begin to accurately apply these words to particular fonts, and then perform searches based on emotions and characteristics, not just the controlled vocabulary.

Using the Google Webfonts API, we are able to organize and display hundreds of fonts. These fonts are also free to use, lowering the barrier of entry to any user. Most well organized font sites charge for their fonts.

Features
Login with Facebook Connect
Search fonts by tags (user generated)
Filter fonts with a controlled vocabulary (eg. serif)
Displays fonts their tags
Font pages display their font in pangrams
Users can add their own tags

## What's Under the Hood
We manually imported about 600 types of fonts from Google Web Font in a database. That allowed us to relate the number of tags, the content of the tags to the fonts directly. Google Web Font does not provide us with a ready-to-easy API that provides users with a font name, the category (serif, sans-serif, display, and handwriting) the font is in. 

In terms of the database’s schema, we have five tables. One is “fonts,” which has three columns: id, font_name (unstructured), and font_display_name (structured). One is “controlled,” it also has three columns: id, font_id, and controlled_name (e.g., Sans Serif, Serif, etc.). One is tag_links, it has id, font_id, tag_id, user_id, and timestamp. Referring to this table, we can know who tagged for what font at what time. The next one is tags, and this table has two columns: id and tag_name. The id here is the same id within tag_links. Users is the last table, and it tracks the id, username, and password a specific user. 

## Which of Cory Doctorow’s strawmen did you try to address/disprove/tackle/etc.

1) People are lazy
All of our tag-fields (both search and tag a font) autocomplete to commonly used tags. By autocompleting, people are assured that their tagging is contributing to the characterization of the font, rather than getting lost as some obscure word.
In the font page, we display some of their most popular tags. This will help people get a feel for tags they could apply. This could be a good starting point, and also serve to work towards a more controlled vocabulary. For example, someone could think that a font is “fancy”, but notice that the word “elegant” is tagged often. They can then tag “elegant” since that feeling is the same as what they intended.
4) Our own project
Often people search for fonts with a certain intention in mind, that they can only put into words that are not normally used. Some examples of words might be “crazy”, “girly”, or “scary”. Since these are such subjective terms, we can only describe them using the power of the community.
It is important to note that there are words that are under a strictly controlled vocabulary. Some examples of these are “serif” and “sans-serif”. There is a very gray area between what should be controlled and what should be community driven. Some examples of the gray words might be “script” or “modern”. For now, we used the controlled vocabulary that the Google Webfonts API provides, which are “serif”, “sans-serif”, “display”, and “handwriting”. 
By displaying the fonts in their tags, people get to really feel the word as they read it. This is great for font exploration and inspiration.

### Technologies Used
Python (Flask, Tornado DB), HTML, CSS, Javascript

### URL of the repository on github
https://github.com/davelester/spotifont

### Live URL of where it’s hosted
http://spotifont.herokuapp.com/

### Browser Support
Chrome, Firefox 

### Bugs, Quirks, Easter Eggs
No significant bugs so far found. 

## Examples of Search API
The Search API is accessible by visiting ```localhost:5000/search/tagname```, where ```tagname``` is the uncontrolled term that's being searched for.

The response looks like this: ```[ {"fontname": "Arial", "controlled": "Sans-Serif" }, {"fontname": "Garamond", "controlled": "Serif" } ]```
