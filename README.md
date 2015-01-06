DistroTest
==========

DistroTest is a Drupal 7 example installation profile that demonstrates a
makefile-based approach to site deployment.

The companion [DistroTestProject](https://github.com/BluesparkLabs/DistroTestProject)
is an example site installation that leverages the DistroTest.

Setup
=====

These instructions demonstrate how you can build your own custom site;
it follows the DistroTestProject codebase.

1. Create a new project folder where you will install your website.

        $ mkdir -p ~/Sites/myproject


2. Add a makefile using the project name, eg `myproject.make`. The makefile's
contents should include directives to install Drupal 7 and pull the contents of
the DistroTest repository into the /profiles folder.


        ; myproject.make
        core = 7.x
        api = 2
        
        ; Install Drupal.
        projects[drupal][version] = "7.x"
        
        ; Installation profile & platform modules.
        projects[distrotest][type] = "profile"
        projects[distrotest][download][type] = "git"
        projects[distrotest][download][url] = "https://github.com/BluesparkLabs/DistroTest.git"


3. Optionally add any additional modules, themes, and libraries required by
the specific project site to the end of the makefile.

        ; Site-specific contrib modules.
        projects[logintoboggan][version] = "1.1"
        projects[logintoboggan][subdir] = "contrib"
        ; Site-specific contrib themes.
        projects[zen][type] = "theme"
        projects[zen][version] = "5.x-dev"
        projects[zen][subdir] = "contrib"
        
        ; Site-specific libraries.
        libraries[somelibrary][directory_name] = "somelibrary"
        libraries[somelibrary][type] = "library"
        libraries[somelibrary][destination] = "libraries"
        libraries[somelibrary][download][type] = "get"
        libraries[somelibrary][download][url] = "https://example.com/path/to/somelibrary-1.2.3.zip"

4. Build the project

        $ drush make myproject.make


    Drush will download Drupal 7 and extract it to the current directory.
    It will download the profile to the `profiles` folder and, upon
    discovering the profiles's own make file, continue to download the
    modules and libraries in the distro. Finally it will download any 
    site-specific modules, themes, and libraries.
    
    If installing the site for the first time, you may specify the
    `--prepare-install` option which will prepare the built site for
    installation by generating a properly permissioned settings.php
    and files directory.
    
5.  Install the drupal site (assuming you've prepared a database and db username/pwd).

        $ drush si distrotest --db-url=mysql://dbuser:pass@localhost:port/dbname
