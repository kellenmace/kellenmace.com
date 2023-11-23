---
title: Set up PHP CodeSniffer in PhpStorm with WordPress Coding Standards
date: '2015-08-11T12:13:17.121Z'
---

<script>
  import interpreter from './interpreter.png';
  import interpreter2 from './interpreter-2.png';
  import phpcs from './phpcs.jpg';
  import phpstormCodeSnifferInspection from './phpstorm-code-sniffer-inspection.png';
</script>

The steps below cover how to set up PHP CodeSniffer in PhpStorm with WordPress Coding Standards rulesets. This can be very helpful for identifying violations of the [WP coding standards](https://make.wordpress.org/core/handbook/best-practices/coding-standards/php/) as you write code, so you can fix them on-the-spot. This guide assumes you’re on Mac OS X or Linux, are using Vagrant for local development, have [Composer](https://getcomposer.org/) installed and are comfortable using the command line. A video walkthrough of these steps is also available [here](https://www.youtube.com/watch?v=40RIFFF_K7k).

## 1. Set up PHP Remote Interpreter

Go to PhpStorm Preferences > Languages & Frameworks > PHP, then click on the `[…]` button. Input these settings:

<img src={interpreter} alt="remote interpreter settings" />

- SSH Credentials radio button
- Your host IP address instead of the one shown (you can get this by running `ping example.dev` for one of your dev sites on the command line)
- `vagrant` for both the User name and Password
- `/usr/bin/php` for the PHP interpreter path

Then select the interpreter you just created:

<img src={interpreter2} alt="remote interpreter settings 2" />

## 2. Install PHP CodeSniffer

`composer global require "squizlabs/php_codesniffer=*"`

Then make sure a `phpcs` alias is accessible in the `~/.composer/vendor/bin/` directory.

## 3. Install WordPress standards rulesets

`composer create-project wp-coding-standards/wpcs:dev-master --no-dev`

Then make sure the WP standards are accessible in the `~/.composer/wpcs/` directory.

## 4. Add WordPress ruleset path to PHP_CodeSniffer configuration

`cd ~/.composer/vendor/bin`
`phpcs --config-set installed_paths ~/.composer/wpcs`

## 5. Add phpcs to your PATH

Open `~/.bash_profile` (or `~/.zshrc` if you use ZSH).
Paste in: `PATH=$PATH:~/.composer/vendor/bin`.
Now you should be able to `cd` into any WP root directory and run `phpcs --standard=WordPress wp-load.php`. If you see output like this, you’ll know phpcs is working properly:

<img src={phpcs} alt="PHP codesniffer on command line" />

## 6. Configure PHP CodeSniffer

In PhpStorm, go to `Preferences` > `Languages & Frameworks` > `PHP` > `Code Sniffer`.

Select this file: `~/.composer/vendor/bin/phpcs`.

## 7. Configure PHP CodeSniffer as a PhpStorm Inspection

In PhpStorm, go to `Preferences` > `Editor` > `Inspections`.
Go to `PHP` > `PHP Code Sniffer Validation` and check the checkbox.
Select a WordPress coding standard from the dropdown menu and save it.

<img src={phpstormCodeSnifferInspection} alt="PHP codesniffer inspection" />

## Try it Out

Now try typing something that is valid PHP, but is a violation of the WordPress Coding Standards, such as:

`if(true){echo 'I must have forgotten a few spaces';}`

PhpStorm should let you know that it’s a violation by giving it a squiggly underline. You can hover over it and get a popup with more info indicating what’s wrong with it. Then you can fix it manually, or use `Code` > `Reformat Code` (cmd+option+L on Mac) to automatically reformat the code – just make sure you’ve set the predefined style to WordPress in PhpStorm's `Preferences` > `Editor` > `Code Style` > `PHP` > `Set From` > `Predefined Style` > `WordPress`.

## Going Forward

To enable PHP CodeSniffer with the WP Coding Standards for any future projects, you just need to follow steps #1 and #7 above.

## Resources

JetBrains PHP CodeSniffer Guide:  
[https://www.jetbrains.com/help/phpstorm/using-php-code-sniffer.html](https://www.jetbrains.com/help/phpstorm/using-php-code-sniffer.html)

PHP CodeSniffer:  
[https://github.com/squizlabs/PHP_CodeSniffer](https://github.com/squizlabs/PHP_CodeSniffer)

WordPress Coding Standards rulesets:  
[https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards](https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards)

Jason Boyle’s guide – provides additional details on several of the steps in this post:  
[http://jason-boyle.com/phpstorm-php-codesniffer-wordpress-coding-standards/](http://jason-boyle.com/phpstorm-php-codesniffer-wordpress-coding-standards/)
