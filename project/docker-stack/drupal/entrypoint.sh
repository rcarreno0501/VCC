#!/bin/bash

if [ ! -e "/var/www/html/web/sites/default/settings.php" ]; then
        #installing drupal
        cd /var/www/html
        php vendor/bin/drush si -y --site-name="Drupal Project" --account-name="admin" --account-pass="$DRUPAL_ADMIN_PASS" --site-mail="admin@localdomain.local" --db-url="mysql://$DB_USER:$DB_PASSWORD@$DB_HOST/$DB_NAME"
        drush -y config-set system.performance css.preprocess 0
        chmod 755 web/sites/default
        chmod 755 web/sites/default/settings.php
        chmod 777 web/sites/default/files

fi 

#rm drupal-8.9.13.tar.gz
#execute default entrypoint
/usr/local/bin/docker-php-entrypoint -D FOREGROUND
