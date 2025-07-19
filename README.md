Projek ini adalah untuk membuat image docker untuk kebutuhan LMS Moodle Server.
Base on image ini adalah ubuntu versi terakhir dengan beberapa package tambahan antara lain:
- nginx
- php-fpm versi 8.3
- php extention untuk keperluan Moodle versi 5 stable

Beberapa konfigurasi service seperti nginx dan php-fpm sudah di tunning utk keperluan server Moodle. Adapun tunning dilakukan pada service :
- nginx
- php.ini
- www.conf
- vhost yang sudah support ssl
