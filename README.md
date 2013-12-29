sasstojs
--------

This is a SASS/Compass extension that will give you some functions to be able to output settings from SASS to a javascript file. This file will be placed in your configured javascripts directory.

### Installation

    gem build sasstojs.gemspec
    gem install sasstojs-1.0.gem

### Usage

In your config.rb, put:

    require "sasstojs"

You will now have few functions available to you:

##### js_config(filename, varname)

Configures the extension to output the JSON to `filename` and use `varname` as the javascript variable name.

`filename` defaults to "css.settings.js" and `varname` defaults to "cssSettings".

##### js_add(name, value)

Adds a name,value pair to the output. E.g. `js_add("radius", 1.6);`

##### js_write()

A function that must be called at the end to write out the JS.

### Example

_settings.scss

    $squarerank_settings: (
      colors: white #f6f354 #f5ce55 #f5a456 #f36f57 #f35358,
      strokeWidth: 2,
      stroke: #444,
      strokeOpacity: 0.2
    );

    $barplot_settings: (
      colormap: (
        very low: #6C9EDC,
        low: #96BAE6,
        best: #6dc069,
        good: #9ecf83,
        normal: #9ecf83,
        borderline: #fed6a2,
        high: #f3777b,
        very high: #ef404a
      )
    );

    /* Output javascript */
    %settings {
      $_: js_config("css.settings.js", "cssSettings");
      $_: js_add("squarerank", $squarerank_settings);
      $_: js_add("barplot", $barplot_settings);
      $_: js_write();
    }

output (css.settings.js):

    var cssSettings = {
      "squarerank": {
        "colors": [
          "white",
          "#f6f354",
          "#f5ce55",
          "#f5a456",
          "#f36f57",
          "#f35358"
        ],
        "strokeWidth": 2,
        "stroke": "#444444",
        "strokeOpacity": 0.2
      },
      "barplot": {
        "colormap": {
          "very low": "#6c9edc",
          "low": "#96bae6",
          "best": "#6dc069",
          "good": "#9ecf83",
          "normal": "#9ecf83",
          "borderline": "#fed6a2",
          "high": "#f3777b",
          "very high": "#ef404a"
        }
      }
    };

### Notes

Pull requests welcome. 
