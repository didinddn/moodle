Projek ini adalah untuk membuat image docker untuk kebutuhan LMS Moodle Server versi Production Support SSL pada lembaga SMK Negeri 2 jember.
Base on image ini adalah ubuntu versi terakhir dengan beberapa package tambahan antara lain:
- nginx
- php-fpm versi 8.3
- php extention untuk keperluan Moodle versi 5 stable

Beberapa konfigurasi service seperti nginx dan php-fpm sudah di tunning utk keperluan server Moodle. Adapun tunning dilakukan pada service :
- nginx
- php.ini
- www.conf
- vhost yang sudah support ssl

Cara Untuk menggunakan image ini:
1. pull terlebih dahulu image ini =  docker pull didinddn80/ubuntu-nginx-phpfpm
2. create container (jika yg di export port 80) = docker container create --name lms -p 80:80 -v /home/user/moodle/:/var/www/html -v /home/user/moodledata/:/var/www/moodledata ubuntu-nginx-phpfpm
3. create container (jika yg di export port 443) = docker container create --name lms -p 443:443 -v /home/user/moodle/:/var/www/html -v /home/user/moodledata/:/var/www/moodledata ubuntu-nginx-phpfpm
4. docker start lms
