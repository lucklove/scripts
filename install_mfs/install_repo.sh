for i in `cat all_list`; do ssh $i 'curl "http://ppa.moosefs.com/RPM-GPG-KEY-MooseFS" > /etc/pki/rpm-gpg/RPM-GPG-KEY-MooseFS;curl "http://ppa.moosefs.com/MooseFS-3-el7.repo" > /etc/yum.repos.d/MooseFS.repo;echo "10.0.1.10 mfsmaster" >> /etc/hosts';done