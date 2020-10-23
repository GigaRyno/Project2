## Notes As I Make Project 2

* Added Must run as root (used from my old scripting 1 code)
* Added check to see if file exist or not* created for loop each one of the emails in the file
* Added **users** which is used to get the usernames and used cut to get usernames to the left of the @ symbol
* Added **pass** which uses openssl to create a random password. [Link to the snip of code I used](https://www.howtogeek.com/howto/30184/10-ways-to-generate-a-random-password-from-the-command-line/)
* VM seems to be having issues with installing anytype of mail server.
  * I have tried installing sendmail that didn't work so I uninstalled it and then installed postfix and now I cant do anything because it will not let me due to 'smmsp' and 'smmta' not being a user in the root of my vm
  * I think im going to back up my VM and create a new one seems to be the only way people on the internet have fixed it. Sense I am running out of time I am just going to hand in what I have and I will hopefully make up for it on the next thing
