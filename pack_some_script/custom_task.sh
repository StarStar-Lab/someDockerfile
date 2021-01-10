mkdir custom
cd /custom
git init
git remote add -f origin https://github.com/Sunert/Scripts.git
git config core.sparsecheckout true
echo Task/txnews.js >>/custom/.git/info/sparse-checkout
echo Task/youth.js >>/custom/.git/info/sparse-checkout
echo Task/dianshijia.js >>/custom/.git/info/sparse-checkout
echo Task/Youth_Read.js >>/custom/.git/info/sparse-checkout
git pull origin master
cd Task
cp Youth_Read.js Youth_Read2.js
cp Youth_Read.js Youth_Read3.js
cp Youth_Read.js Youth_Read4.js
sed -i 's/YOUTH_READ/YOUTH_READ2/g' Youth_Read2.js
sed -i 's/YOUTH_READ/YOUTH_READ3/g' Youth_Read3.js
sed -i 's/YOUTH_READ/YOUTH_READ4/g' Youth_Read4.js
mv /custom/Task/* /baidu_speed/Task
cd / && rm -rf custom
echo -e >> /pss/merged_list_file.sh
echo "*/12 * * * * sleep \$((RANDOM % 120)); node /baidu_speed/Task/youth.js |ts >> /logs/youth.log 2>&1" >> /pss/merged_list_file.sh
echo "*/7 * * * * sleep \$((RANDOM % 120)); node /baidu_speed/Task/txnews.js |ts >> /logs/txnews.log 2>&1" >> /pss/merged_list_file.sh
echo "*/15 4,12,19,23 * * * sleep \$((RANDOM % 120)); node /baidu_speed/Task/dianshijia.js |ts >> /logs/dianshijia.log 2>&1" >> /pss/merged_list_file.sh
echo "6 7,10,13 * * * sleep node /baidu_speed/Task/Youth_Read.js |ts >> /logs/Youth_Read.log 2>&1" >> /pss/merged_list_file.sh
echo "6 8,11,14 * * * sleep node /baidu_speed/Task/Youth_Read2.js |ts >> /logs/Youth_Read2.log 2>&1" >> /pss/merged_list_file.sh
echo "6 9,12,15 * * * sleep node /baidu_speed/Task/Youth_Read3.js |ts >> /logs/Youth_Read3.log 2>&1" >> /pss/merged_list_file.sh
echo "6 16,17,18 * * * sleep node /baidu_speed/Task/Youth_Read4.js |ts >> /logs/Youth_Read4.log 2>&1" >> /pss/merged_list_file.sh
