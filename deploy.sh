# Set the correct permissions
umask 002

# Fetch the latest sources
git pull origin

# Use the right config file (/ubc_cvrg removed)
mv _config.yml _config_backup.yml
mv _config_deploy.yml _config.yml

# Build the site
## bundle install
## bundle exec jekyll serve
rm -rf /home/msimar/ubc_cvrg/_site
jekyll build

# Take backup and clean the folder
rm -rf ~/webpage_backup
mkdir ~/webpage_backup
cp -rf /var/www/html/vision ~/webpage_backup
rm -rf /var/www/html/vision/*

# change permissions
# chmod -R 664 /home/msimar/ubc_cvrg/_site/* THIS IS NOT CORRECT
# As directories need 775 so use the following if umask does not work
# find /var/www/html/vision -type d -exec chmod ugo+x {} \;
# find /var/www/html/vision -type f -exec chmod 664 {} \;

# copy all files
cp -r /home/msimar/ubc_cvrg/_site/* /var/www/html/vision/