core = 7.x
api = 2

; +++++ Modules +++++

projects[bean][version] = "1.8"
projects[bean][subdir] = "contrib"

projects[ctools][version] = "1.4"
projects[ctools][subdir] = "contrib"
projects[ctools][patch][] = "https://www.drupal.org/files/issues/ctools-hide-empty-page-title-with-wrapper-tag-2265451-5.patch"

projects[date][version] = "2.8"
projects[date][subdir] = "contrib"

projects[devel][version] = "1.5"
projects[devel][subdir] = "contrib"

projects[profiler_builder][version] = "1.2"
projects[profiler_builder][subdir] = "contrib"

projects[features][version] = "2.2"
projects[features][subdir] = "contrib"

projects[conditional_fields][version] = "3.0-alpha1"
projects[conditional_fields][subdir] = "contrib"

projects[entityreference][version] = "1.1"
projects[entityreference][subdir] = "contrib"

projects[field_collection][version] = "1.x-dev"
projects[field_collection][subdir] = "contrib"
projects[field_collection][patch][] = "https://www.drupal.org/files/issues/field_collection-entity-translation-support-1344672-308.patch"

projects[field_group][version] = "1.4"
projects[field_group][subdir] = "contrib"

projects[link][version] = "1.2"
projects[link][subdir] = "contrib"

projects[title][version] = "1.0-alpha7"
projects[title][subdir] = "contrib"

projects[l10n_update][version] = "2.0-rc2"
projects[l10n_update][subdir] = "contrib"

projects[lang_dropdown][version] = "2.5"
projects[lang_dropdown][subdir] = "contrib"

projects[entity_translation][version] = "1.x-dev"
projects[entity_translation][subdir] = "contrib"

projects[i18n][version] = "1.11"
projects[i18n][subdir] = "contrib"

projects[language_cookie][version] = "1.8"
projects[language_cookie][subdir] = "contrib"

projects[diff][version] = "3.2"
projects[diff][subdir] = "contrib"

projects[entity][version] = "1.5"
projects[entity][subdir] = "contrib"

projects[galleria][version] = "1.x-dev"
projects[galleria][subdir] = "contrib"

projects[insert][version] = "1.3"
projects[insert][subdir] = "contrib"

projects[libraries][version] = "2.2"
projects[libraries][subdir] = "contrib"

projects[menu_block][version] = "2.4"
projects[menu_block][subdir] = "contrib"

projects[navbar][version] = "1.4"
projects[navbar][subdir] = "contrib"

projects[pathauto][version] = "1.2"
projects[pathauto][subdir] = "contrib"

projects[proxy][version] = "1.0-beta3"
projects[proxy][subdir] = "contrib"

projects[strongarm][version] = "2.0"
projects[strongarm][subdir] = "contrib"

projects[token][version] = "1.5"
projects[token][subdir] = "contrib"

projects[panels][version] = "3.4"
projects[panels][subdir] = "contrib"

projects[panels_everywhere][version] = "1.0-rc1"
projects[panels_everywhere][subdir] = "contrib"

projects[google_analytics][version] = "1.4"
projects[google_analytics][subdir] = "contrib"

projects[ckeditor][version] = "1.16"
projects[ckeditor][subdir] = "contrib"

projects[jquery_update][version] = "2.4"
projects[jquery_update][subdir] = "contrib"

projects[variable][version] = "2.5"
projects[variable][subdir] = "contrib"

projects[views][version] = "3.8"
projects[views][subdir] = "contrib"

; +++++ Themes +++++

; omega
projects[omega][type] = "theme"
projects[omega][version] = "4.x-dev"
projects[omega][subdir] = "contrib"

; +++++ Libraries +++++

; Backbone
libraries[backbone][directory_name] = "backbone"
libraries[backbone][type] = "library"
libraries[backbone][destination] = "libraries"
libraries[backbone][download][type] = "get"
libraries[backbone][download][url] = "https://codeload.github.com/jashkenas/backbone/zip/1.0.0"

; CKEditor
libraries[ckeditor][directory_name] = "ckeditor"
libraries[ckeditor][type] = "library"
libraries[ckeditor][destination] = "libraries"
libraries[ckeditor][download][type] = "get"
libraries[ckeditor][download][url] = "http://download.cksource.com/CKEditor/CKEditor/CKEditor%204.0.1/ckeditor_4.0.1_standard.zip"

; Galleria
libraries[galleria][directory_name] = "galleria"
libraries[galleria][type] = "library"
libraries[galleria][destination] = "libraries"
libraries[galleria][download][type] = "get"
libraries[galleria][download][url] = "http://galleria.io/static/galleria-1.4.2.zip"

; Modernizr
libraries[modernizr][directory_name] = "modernizr"
libraries[modernizr][type] = "library"
libraries[modernizr][destination] = "libraries"
libraries[modernizr][download][type] = "get"
libraries[modernizr][download][url] = "https://codeload.github.com/Modernizr/Modernizr/zip/v2.7.1"

; Underscore
libraries[underscore][directory_name] = "underscore"
libraries[underscore][type] = "library"
libraries[underscore][destination] = "libraries"
libraries[underscore][download][type] = "get"
libraries[underscore][download][url] = "https://codeload.github.com/jashkenas/underscore/zip/1.6.0"
