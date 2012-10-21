Spotifont
=====================

A site for font discovery. "Spotify for fonts." 

## Project Team and Roles
* [Dave Lester](http://davelester.org) - Database and Python Nerd
* [Taeil Kwak](http://www.ischool.berkeley.edu/people/students/taeilkwak) - Front-end Design Champion. Brings team member Froyo because he's awesome.
* [Aijia Yan](http://aijiayan.com) - Front-end, Javascript, and Python Wiz.

## What's Under the Hood

### Technologies Used
Python (Flask, Tornado DB), HTML, CSS, Javascript

### Browser Support

### Bugs, Quirks, Easter Eggs

## Examples of Search API
The Search API is accessible by visiting ```localhost:5000/search/tagname```, where ```tagname``` is the uncontrolled term that's being searched for.

The response looks like this: ```[ {"fontname": "Arial", "controlled": "Sans-Serif" }, {"fontname": "Garamond", "controlled": "Serif" } ]```