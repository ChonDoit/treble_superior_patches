#!/bin/bash

set -e

patches="$(readlink -f -- ./)"
phh="$patches/patches/phh"
phh_redo="$patches/patches/phh_redo"
personal="$patches/patches/personal"
ponces="$patches/patches/ponces"
peter="$patches/patches/peter"
andy="$patches/patches/andy"
iceows="$patches/patches/iceows"

printf "\n ##### APPLYING PHH PATCHES #####\n";
sleep 1.0;
for path in $(cd $phh; echo *); do
	tree="$(tr _ / <<<$path | sed -e 's;platform/;;g')"
	printf "\n| $path #####\n";
	[ "$tree" == build ] && tree=build/make
	pushd $tree
	
	for patch in $phh/$path/*.patch; do
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
			echo "##### FAILED APPLYING: $patch \n"
		fi
	done

	popd
done

printf "\n##### APPLYING PHH_RE-DO PATCHES #####\n";
sleep 1.0;
for path_redo in $(cd $phh_redo; echo *); do
	tree="$(tr _ / <<<$path_redo | sed -e 's;platform/;;g')"
	printf "\n| $path_redo #####\n";
	[ "$tree" == build ] && tree=build/make
	pushd $tree
	
	for patch in $phh_redo/$path_redo/*.patch; do
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
			echo "##### FAILED APPLYING: $patch \n"
		fi
	done

	popd
done

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
            printf "##### ALREDY APPLIED: $patch\n";
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
			echo "##### FAILED APPLYING: $patch \n"
		fi
	done

	popd
done

printf "\n##### APPLYING PONCES PATCHES #####\n";
sleep 1.0;
for path_ponces in $(cd $ponces; echo *); do
	tree="$(tr _ / <<<$path_ponces | sed -e 's;platform/;;g')"
	printf "\n| $path_ponces #####\n";
	pushd $tree
	
	for patch in $ponces/$path_ponces/*.patch; do
		# Check if patch is already applied
		if patch -f -p1 --dry-run -R < $patch > /dev/null; then
            printf "##### ALREDY APPLIED: $patch\n";
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
			echo "##### FAILED APPLYING: $patch \n"
		fi
	done

	popd
done

printf "\n##### APPLYING PETER PATCHES #####\n";
sleep 1.0;
for path_peter in $(cd $peter; echo *); do
	tree="$(tr _ / <<<$path_peter | sed -e 's;platform/;;g')"
	printf "\n| $path_peter #####\n";
    [ "$tree" == vendor/hardware/overlay ] && tree=vendor/hardware_overlay
	pushd $tree
	
	for patch in $peter/$path_peter/*.patch; do
		# Check if patch is already applied
		if patch -f -p1 --dry-run -R < $patch > /dev/null; then
            printf "##### ALREDY APPLIED: $patch\n";
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
			echo "##### FAILED APPLYING: $patch \n"
		fi
	done

	popd
done

printf "\n##### APPLYING ANDY PATCHES #####\n";
sleep 1.0;
for path_andy in $(cd $andy; echo *); do
	tree="$(tr _ / <<<$path_andy | sed -e 's;platform/;;g')"
	printf "\n| $path_andy #####\n";
	pushd $tree
	
	for patch in $andy/$path_andy/*.patch; do
		# Check if patch is already applied
		if patch -f -p1 --dry-run -R < $patch > /dev/null; then
            printf "##### ALREDY APPLIED: $patch\n";
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
			echo "##### FAILED APPLYING: $patch \n"
		fi
	done

	popd
done

printf "\n##### APPLYING ICEOWS PATCHES #####\n";
sleep 1.0;
for path_iceows in $(cd $iceows; echo *); do
	tree="$(tr _ / <<<$path_iceows | sed -e 's;platform/;;g')"
	printf "\n| $path_iceows #####\n";
	pushd $tree
	
	for patch in $iceows/$path_iceows/*.patch; do
		# Check if patch is already applied
		if patch -f -p1 --dry-run -R < $patch > /dev/null; then
            printf "##### ALREDY APPLIED: $patch\n";
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
			echo "##### FAILED APPLYING: $patch \n"
		fi
	done

	popd
done