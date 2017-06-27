
source ./chefVersionConfig.conf

# if ! yum -q list installed chef; 
# 	then				
#    		curl -LO https://omnitruck.chef.io/install.sh && sudo bash ./install.instash -v $chefVersion && rm install.sh
# else
# 	echo "Chef already installed"
# fi


if ! yum -q list installed chefdk; 
	then
		curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -P chefdk -c stable -v $chefdkVersion
else
	echo "Chef development kit already installed"
fi
	
	cd $CookBookName

#	berks install

#	berks vendor cookbooks

	# sudo ruby -c $CookBookName.rb && sudo foodcritic $CookBookName.rb

	sudo chef-client -z -j web.json
