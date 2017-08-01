phpize --clean;
phpize;
./configure --with-php-config=/usr/local/php/bin/php-config;
make;
make install;
service php-fpm reload;
