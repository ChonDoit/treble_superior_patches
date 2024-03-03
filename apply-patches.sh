#!/bin/bash

set -e

source="$(readlink -f -- $1)"
core="$source/patches/trebledroid"
personal="$source/patches/personal"
pre="$source/patches/pre"
fod="$source/patches/fod"
health="$source/patches/health"

if [ -e $pre ]; then
    printf "\n ##### APPLYING PRE-REQUISITE PATCHES #####\n";
    sleep 1.0;
    for path_pre in $(cd $pre; echo *); do
    	tree="$(tr _ / <<<$path_pre | sed -e 's;platform/;;g')"
    	printf "\n| $path_pre #####\n";
    	[ "$tree" == build ] && tree=build/make
        [ "$tree" == vendor/hardware/overlay ] && tree=vendor/hardware_overlay
        [ "$tree" == treble/app ] && tree=treble_app
    	pushd $tree
    	
    	for patch in $pre/$path_pre/*.patch; do
    		# Check if patch is already applied
    		if patch -f -p1 --dry-run -R < $patch > /dev/null; then
                printf "##### ALREDY APPLIED: $patch \n";
    			continue
    		fi
    
    		if git apply --check $patch; then
    			git am $patch
    		elif patch -f -p1 --dry-run < $patch > /dev/null; then
    			#This will fail
    			git am $patch || true
    			patch -f -p1 < $patch
    			git add -u
    			git am --continue
    		else
    			printf "##### FAILED APPLYING: $patch \n"
    		fi
    	done
    
    	popd
    done
fi

if [ -e $core ]; then
    printf "\n ##### APPLYING TREBLEDROID PATCHES #####\n";
    sleep 1.0;
    for path in $(cd $core; echo *); do
    	tree="$(tr _ / <<<$path | sed -e 's;platform/;;g')"
    	printf "\n| $path #####\n";
    	[ "$tree" == build ] && tree=build/make
        [ "$tree" == vendor/hardware/overlay ] && tree=vendor/hardware_overlay
        [ "$tree" == treble/app ] && tree=treble_app
    	pushd $tree
    	
    	for patch in $core/$path/*.patch; do
    		# Check if patch is already applied
    		if patch -f -p1 --dry-run -R < $patch > /dev/null; then
                printf "##### ALREDY APPLIED: $patch \n";
    			continue
    		fi
    
    		if git apply --check $patch; then
    			git am $patch
    		elif patch -f -p1 --dry-run < $patch > /dev/null; then
    			#This will fail
    			git am $patch || true
    			patch -f -p1 < $patch
    			git add -u
    			git am --continue
    		else
    			printf "##### FAILED APPLYING: $patch \n"
    		fi
    	done
    
    	popd
    done
fi

if [ -e $fod ]; then
    printf "\n##### APPLYING FOD PATCHES #####\n";
    sleep 1.0;
    for path_fod in $(cd $fod; echo *); do
    	tree="$(tr _ / <<<$path_fod | sed -e 's;platform/;;g')"
    	printf "\n| $path_fod #####\n";
    	[ "$tree" == build ] && tree=build/make
        [ "$tree" == vendor/hardware/overlay ] && tree=vendor/hardware_overlay
        [ "$tree" == treble/app ] && tree=treble_app
    	pushd $tree
    	
    	for patch in $fod/$path_fod/*.patch; do
    		# Check if patch is already applied
    		if patch -f -p1 --dry-run -R < $patch > /dev/null; then
                printf "##### ALREDY APPLIED: $patch \n";
    			continue
    		fi
    
    		if git apply --check $patch; then
    			git am $patch
    		elif patch -f -p1 --dry-run < $patch > /dev/null; then
    			#This will fail
    			git am $patch || true
    			patch -f -p1 < $patch
    			git add -u
    			git am --continue
    		else
    			printf "##### FAILED APPLYING: $patch \n"
    		fi
    	done
    
    	popd
    done
        else
    printf "\n##### THERE'S NO FOD PATCHES#####\n";
fi

if [ -e $health ]; then
    printf "\n##### APPLYING HEALTH PATCHES #####\n";
    sleep 1.0;
    for path_health in $(cd $health; echo *); do
    	tree="$(tr _ / <<<$path_health | sed -e 's;platform/;;g')"
    	printf "\n| $path_health #####\n";
    	[ "$tree" == build ] && tree=build/make
        [ "$tree" == vendor/hardware/overlay ] && tree=vendor/hardware_overlay
        [ "$tree" == treble/app ] && tree=treble_app
    	pushd $tree
    	
    	for patch in $health/$path_health/*.patch; do
    		# Check if patch is already applied
    		if patch -f -p1 --dry-run -R < $patch > /dev/null; then
                printf "##### ALREDY APPLIED: $patch \n";
    			continue
    		fi
    
    		if git apply --check $patch; then
    			git am $patch
    		elif patch -f -p1 --dry-run < $patch > /dev/null; then
    			#This will fail
    			git am $patch || true
    			patch -f -p1 < $patch
    			git add -u
    			git am --continue
    		else
    			printf "##### FAILED APPLYING: $patch \n"
    		fi
    	done
    
    	popd
    done
        else
    printf "\n##### THERE'S NO HEALTH PATCHES#####\n";
fi

if [ -e $personal ]; then
    printf "\n##### APPLYING PERSONAL PATCHES #####\n";
    sleep 1.0;
    for path_personal in $(cd $personal; echo *); do
    	tree="$(tr _ / <<<$path_personal | sed -e 's;platform/;;g')"
    	printf "\n| $path_personal #####\n";
    	[ "$tree" == build ] && tree=build/make
        [ "$tree" == vendor/hardware/overlay ] && tree=vendor/hardware_overlay
        [ "$tree" == treble/app ] && tree=treble_app
    	pushd $tree
    	
    	for patch in $personal/$path_personal/*.patch; do
    		# Check if patch is already applied
    		if patch -f -p1 --dry-run -R < $patch > /dev/null; then
                printf "##### ALREDY APPLIED: $patch \n";
    			continue
    		fi
    
    		if git apply --check $patch; then
    			git am $patch
    		elif patch -f -p1 --dry-run < $patch > /dev/null; then
    			#This will fail
    			git am $patch || true
    			patch -f -p1 < $patch
    			git add -u
    			git am --continue
    		else
    			printf "##### FAILED APPLYING: $patch \n"
    		fi
    	done
    
    	popd
    done
        else
    printf "\n##### THERE'S NO PERSONAL PATCHES#####\n";
fi
