## This file was auto-generated by CloudCoreo CLI
## This file was automatically generated using the CloudCoreo CLI
##
## This config.rb file exists to create and maintain services not related to compute.
## for example, a VPC might be maintained using:
##
## coreo_aws_vpc_vpc "my-vpc" do
##   action :sustain
##   cidr "12.0.0.0/16"
##   internet_gateway true
## end
##

coreo_aws_vpc_routetable "${PUBLICSUBNET_RTNAME}" do
   action :sustain
   vpc "${VPC_NAME}"
   routes [ 
               { :from => "0.0.0.0/0", :to => "${VPC_NAME}", :type => :igw }
         ]
   number_of_tables 1
end

coreo_aws_vpc_subnet "${PUBLICSUBNET_NAME}" do
   action :sustain
   number_of_zones 3
   percent_of_vpc_allocated 25
   route_table "${PUBLICSUBNET_RTNAME}" 
   vpc "${VPC_NAME}"
   map_public_ip_on_launch true
end


