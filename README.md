Docker file which installs oracle-xe
====================================

I wanted to have docker file (not image...) that would install oracle-xe. 
After some fighting I managed to set up configuration (at least I hope so...). To run it you have to get oracle-xe_11.2.0-2_amd64.deb file
- that is, download it from oracle site and run it through alien. Then you have to put in files directory and you're ready to run docker build.

Credits 
* https://forums.oracle.com/thread/2303639 
* https://index.docker.io/u/kimh/oracledb
