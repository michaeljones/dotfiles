#!/bin/tcsh -f

set installdir = "/home/mike/local/git"
mkdir -p $installdir

cd $installdir

set gitversion = 1.9.2
set tarball = git-$gitversion.tar.gz

echo Found $gitversion

if ( -e $installdir/latest ) then
	set lastversion = `cat $installdir/latest`
	if ( $lastversion == $gitversion ) then
		echo Matches latest installed version. Exiting.
		rm -f $installdir/index.html $installdir/url
		exit
	endif
endif

echo Downloading tar ball
# Download it
wget https://www.kernel.org/pub/software/scm/git/git-$gitversion.tar.gz >& /dev/null

echo Extracting
# Extract it
tar xf $tarball

# Change into the extracted directory
cd git-$gitversion

echo Making git in `pwd`
# Make and install it
make prefix=$installdir NO_DEFLATE_BOUND=1 | tee $installdir/install.log
make prefix=$installdir NO_DEFLATE_BOUND=1 doc | tee $installdir/install.log
make prefix=$installdir NO_DEFLATE_BOUND=1 install | tee $installdir/install.log
make prefix=$installdir NO_DEFLATE_BOUND=1 install-doc | tee $installdir/install.log

echo Updating installed version information
echo $gitversion > $installdir/latest

cd $installdir

echo Cleaning up
rm -f $installdir/index.html
rm -f $installdir/url

