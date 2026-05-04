<?php

// Specify data folders, as default paths, which are under /usr, are generally non-writable
// Specify them before including user config, so that they can be overridden
putenv('TTRSS_LOCK_DIRECTORY=/var/lib/tt-rss/lock');
putenv('TTRSS_CACHE_DIR=/var/lib/tt-rss/cache');
putenv('TTRSS_LOCAL_PLUGINS_DIR=/var/lib/tt-rss/plugins.local');
putenv('TTRSS_LOCAL_TEMPLATES_DIR=/var/lib/tt-rss/templates.local');
putenv('TTRSS_LOCAL_THEMES_DIR=/var/lib/tt-rss/themes.local');

require_once '/etc/webapps/tt-rss/config.php';
