# youtube-dl-digest
Channel Archiver and Automaton crammed into a Docker container and controlled by CSV.

Dependencies/expectations
	- a media user <media> within your ecosystem with user/group as 1050:1050
		- review the files if you want to change this. 
	- this service creates files for consumption, therefore a volume directory is needed.
		- example: /storage/docker_data/
		- directory must be writable by <media> user.


You will need to edit files/conf/dl_sources.csv for the youtube channels/users you want to archive.

Examples:
	youtube,https://www.youtube.com/channel/EXAMPLE_EXAMPLE-1234/videos
	youtube,https://www.youtube.com/user/EXAMPLE_EXAMPLE-1234/videos

You can build this local by running the build.sh command. 
Once you have built or pulled the image from docker hub you can setup your system with the
youtube-dl_digest-setup.sh script that will move everything into place. 


