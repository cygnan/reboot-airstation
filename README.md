# reboot-airstation

[![MIT License](http://img.shields.io/badge/license-MIT-cccc00.svg?style=flat)](LICENSE.md)
[![GitHub pull requests](https://img.shields.io/github/issues-pr/cygnan/reboot-airstation.svg?style=flat)](https://github.com/cygnan/reboot-airstation/pulls)
[![GitHub issues](https://img.shields.io/github/issues/cygnan/reboot-airstation.svg?style=flat)](https://github.com/cygnan/reboot-airstation/issues)

An ash script to reboot a Buffalo AirStation router.

## Features

- #### Implementation of reboot functionality of an AirStation router's web client

  As an AirStation router doesn't provide any standard API for communicating, this script is just a shortcut to reboot functionality of the router's web client.

- #### Optimized for embedded Linux environment

  This script uses neither Wget nor cURL command. It's useful for embedded Linux environment. Some busybox binaries are very limited, so cURL command is not there and Wget command can't send POST requests. This script uses netcat command instead, so runs successfully in that kind of environment.

## A supported model

- WZR-HP-G301NH

  **Note:** Only Japanese firmware supported.

Even if your router isn't listed above, this script should probably work if it has the UI like below.

![UI](https://user-images.githubusercontent.com/25865313/27252525-91070486-539b-11e7-8f55-0fca3da6d5d2.jpg)

## Usage

1. Download [reboot.sh](https://raw.githubusercontent.com/cygnan/reboot-airstation/master/reboot.sh).

1. Open reboot.sh with a text editor, replace `192.168.11.1` with your router's IP address, and insert its password like below if changed.

   ![GIF](https://user-images.githubusercontent.com/25865313/27253001-eeca661c-53a5-11e7-82ac-93fc29d49ae2.gif)

3. After saving it, type `sh ./reboot.sh` with Bash or a terminal emulator in the directory the script exists.

   **Note:** If you use a Debian-based Linux OS (_e.g._, Debian, Ubuntu), type `bash ./reboot.sh` instead.

## License

Copyright &copy; 2017 Cygnan  
Licensed under the MIT License, see [LICENSE.md](LICENSE.md).
