#!/bin/bash

get_tripleo_repo(){
      # Cameron.C: Download python2-tripleo-repos-<version>.el7.centos.noarch.rpm
        echo "Get tripleO repo\n"
          TRIPLEO_REPOS=$(curl $BASE | sed -n 's/.*href="\([^"]*\).*/\1/p' | grep python2-tripleo-repos- | grep el7.centos.noarch.rpm)
            echo "\nTripleO repo is $TRIPLEO_REPOS\n"
}

download_repo(){
      echo "Start Download repo\n"
        curl $BASE$TRIPLEO_REPOS -o /tmp/tripleo-repo.rpm
          echo "Download complete\n"
}

BASE=https://trunk.rdoproject.org/centos7/current/

get_tripleo_repo
download_repo
