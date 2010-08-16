# LPKit-Examples

Example app showing off the current parts of [LPKit](http://github.com/luddep/LPKit).  Uses a Aristo-like theme for the custom controls, see cappuccino docs on how to compile & use themes.


## Building

First run

	$ git submodule init
	$ git submodule sync
	$ git submodule update
	
so `LPKit` is cloned as a submodule.  Then, go into its directory, and run

	$ jake symlink-narwhal

or run it where your copy of LPKit is.  The copy on which you run `jake symlink-narwhal` would be used as the implicit copy when you build `LPAristo`.

After having a copy of `LPKit` registered, go inside `LPAristo`, and run `jake` there.

Finally, go outside of the directory and run

	$ capp gen <LPKit Examples Directory Name> -f --force

so you incarnate Cappuccino into the app.  Now everything should run smoothly.


## License 

Everything, except the `LPAristo` theme, is released under the MIT license. For more information regarding the license, view the LICENSE file.

`LPAristo` uses parts of the [Aristo theme](http://github.com/280north/aristo) by [280 North](http://280north.com/) and [Sofa](http://madebysofa.com/).   

`LPAristo` is released under the [Creative Commons Attribution Share-Alike License](http://creativecommons.org/licenses/by-sa/3.0/us).




