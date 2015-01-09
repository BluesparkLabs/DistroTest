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

1.  Create a new project folder where you will install your website.

        $ mkdir -p ~/Sites/myproject


2.  Add a makefile called `project.make`. The makefile's contents should include
    directives to install Drupal 7 and pull the contents of the DistroTest
    repository into the `/profiles` folder.


        ; project.make
        core = 7.x
        api = 2
        
        ; Install Drupal.
        projects[drupal][version] = "7.x"
        
        ; Installation profile & platform modules.
        projects[distrotest][type] = "profile"
        projects[distrotest][download][type] = "git"
        projects[distrotest][download][url] = "https://github.com/BluesparkLabs/DistroTest.git"


3.  Optionally add any additional modules, themes, and libraries required by
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

4.  To have the distro enable custom modules and/or features during site
    installation, add the following line to the module's `.info` file so they
    may be detected by the distro and automatically enabled:

        distrotest_enable_on_install = yes

    Since you cannot modify contrib modules info files, you should at the very
    least have one custom module or feature that lists all of the new contrib
    modules listed as dependencies.

    E.g.

        //myproject_system.info
        name = My Project System
        description = System-wide configurations and settings for My Project.
        core = 7.x
        package = My Project
        distrotest_enable_on_install = yes
        dependencies[] = logintoboggan
        dependencies[] = contrib_module_name
        dependencies[] = another_contrib_module_name

    The distro will enable this system module along with all of its dependencies.

5. Build the project.

        $ drush make project.make --working-copy

    Drush will download Drupal 7 and extract it to the current directory.
    It will download the profile to the `profiles` folder and, upon
    discovering the profiles's own make file, continue to download the
    modules and libraries in the distro. Finally it will download any
    site-specific modules, themes, and libraries.

    The `--working-copy` option preserves the .git folders for any modules
    or libraries downloaded using the "git" method.

    If installing the site for the first time, you may specify the
    `--prepare-install` option which will prepare the built site for
    installation by generating a properly permissioned settings.php
    and files directory. Strictly speaking, this option is only useful
    when installing the site via the Web UI, and is not necessary when
    using drush to install the site.

6.  Install the drupal site (assuming you've prepared a database and
    db username/pwd).

        $ drush si distrotest --db-url=mysql://dbuser:pass@localhost:port/dbname

7.  Revert all enabled features.

        $ drush features-revert-all -y

8.  As you develop your site, site-specific contrib modules should be added to
    the project-specific make file, and the modules themselves placed in
    `sites/all/modules/contrib` but should be ignored by the repository.

    Custom modules should be placed in `sites/all/modules/custom` and should be
    committed to the repository.

Distro Development
------------------
Developing the distro is distinct from developing a specific site installation.
The basic difference is that all custom modules and features need to go into
the installation profile's repository, instead of the site-specific repository.

1.  Follow installation instructions above to build a test site for the distro
    and execute the drush make command with the `--working-copy` option to
    preserve the .git directories for projects downloaded using such methods.


2.  As you add new features, modules, and configurations, update the distro
    with the commands below. Ensure that all custom modules and features for
    the distro get added inside the `/profiles/distroname/modules` folder and not
    in `sites/all/modules`.

    *   From the Drupal root folder, recreate the distro:

            $ drush generate-distro distrotest --untar

        Note: Profiler Builder currently replaces the `.install` and `.profile`
        files with the defaults provided by the module so any custom changes
        will be lost unless you revert these files. Meticulously review and
        discard hunks before committing the update.

    *   Discard ALL changes in the distrotest.profile file:

            $ cd profiles/distrotest
            $ git checkout distrotest.profile

    *   Discard unwanted changes in the distrotest.info file by reverting hunks,
        such as the modified description text using interactive checkout:

            $ git checkout -p distrotest.info

        Select the hunks you want to discard by typing `y` at the prompt, or
        `n` to  skip a hunk, leaving it in place.


3.  Review the `local.make.example` file for TODOs and any new modules, features,
    themes, or libraries.  Profiler Builder puts projects in `local.make.example`
    when they either don't have a version number or have not been uploaded
    to drupal.org. The goal is to keep this file as clean as possible.

    In the case of new *features* ensure that `package = distrotest` is
    specified in the module's info file and move the feature
    into the `profiles/distrotest/modules/features/` folder.

    In the case of new *custom modules*, add `package = distrotest` to
    the module's info file and consider moving the custom module into the
    `profiles/distrotest/modules/custom/` folder.  If the module is public, but just
    not on drupal.org, add the necessary download info into distrotest.make.

    In the case of new *custom themes*, ensure the theme is placed inside the
    `profiles/distrotest/themes/` folder.

    In the case of new *libraries*, determine the URL of the library where
    the zipfile or tarball was downloaded and hook the library in using
    `hook_profiler_builder_defined_libraries` in the `distrotest.profile` file.
    (Note this only works when the profile is already enabled and in use).


4.  If you had to make any adjustments in step 3, start again from step 2
    to regenerate the distro files.


5.  Copy local.make.example to distrotest.make.

        $ cd profiles/distrotest
        $ mv local.make.example distrotest.make

6.  Review the diff meticulously one last time before commiting everything.

        $ cd profiles/distrotest
        $ git diff .
        $ git commit .
