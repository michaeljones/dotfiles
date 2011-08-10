#!/bin/tcsh -f

set installdir = "/home/mike/local/git"
mkdir -p $installdir

cd $installdir

echo Getting latest information from git-scm.com
# Grab the latest git page
wget http://git-scm.com >& /dev/null

if ( ! -e index.html ) then
	echo Failed to retrieve index.html
	exit
endif

echo Looking for git version
# Find the link in it
grep "tar.bz2" index.html | grep "Source<" | sed 's/^.*http/http/g' | sed 's/">.*$//g' > url

set tarball = `cat url | sed 's/^.*\///g'` 
set gitversion = `cat url | sed 's/^.*\///g' | sed 's/.tar.bz2//g'`

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
cat url | xargs wget >& /dev/null

echo Extracting
# Extract it
tar jxf $tarball

# Change into the extracted directory
cd $gitversion

echo Making git in `pwd`
# Make and install it
make prefix=$installdir NO_DEFLATE_BOUND=1 | tee $installdir/install.log
make prefix=$installdir NO_DEFLATE_BOUND=1 doc | tee $installdir/install.log
make prefix=$installdir NO_DEFLATE_BOUND=1 install | tee $installdir/install.log
make prefix=$installdir NO_DEFLATE_BOUND=1 install-doc | tee $installdir/install.log

echo Updating installed version information
echo $gitversion > $installdir/latest

cd $installdir

echo Getting release notes
# Release notes
grep ">Release notes<" index.html | sed 's/^.*http/http/g' | sed 's/">.*$//g' > url
cat url | xargs wget >& /dev/null

set notes = `cat url | sed 's/^.*\///g'`

echo Mailing release notes to $EMAIL
cat $notes | mail -s "$gitversion has been installed" $EMAIL

echo Cleaning up
rm -f $installdir/index.html
rm -f $installdir/url

