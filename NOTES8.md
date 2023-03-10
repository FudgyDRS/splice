Last login: Tue Feb 28 12:25:17 on ttys000
charlestaylor@charless-Air ~ % source ~/.zshrc 
source: no such file or directory: /Users/charlestaylor/.zshrc
charlestaylor@charless-Air ~ % source ~/.profile
source: no such file or directory: /Users/charlestaylor/.profile
charlestaylor@charless-Air ~ % asdf version
v0.11.2
charlestaylor@charless-Air ~ % asdf plugin add nodejs
asdf plugin add yarn
initializing plugin repository...Cloning into '/Users/charlestaylor/.asdf/repository'...
remote: Enumerating objects: 4911, done.
remote: Counting objects: 100% (136/136), done.
remote: Compressing objects: 100% (98/98), done.
remote: Total 4911 (delta 69), reused 89 (delta 36), pack-reused 4775
Receiving objects: 100% (4911/4911), 1.11 MiB | 3.58 MiB/s, done.
Resolving deltas: 100% (2614/2614), done.
charlestaylor@charless-Air ~ % asdf list
nodejs
  No versions installed
yarn
  No versions installed
charlestaylor@charless-Air ~ % brew install node
==> Fetching dependencies for node: brotli, c-ares, icu4c, libnghttp2, libuv and openssl@1.1
==> Fetching brotli
==> Downloading https://ghcr.io/v2/homebrew/core/brotli/manifests/1.0.9
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/brotli/blobs/sha256:dda0779953c
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sh
######################################################################## 100.0%
==> Fetching c-ares
==> Downloading https://ghcr.io/v2/homebrew/core/c-ares/manifests/1.19.0
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/c-ares/blobs/sha256:509c92f0a18
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sh
######################################################################## 100.0%
==> Fetching icu4c
==> Downloading https://ghcr.io/v2/homebrew/core/icu4c/manifests/72.1
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/icu4c/blobs/sha256:0666e999875e
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sh
######################################################################## 100.0%
==> Fetching libnghttp2
==> Downloading https://ghcr.io/v2/homebrew/core/libnghttp2/manifests/1.52.0
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/libnghttp2/blobs/sha256:d1f911e
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sh
######################################################################## 100.0%
==> Fetching libuv
==> Downloading https://ghcr.io/v2/homebrew/core/libuv/manifests/1.44.2-1
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/libuv/blobs/sha256:2653486daddc
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sh
######################################################################## 100.0%
==> Fetching openssl@1.1
==> Downloading https://ghcr.io/v2/homebrew/core/openssl/1.1/manifests/1.1.1t
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/openssl/1.1/blobs/sha256:e1e08d
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sh
######################################################################## 100.0%
==> Fetching node
==> Downloading https://ghcr.io/v2/homebrew/core/node/manifests/19.7.0
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/node/blobs/sha256:2b169bdadd952
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sh
######################################################################## 100.0%
==> Installing dependencies for node: brotli, c-ares, icu4c, libnghttp2, libuv and openssl@1.1
==> Installing node dependency: brotli
==> Pouring brotli--1.0.9.arm64_ventura.bottle.tar.gz
🍺  /opt/homebrew/Cellar/brotli/1.0.9: 25 files, 2.3MB
==> Installing node dependency: c-ares
==> Pouring c-ares--1.19.0.arm64_ventura.bottle.tar.gz
🍺  /opt/homebrew/Cellar/c-ares/1.19.0: 87 files, 675.9KB
==> Installing node dependency: icu4c
==> Pouring icu4c--72.1.arm64_ventura.bottle.tar.gz
🍺  /opt/homebrew/Cellar/icu4c/72.1: 263 files, 78.4MB
==> Installing node dependency: libnghttp2
==> Pouring libnghttp2--1.52.0.arm64_ventura.bottle.tar.gz
🍺  /opt/homebrew/Cellar/libnghttp2/1.52.0: 13 files, 731.5KB
==> Installing node dependency: libuv
==> Pouring libuv--1.44.2.arm64_ventura.bottle.1.tar.gz
🍺  /opt/homebrew/Cellar/libuv/1.44.2: 51 files, 3.5MB
==> Installing node dependency: openssl@1.1
==> Pouring openssl@1.1--1.1.1t.arm64_ventura.bottle.tar.gz
🍺  /opt/homebrew/Cellar/openssl@1.1/1.1.1t: 8,101 files, 18MB
==> Installing node
==> Pouring node--19.7.0.arm64_ventura.bottle.tar.gz
🍺  /opt/homebrew/Cellar/node/19.7.0: 2,357 files, 54.7MB
==> Running `brew cleanup node`...
Disable this behaviour by setting HOMEBREW_NO_INSTALL_CLEANUP.
Hide these hints with HOMEBREW_NO_ENV_HINTS (see `man brew`).
charlestaylor@charless-Air ~ % brew install yarn
==> Fetching yarn
==> Downloading https://ghcr.io/v2/homebrew/core/yarn/manifests/1.22.19
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/yarn/blobs/sha256:79b90324a5365
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sh
######################################################################## 100.0%
==> Pouring yarn--1.22.19.all.bottle.tar.gz
==> Caveats
yarn requires a Node installation to function. You can install one with:
  brew install node
==> Summary
🍺  /opt/homebrew/Cellar/yarn/1.22.19: 15 files, 5MB
==> Running `brew cleanup yarn`...
Disable this behaviour by setting HOMEBREW_NO_INSTALL_CLEANUP.
Hide these hints with HOMEBREW_NO_ENV_HINTS (see `man brew`).
charlestaylor@charless-Air ~ % ls
Desktop		Downloads	Movies		Pictures
Documents	Library		Music		Public
charlestaylor@charless-Air ~ % cd Documents
charlestaylor@charless-Air Documents % mkdir eth-den-rgas-token
charlestaylor@charless-Air Documents % cd eth-den-rgas-token
charlestaylor@charless-Air eth-den-rgas-token % git clone https://github.com/FudgyDRS/pop-smartcontracts
Cloning into 'pop-smartcontracts'...
remote: Enumerating objects: 108, done.
remote: Counting objects: 100% (108/108), done.
remote: Compressing objects: 100% (72/72), done.
remote: Total 108 (delta 44), reused 87 (delta 23), pack-reused 0
Receiving objects: 100% (108/108), 50.18 KiB | 901.00 KiB/s, done.
Resolving deltas: 100% (44/44), done.
charlestaylor@charless-Air eth-den-rgas-token % git remote add origin https://github.com/FudgyDRS/eth-den-rgas-token.git
git branch -M main
git push -u origin main
fatal: not a git repository (or any of the parent directories): .git
fatal: not a git repository (or any of the parent directories): .git
fatal: not a git repository (or any of the parent directories): .git
charlestaylor@charless-Air eth-den-rgas-token % ls
README.md		config.ts		scripts
arguements.js		contracts		test
arguements2.js		hardhat.config.ts	tsconfig.json
arguements3.js		mainNFT.txt
artifacts.txt		package.json
charlestaylor@charless-Air eth-den-rgas-token % rm artifacts.txt
charlestaylor@charless-Air eth-den-rgas-token % ls
README.md		config.ts		package.json
arguements.js		contracts		scripts
arguements2.js		hardhat.config.ts	test
arguements3.js		mainNFT.txt		tsconfig.json
charlestaylor@charless-Air eth-den-rgas-token % git init
hint: Using 'master' as the name for the initial branch. This default branch name
hint: is subject to change. To configure the initial branch name to use in all
hint: of your new repositories, which will suppress this warning, call:
hint: 
hint: 	git config --global init.defaultBranch <name>
hint: 
hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
hint: 'development'. The just-created branch can be renamed via this command:
hint: 
hint: 	git branch -m <name>
Initialized empty Git repository in /Users/charlestaylor/Documents/eth-den-rgas-token/.git/
charlestaylor@charless-Air eth-den-rgas-token % git remote add origin https://github.com/FudgyDRS/eth-den-rgas-token.git
git branch -M main
git push -u origin main
error: src refspec main does not match any
error: failed to push some refs to 'https://github.com/FudgyDRS/eth-den-rgas-token.git'
charlestaylor@charless-Air eth-den-rgas-token % brew install python@3.9
==> Downloading https://formulae.brew.sh/api/formula.jws.json
######################################################################## 100.0%
==> Fetching dependencies for python@3.9: gdbm, mpdecimal, sqlite and xz
==> Fetching gdbm
==> Downloading https://ghcr.io/v2/homebrew/core/gdbm/manifests/1.23
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/gdbm/blobs/sha256:a7321472cc9ff
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sh
######################################################################## 100.0%
==> Fetching mpdecimal
==> Downloading https://ghcr.io/v2/homebrew/core/mpdecimal/manifests/2.5.1
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/mpdecimal/blobs/sha256:5b1c62c0
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sh
######################################################################## 100.0%
==> Fetching sqlite
==> Downloading https://ghcr.io/v2/homebrew/core/sqlite/manifests/3.41.0
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/sqlite/blobs/sha256:72073c161c9
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sh
######################################################################## 100.0%
==> Fetching xz
==> Downloading https://ghcr.io/v2/homebrew/core/xz/manifests/5.4.1
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/xz/blobs/sha256:26ede511c3cc726
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sh
######################################################################## 100.0%
==> Fetching python@3.9
==> Downloading https://ghcr.io/v2/homebrew/core/python/3.9/manifests/3.9.16
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/python/3.9/blobs/sha256:10c0014
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sh
######################################################################## 100.0%
==> Installing dependencies for python@3.9: gdbm, mpdecimal, sqlite and xz
==> Installing python@3.9 dependency: gdbm
==> Pouring gdbm--1.23.arm64_ventura.bottle.tar.gz
==> Downloading https://formulae.brew.sh/api/cask.jws.json
######################################################################## 100.0%
🍺  /opt/homebrew/Cellar/gdbm/1.23: 24 files, 1MB
==> Installing python@3.9 dependency: mpdecimal
==> Pouring mpdecimal--2.5.1.arm64_ventura.bottle.tar.gz
🍺  /opt/homebrew/Cellar/mpdecimal/2.5.1: 71 files, 2.2MB
==> Installing python@3.9 dependency: sqlite
==> Pouring sqlite--3.41.0.arm64_ventura.bottle.tar.gz
🍺  /opt/homebrew/Cellar/sqlite/3.41.0: 11 files, 4.5MB
==> Installing python@3.9 dependency: xz
==> Pouring xz--5.4.1.arm64_ventura.bottle.tar.gz
🍺  /opt/homebrew/Cellar/xz/5.4.1: 95 files, 1.7MB
==> Installing python@3.9
==> Pouring python@3.9--3.9.16.arm64_ventura.bottle.tar.gz
==> /opt/homebrew/Cellar/python@3.9/3.9.16/bin/python3.9 -m ensurepip
==> /opt/homebrew/Cellar/python@3.9/3.9.16/bin/python3.9 -m pip install -v --no-
==> Caveats
Python has been installed as
  /opt/homebrew/bin/python3.9

Unversioned and major-versioned symlinks `python`, `python3`, `python-config`, `python3-config`, `pip`, `pip3`, etc. pointing to
`python3.9`, `python3.9-config`, `pip3.9` etc., respectively, have been installed into
  /opt/homebrew/opt/python@3.9/libexec/bin

You can install Python packages with
  pip3.9 install <package>
They will install into the site-package directory
  /opt/homebrew/lib/python3.9/site-packages

tkinter is no longer included with this formula, but it is available separately:
  brew install python-tk@3.9

If you do not need a specific version of Python, and always want Homebrew's `python3` in your PATH:
  brew install python3

See: https://docs.brew.sh/Homebrew-and-Python
==> Summary
🍺  /opt/homebrew/Cellar/python@3.9/3.9.16: 3,068 files, 57.3MB
==> Running `brew cleanup python@3.9`...
Disable this behaviour by setting HOMEBREW_NO_INSTALL_CLEANUP.
Hide these hints with HOMEBREW_NO_ENV_HINTS (see `man brew`).
==> Caveats
==> python@3.9
Python has been installed as
  /opt/homebrew/bin/python3.9

Unversioned and major-versioned symlinks `python`, `python3`, `python-config`, `python3-config`, `pip`, `pip3`, etc. pointing to
`python3.9`, `python3.9-config`, `pip3.9` etc., respectively, have been installed into
  /opt/homebrew/opt/python@3.9/libexec/bin

You can install Python packages with
  pip3.9 install <package>
They will install into the site-package directory
  /opt/homebrew/lib/python3.9/site-packages

tkinter is no longer included with this formula, but it is available separately:
  brew install python-tk@3.9

If you do not need a specific version of Python, and always want Homebrew's `python3` in your PATH:
  brew install python3

See: https://docs.brew.sh/Homebrew-and-Python
charlestaylor@charless-Air eth-den-rgas-token % brew install python3
==> Fetching python@3.11
==> Downloading https://ghcr.io/v2/homebrew/core/python/3.11/manifests/3.11.2_1
######################################################################## 100.0%
==> Downloading https://ghcr.io/v2/homebrew/core/python/3.11/blobs/sha256:ecbb2a
==> Downloading from https://pkg-containers.githubusercontent.com/ghcr1/blobs/sh
######################################################################## 100.0%
==> Pouring python@3.11--3.11.2_1.arm64_ventura.bottle.tar.gz
==> /opt/homebrew/Cellar/python@3.11/3.11.2_1/bin/python3.11 -m ensurepip
==> /opt/homebrew/Cellar/python@3.11/3.11.2_1/bin/python3.11 -m pip install -v -
==> Caveats
Python has been installed as
  /opt/homebrew/bin/python3

Unversioned symlinks `python`, `python-config`, `pip` etc. pointing to
`python3`, `python3-config`, `pip3` etc., respectively, have been installed into
  /opt/homebrew/opt/python@3.11/libexec/bin

You can install Python packages with
  pip3 install <package>
They will install into the site-package directory
  /opt/homebrew/lib/python3.11/site-packages

tkinter is no longer included with this formula, but it is available separately:
  brew install python-tk@3.11

gdbm (`dbm.gnu`) is no longer included in this formula, but it is available separately:
  brew install python-gdbm@3.11
`dbm.ndbm` changed database backends in Homebrew Python 3.11.
If you need to read a database from a previous Homebrew Python created via `dbm.ndbm`,
you'll need to read your database using the older version of Homebrew Python and convert to another format.
`dbm` still defaults to `dbm.gnu` when it is installed.

For more information about Homebrew and Python, see: https://docs.brew.sh/Homebrew-and-Python
==> Summary
🍺  /opt/homebrew/Cellar/python@3.11/3.11.2_1: 3,178 files, 62.2MB
==> Running `brew cleanup python@3.11`...
Disable this behaviour by setting HOMEBREW_NO_INSTALL_CLEANUP.
Hide these hints with HOMEBREW_NO_ENV_HINTS (see `man brew`).
charlestaylor@charless-Air eth-den-rgas-token % brew install --cask telegram
==> Downloading https://osx.telegram.org/updates/Telegram-9.4.1.243742.app.zip
######################################################################## 100.0%
==> Installing Cask telegram
==> Downloading https://formulae.brew.sh/api/formula.jws.json
#=#=-#  #                                                                     
==> Moving App 'Telegram.app' to '/Applications/Telegram.app'
🍺  telegram was successfully installed!
charlestaylor@charless-Air eth-den-rgas-token % brew install --cask discord
==> Downloading https://formulae.brew.sh/api/cask.jws.json
######################################################################## 100.0%
==> Downloading https://dl.discordapp.net/apps/osx/0.0.273/Discord.dmg
####################################################                      72.7%curl: (56) LibreSSL SSL_read: error:02FFF036:system library:func(4095):Connection reset by peer, errno 54

Error: Download failed on Cask 'discord' with message: Download failed: https://dl.discordapp.net/apps/osx/0.0.273/Discord.dmg
charlestaylor@charless-Air eth-den-rgas-token % yarn install
yarn install v1.22.19
info No lockfile found.
[1/5] 🔍  Validating package.json...
error pop-exercise-contracts@1.0.0: The engine "node" is incompatible with this module. Expected version "18.x.x". Got "19.7.0"
error Found incompatible module.
info Visit https://yarnpkg.com/en/docs/cli/install for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % nvm  list                   
zsh: command not found: nvm
charlestaylor@charless-Air eth-den-rgas-token % curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 14984  100 14984    0     0  33639      0 --:--:-- --:--:-- --:--:-- 34288
=> Downloading nvm from git to '/Users/charlestaylor/.nvm'
=> hint: Using 'master' as the name for the initial branch. This default branch name
hint: is subject to change. To configure the initial branch name to use in all
hint: of your new repositories, which will suppress this warning, call:
hint: 
hint: 	git config --global init.defaultBranch <name>
hint: 
hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
hint: 'development'. The just-created branch can be renamed via this command:
hint: 
hint: 	git branch -m <name>
Initialized empty Git repository in /Users/charlestaylor/.nvm/.git/
=> Compressing and cleaning up git repository

=> Profile not found. Tried ~/.bashrc, ~/.bash_profile, ~/.zshrc, and ~/.profile.
=> Create one of them and run this script again
   OR
=> Append the following lines to the correct file yourself:

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

=> Close and reopen your terminal to start using nvm or run the following to use it now:

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
charlestaylor@charless-Air eth-den-rgas-token % export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

charlestaylor@charless-Air eth-den-rgas-token % nvm version 
v19.7.0
charlestaylor@charless-Air eth-den-rgas-token % nvm list
       v18.14.2
->      v19.7.0
         system
default -> 19.7.0 (-> v19.7.0)
iojs -> N/A (default)
unstable -> N/A (default)
node -> stable (-> v19.7.0) (default)
stable -> 19.7 (-> v19.7.0) (default)
lts/* -> lts/hydrogen (-> v18.14.2)
lts/argon -> v4.9.1 (-> N/A)
lts/boron -> v6.17.1 (-> N/A)
lts/carbon -> v8.17.0 (-> N/A)
lts/dubnium -> v10.24.1 (-> N/A)
lts/erbium -> v12.22.12 (-> N/A)
lts/fermium -> v14.21.3 (-> N/A)
lts/gallium -> v16.19.1 (-> N/A)
lts/hydrogen -> v18.14.2
charlestaylor@charless-Air eth-den-rgas-token % nvm use 18.14.2
Now using node v18.14.2 (npm v9.5.0)
charlestaylor@charless-Air eth-den-rgas-token % yarn install
yarn install v1.22.19
info No lockfile found.
[1/5] 🔍  Validating package.json...
[2/5] 🔍  Resolving packages...
warning @nomiclabs/hardhat-truffle5 > @nomiclabs/truffle-contract > @ensdomains/ensjs > @ensdomains/ens@0.4.5: Please use @ensdomains/ens-contracts
warning @nomiclabs/hardhat-truffle5 > @nomiclabs/truffle-contract > @ensdomains/ensjs > @ensdomains/resolver@0.2.4: Please use @ensdomains/ens-contracts
warning @nomiclabs/hardhat-truffle5 > @nomiclabs/truffle-contract > @ensdomains/ensjs > @ensdomains/ens > testrpc@0.0.1: testrpc has been renamed to ganache-cli, please use this package from now on.
warning @nomiclabs/hardhat-truffle5 > @nomiclabs/truffle-contract > @ensdomains/ensjs > content-hash > multicodec@0.5.7: This module has been superseded by the multiformats module
warning @nomiclabs/hardhat-truffle5 > @nomiclabs/truffle-contract > @ensdomains/ensjs > content-hash > cids@0.7.5: This module has been superseded by the multiformats module
warning @nomiclabs/hardhat-truffle5 > @nomiclabs/truffle-contract > @ensdomains/ensjs > content-hash > cids > multicodec@1.0.4: This module has been superseded by the multiformats module
warning @nomiclabs/hardhat-truffle5 > @nomiclabs/truffle-contract > @ensdomains/ensjs > content-hash > multihashes > multibase@0.7.0: This module has been superseded by the multiformats module
warning @nomiclabs/hardhat-truffle5 > @nomiclabs/truffle-contract > @ensdomains/ensjs > content-hash > cids > multibase@0.6.1: This module has been superseded by the multiformats module
warning @nomiclabs/hardhat-truffle5 > @nomiclabs/truffle-contract > ethers > uuid@2.0.1: Please upgrade  to version 7 or higher.  Older versions may use Math.random() in certain circumstances, which is known to be problematic.  See https://v8.dev/blog/math-random for details.
warning @nomiclabs/hardhat-truffle5 > @nomiclabs/truffle-contract > ethereum-ens > web3 > web3-bzz > swarm-js > mkdirp-promise@5.0.1: This package is broken and no longer maintained. 'mkdirp' itself supports promises now, please switch to that.
warning @nomiclabs/hardhat-truffle5 > @nomiclabs/truffle-contract > ethereum-ens > web3 > web3-bzz > swarm-js > eth-lib > servify > request@2.88.2: request has been deprecated, see https://github.com/request/request/issues/3142
warning @nomiclabs/hardhat-truffle5 > @nomiclabs/truffle-contract > ethereum-ens > web3 > web3-bzz > swarm-js > eth-lib > servify > request > uuid@3.4.0: Please upgrade  to version 7 or higher.  Older versions may use Math.random() in certain circumstances, which is known to be problematic.  See https://v8.dev/blog/math-random for details.
warning @nomiclabs/hardhat-truffle5 > @nomiclabs/truffle-contract > ethereum-ens > web3 > web3-bzz > swarm-js > eth-lib > servify > request > har-validator@5.1.5: this library is no longer supported
warning @nomiclabs/hardhat-web3 > @types/bignumber.js@5.0.0: This is a stub types definition for bignumber.js (https://github.com/MikeMcl/bignumber.js/). bignumber.js provides its own type definitions, so you don't need @types/bignumber.js installed!
warning ethereum-waffle > @ethereum-waffle/compiler > @resolver-engine/imports > @resolver-engine/core > request@2.88.2: request has been deprecated, see https://github.com/request/request/issues/3142
warning ethereum-waffle > @ethereum-waffle/compiler > @resolver-engine/imports > url > querystring@0.2.0: The querystring API is considered Legacy. new code should use the URLSearchParams API instead.
warning ethereum-waffle > @ethereum-waffle/provider > @ethereum-waffle/ens > @ensdomains/ens@0.4.5: Please use @ensdomains/ens-contracts
warning ethereum-waffle > @ethereum-waffle/provider > @ethereum-waffle/ens > @ensdomains/resolver@0.2.4: Please use @ensdomains/ens-contracts
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core@2.13.2: ganache-core is now ganache; visit https://trfl.io/g7 for details
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > debug@3.2.6: Debug versions >=3.2.0 <3.2.7 || >=4 <4.3.1 have a low-severity ReDos regression when used in a Node.js environment. It is recommended you upgrade to 3.2.7 or 4.3.1. (https://github.com/visionmedia/debug/issues/797)
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > web3 > web3-eth > web3-eth-accounts > uuid@3.3.2: Please upgrade  to version 7 or higher.  Older versions may use Math.random() in certain circumstances, which is known to be problematic.  See https://v8.dev/blog/math-random for details.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > eth-sig-util@3.0.0: Deprecated in favor of '@metamask/eth-sig-util'
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > ethereumjs-account@3.0.0: Please use Util.Account class found on package ethereumjs-util@^7.0.6 https://github.com/ethereumjs/ethereumjs-util/releases/tag/v7.0.6
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > ethereumjs-common@1.5.0: New package name format for new versions: @ethereumjs/common. Please update.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > web3 > web3-eth > web3-eth-accounts > ethereumjs-common@1.5.2: New package name format for new versions: @ethereumjs/common. Please update.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > ethereumjs-block@2.2.2: New package name format for new versions: @ethereumjs/block. Please update.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > ethereumjs-block > ethereumjs-common@1.5.2: New package name format for new versions: @ethereumjs/common. Please update.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > ethereumjs-vm@4.2.0: New package name format for new versions: @ethereumjs/vm. Please update.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > ethereumjs-vm > ethereumjs-account@3.0.0: Please use Util.Account class found on package ethereumjs-util@^7.0.6 https://github.com/ethereumjs/ethereumjs-util/releases/tag/v7.0.6
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > ethereumjs-vm > ethereumjs-block@2.2.2: New package name format for new versions: @ethereumjs/block. Please update.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > ethereumjs-vm > ethereumjs-common@1.5.2: New package name format for new versions: @ethereumjs/common. Please update.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > ethereumjs-tx@2.1.2: New package name format for new versions: @ethereumjs/tx. Please update.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > web3 > web3-eth > web3-eth-accounts > ethereumjs-tx@2.1.2: New package name format for new versions: @ethereumjs/tx. Please update.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > ethereumjs-block > ethereumjs-tx@2.1.2: New package name format for new versions: @ethereumjs/tx. Please update.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > ethereumjs-vm > ethereumjs-tx@2.1.2: New package name format for new versions: @ethereumjs/tx. Please update.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > ethereumjs-tx > ethereumjs-common@1.5.2: New package name format for new versions: @ethereumjs/common. Please update.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > ethereumjs-wallet > uuid@3.4.0: Please upgrade  to version 7 or higher.  Older versions may use Math.random() in certain circumstances, which is known to be problematic.  See https://v8.dev/blog/math-random for details.
info There appears to be trouble with your network connection. Retrying...
info There appears to be trouble with your network connection. Retrying...
info There appears to be trouble with your network connection. Retrying...
info There appears to be trouble with your network connection. Retrying...
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > ethereumjs-vm > ethereumjs-blockchain@4.0.4: New package name format for new versions: @ethereumjs/blockchain. Please update.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > ethereumjs-vm > ethereumjs-blockchain > ethereumjs-block@2.2.2: New package name format for new versions: @ethereumjs/block. Please update.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > ethereumjs-vm > ethereumjs-blockchain > ethereumjs-common@1.5.2: New package name format for new versions: @ethereumjs/common. Please update.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > patch-package > find-yarn-workspace-root > micromatch > snapdragon > source-map-resolve@0.5.3: See https://github.com/lydell/source-map-resolve#deprecated
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > web3-provider-engine > eth-sig-util@1.4.2: Deprecated in favor of '@metamask/eth-sig-util'
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > web3-provider-engine > ethereumjs-block@1.7.1: New package name format for new versions: @ethereumjs/block. Please update.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > web3-provider-engine > ethereumjs-tx@1.3.7: New package name format for new versions: @ethereumjs/tx. Please update.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > web3-provider-engine > ethereumjs-vm@2.6.0: New package name format for new versions: @ethereumjs/vm. Please update.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > web3-provider-engine > request@2.88.2: request has been deprecated, see https://github.com/request/request/issues/3142
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > web3-provider-engine > ethereumjs-block > ethereumjs-tx@1.3.7: New package name format for new versions: @ethereumjs/tx. Please update.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > web3-provider-engine > ethereumjs-vm > ethereumjs-block@2.2.2: New package name format for new versions: @ethereumjs/block. Please update.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > web3-provider-engine > ethereumjs-vm > ethereumjs-common@1.5.2: New package name format for new versions: @ethereumjs/common. Please update.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > ethereumjs-vm > ethereumjs-blockchain > ethashjs@0.0.8: New package name format for new versions: @ethereumjs/ethash. Please update.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > patch-package > find-yarn-workspace-root > micromatch > snapdragon > source-map-resolve > urix@0.1.0: Please see https://github.com/lydell/urix#deprecated
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > patch-package > find-yarn-workspace-root > micromatch > snapdragon > source-map-resolve > resolve-url@0.2.1: https://github.com/lydell/resolve-url#deprecated
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > patch-package > find-yarn-workspace-root > micromatch > snapdragon > source-map-resolve > source-map-url@0.4.1: See https://github.com/lydell/source-map-url#deprecated
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > web3-provider-engine > eth-json-rpc-infura > eth-json-rpc-middleware > ethereumjs-block@1.7.1: New package name format for new versions: @ethereumjs/block. Please update.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > web3-provider-engine > eth-json-rpc-infura > eth-json-rpc-middleware > ethereumjs-tx@1.3.7: New package name format for new versions: @ethereumjs/tx. Please update.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > web3-provider-engine > eth-json-rpc-infura > eth-json-rpc-middleware > ethereumjs-vm@2.6.0: New package name format for new versions: @ethereumjs/vm. Please update.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > web3-provider-engine > eth-json-rpc-infura > json-rpc-engine > safe-event-emitter@1.0.1: Renamed to @metamask/safe-event-emitter
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > web3-provider-engine > eth-json-rpc-infura > eth-json-rpc-middleware > eth-tx-summary > ethereumjs-block@1.7.1: New package name format for new versions: @ethereumjs/block. Please update.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > web3-provider-engine > eth-json-rpc-infura > eth-json-rpc-middleware > eth-tx-summary > ethereumjs-tx@1.3.7: New package name format for new versions: @ethereumjs/tx. Please update.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > web3-provider-engine > eth-json-rpc-infura > eth-json-rpc-middleware > eth-tx-summary > ethereumjs-vm@2.6.0: New package name format for new versions: @ethereumjs/vm. Please update.
info There appears to be trouble with your network connection. Retrying...
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > web3-provider-engine > eth-block-tracker > ethereumjs-tx@1.3.7: New package name format for new versions: @ethereumjs/tx. Please update.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > web3-provider-engine > eth-json-rpc-infura > json-rpc-engine > babel-preset-env > babel-plugin-transform-es2015-arrow-functions > babel-runtime > core-js@2.6.12: core-js@<3.23.3 is no longer maintained and not recommended for usage due to the number of issues. Because of the V8 engine whims, feature detection in old core-js versions could cause a slowdown up to 100x even if nothing is polyfilled. Some versions have web compatibility issues. Please, upgrade your dependencies to the actual version of core-js.
warning ethereum-waffle > @ethereum-waffle/provider > ganache-core > web3-provider-engine > eth-json-rpc-infura > json-rpc-engine > babelify > babel-core > babel-register > core-js@2.6.12: core-js@<3.23.3 is no longer maintained and not recommended for usage due to the number of issues. Because of the V8 engine whims, feature detection in old core-js versions could cause a slowdown up to 100x even if nothing is polyfilled. Some versions have web compatibility issues. Please, upgrade your dependencies to the actual version of core-js.
warning lerna > @npmcli/arborist > @npmcli/move-file@2.0.1: This functionality has been moved to @npmcli/fs
warning lerna > pacote > cacache > @npmcli/move-file@2.0.1: This functionality has been moved to @npmcli/fs
warning lerna > @npmcli/arborist > readdir-scoped-modules@1.1.0: This functionality has been moved to @npmcli/fs
warning solidity-coverage > mocha > debug@3.2.6: Debug versions >=3.2.0 <3.2.7 || >=4 <4.3.1 have a low-severity ReDos regression when used in a Node.js environment. It is recommended you upgrade to 3.2.7 or 4.3.1. (https://github.com/visionmedia/debug/issues/797)
warning solidity-coverage > mocha > chokidar > fsevents@2.1.3: "Please update to latest v2.3 or v2.2"
[3/5] 🚚  Fetching packages...
[4/5] 🔗  Linking dependencies...
warning "@nomiclabs/hardhat-truffle5 > @nomiclabs/truffle-contract@4.5.10" has unmet peer dependency "web3-core-helpers@^1.2.1".
warning "@nomiclabs/hardhat-truffle5 > @nomiclabs/truffle-contract@4.5.10" has unmet peer dependency "web3-core-promievent@^1.2.1".
warning "@nomiclabs/hardhat-truffle5 > @nomiclabs/truffle-contract@4.5.10" has unmet peer dependency "web3-eth-abi@^1.2.1".
warning "@nomiclabs/hardhat-truffle5 > @nomiclabs/truffle-contract@4.5.10" has unmet peer dependency "web3-utils@^1.2.1".
warning "@openzeppelin/test-helpers > chai-bn@0.2.2" has unmet peer dependency "bn.js@^4.11.0".
[5/5] 🔨  Building fresh packages...
success Saved lockfile.
$ husky install
husky - Git hooks installed
✨  Done in 1706.55s.
charlestaylor@charless-Air eth-den-rgas-token % yarn add --save-dev @uniswap/v3-core
yarn add v1.22.19
error Missing list of packages to add to your project.
info Visit https://yarnpkg.com/en/docs/cli/add for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % yarn add --save-dev @uniswap   
yarn add v1.22.19
error Missing list of packages to add to your project.
info Visit https://yarnpkg.com/en/docs/cli/add for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % yarn add --dev @uniswap/v3-core
yarn add v1.22.19
error Running this command will add the dependency to the workspace root rather than the workspace itself, which might not be what you want - if you really meant it, make it explicit by running this command again with the -W flag (or --ignore-workspace-root-check).
info Visit https://yarnpkg.com/en/docs/cli/add for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % yarn --dev add @uniswap/v3-core
yarn add v1.22.19
error Running this command will add the dependency to the workspace root rather than the workspace itself, which might not be what you want - if you really meant it, make it explicit by running this command again with the -W flag (or --ignore-workspace-root-check).
info Visit https://yarnpkg.com/en/docs/cli/add for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % yarn -dev add @uniswap/v3-core 
1.22.19
charlestaylor@charless-Air eth-den-rgas-token % yarn install
yarn install v1.22.19
[1/5] 🔍  Validating package.json...
[2/5] 🔍  Resolving packages...
[3/5] 🚚  Fetching packages...
[4/5] 🔗  Linking dependencies...
warning "@nomiclabs/hardhat-truffle5 > @nomiclabs/truffle-contract@4.5.10" has unmet peer dependency "web3-core-helpers@^1.2.1".
warning "@nomiclabs/hardhat-truffle5 > @nomiclabs/truffle-contract@4.5.10" has unmet peer dependency "web3-core-promievent@^1.2.1".
warning "@nomiclabs/hardhat-truffle5 > @nomiclabs/truffle-contract@4.5.10" has unmet peer dependency "web3-eth-abi@^1.2.1".
warning "@nomiclabs/hardhat-truffle5 > @nomiclabs/truffle-contract@4.5.10" has unmet peer dependency "web3-utils@^1.2.1".
warning "@openzeppelin/test-helpers > chai-bn@0.2.2" has unmet peer dependency "bn.js@^4.11.0".
[5/5] 🔨  Building fresh packages...
success Saved lockfile.
$ husky install
husky - Git hooks installed
✨  Done in 5.45s.
charlestaylor@charless-Air eth-den-rgas-token % yarn add @cartesi/descartes-sdk@1.1.1 --dev
yarn add v1.22.19
error Running this command will add the dependency to the workspace root rather than the workspace itself, which might not be what you want - if you really meant it, make it explicit by running this command again with the -W flag (or --ignore-workspace-root-check).
info Visit https://yarnpkg.com/en/docs/cli/add for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % yarn add @cartesi/descartes-sdk@1.1.1 -dev 
1.22.19
charlestaylor@charless-Air eth-den-rgas-token % yarn install
yarn install v1.22.19
[1/5] 🔍  Validating package.json...
[2/5] 🔍  Resolving packages...
[3/5] 🚚  Fetching packages...
[4/5] 🔗  Linking dependencies...
warning "@nomiclabs/hardhat-truffle5 > @nomiclabs/truffle-contract@4.5.10" has unmet peer dependency "web3-core-helpers@^1.2.1".
warning "@nomiclabs/hardhat-truffle5 > @nomiclabs/truffle-contract@4.5.10" has unmet peer dependency "web3-core-promievent@^1.2.1".
warning "@nomiclabs/hardhat-truffle5 > @nomiclabs/truffle-contract@4.5.10" has unmet peer dependency "web3-eth-abi@^1.2.1".
warning "@nomiclabs/hardhat-truffle5 > @nomiclabs/truffle-contract@4.5.10" has unmet peer dependency "web3-utils@^1.2.1".
warning "@openzeppelin/test-helpers > chai-bn@0.2.2" has unmet peer dependency "bn.js@^4.11.0".
[5/5] 🔨  Building fresh packages...
success Saved lockfile.
$ husky install
husky - Git hooks installed
✨  Done in 7.44s.
charlestaylor@charless-Air eth-den-rgas-token % yarn compile
yarn run v1.22.19
$ npx hardhat compile
✖ Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y

Error HH404: File @openzeppelin/contracts/token/ERC721/IERC721Metadata.sol, imported from @uniswap/v3-periphery/contracts/interfaces/INonfungiblePositionManager.sol, not found.

For more info go to https://hardhat.org/HH404 or run Hardhat with --show-stack-traces
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % cd node_modules
charlestaylor@charless-Air node_modules % cd ..          
charlestaylor@charless-Air eth-den-rgas-token % yarn compile   
yarn run v1.22.19
$ npx hardhat compile
✖ Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y

Error HH404: File @openzeppelin/contracts/token/ERC721/IERC721Metadata.sol, imported from @uniswap/v3-periphery/contracts/interfaces/INonfungiblePositionManager.sol, not found.

For more info go to https://hardhat.org/HH404 or run Hardhat with --show-stack-traces
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % yarn compile
yarn run v1.22.19
$ npx hardhat compile
✖ Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y

Error HH404: File @openzeppelin/contracts/token/ERC721/IERC721Metadata.sol, imported from @uniswap/v3-periphery/contracts/interfaces/INonfungiblePositionManager.sol, not found.

For more info go to https://hardhat.org/HH404 or run Hardhat with --show-stack-traces
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % yarn prepare
yarn run v1.22.19
$ husky install
husky - Git hooks installed
✨  Done in 0.31s.
charlestaylor@charless-Air eth-den-rgas-token % yarn compile
yarn run v1.22.19
$ npx hardhat compile
✖ Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y

Error HH404: File @openzeppelin/contracts/token/ERC721/IERC721Metadata.sol, imported from @uniswap/v3-periphery/contracts/interfaces/INonfungiblePositionManager.sol, not found.

For more info go to https://hardhat.org/HH404 or run Hardhat with --show-stack-traces
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % yarn compile
yarn run v1.22.19
$ npx hardhat compile
✖ Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y

Error HH404: File @openzeppelin/contracts/token/ERC721/IERC721Metadata.sol, imported from @uniswap/v3-periphery/contracts/interfaces/INonfungiblePositionManager.sol, not found.

For more info go to https://hardhat.org/HH404 or run Hardhat with --show-stack-traces
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % yarn compile
yarn run v1.22.19
$ npx hardhat compile
✖ Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y

Error HH606: The project cannot be compiled, see reasons below.

The Solidity version pragma statement in these files doesn't match any of the configured compilers in your config. Change the pragma or configure additional compiler versions in your hardhat config.

  * contracts/Arbitrage.sol (^0.8.19)
  * contracts/Vault.sol (^0.8.19)
  * contracts/Treasury.sol (^0.8.19)
  * contracts/LiquidationEngine.sol (^0.8.19)
  * contracts/GasToken.sol (^0.8.19)
  * contracts/Bank.sol (^0.8.19)

To learn more, run the command again with --verbose

Read about compiler configuration at https://hardhat.org/config


For more info go to https://hardhat.org/HH606 or run Hardhat with --show-stack-traces
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % yarn compile
yarn run v1.22.19
$ npx hardhat compile
✖ Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y

Error HH606: The project cannot be compiled, see reasons below.

The Solidity version pragma statement in these files doesn't match any of the configured compilers in your config. Change the pragma or configure additional compiler versions in your hardhat config.

  * contracts/Arbitrage.sol (^0.8.19)
  * contracts/Bank.sol (^0.8.19)
  * contracts/Vault.sol (^0.8.19)
  * contracts/Treasury.sol (^0.8.19)
  * contracts/LiquidationEngine.sol (^0.8.19)
  * contracts/GasToken.sol (^0.8.19)

To learn more, run the command again with --verbose

Read about compiler configuration at https://hardhat.org/config


For more info go to https://hardhat.org/HH606 or run Hardhat with --show-stack-traces
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % yarn compile
yarn run v1.22.19
$ npx hardhat compile
Solidity 0.8.19 is not fully supported yet. You can still use Hardhat, but some features, like stack traces, might not work correctly.

Learn more at https://hardhat.org/hardhat-runner/docs/reference/solidity-support

✖ Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y

Downloading compiler 0.8.19
Downloading compiler 0.8.19
Warning: SPDX license identifier not provided in source file. Before publishing, consider adding a comment containing "SPDX-License-Identifier: <SPDX-License>" to each source file. Use "SPDX-License-Identifier: UNLICENSED" for non-open-source code. Please see https://spdx.org for more information.
--> contracts/do_not_compile/BondingCurve.sol


DeclarationError: Identifier not found or not unique.
  --> contracts/GasToken.sol:83:28:
   |
83 | contract ERC20 is Context, IERC20Minimal {
   |                            ^^^^^^^^^^^^^


Error HH600: Compilation failed

For more info go to https://hardhat.org/HH600 or run Hardhat with --show-stack-traces
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % yarn compile
yarn run v1.22.19
$ npx hardhat compile
Solidity 0.8.19 is not fully supported yet. You can still use Hardhat, but some features, like stack traces, might not work correctly.

Learn more at https://hardhat.org/hardhat-runner/docs/reference/solidity-support

✖ Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y

Warning: SPDX license identifier not provided in source file. Before publishing, consider adding a comment containing "SPDX-License-Identifier: <SPDX-License>" to each source file. Use "SPDX-License-Identifier: UNLICENSED" for non-open-source code. Please see https://spdx.org for more information.
--> contracts/do_not_compile/BondingCurve.sol


DeclarationError: Undeclared identifier. Did you mean "_transfer" or "transfer"?
   --> contracts/GasToken.sol:243:14:
    |
243 |         emit Transfer(sender, recipient, amount);
    |              ^^^^^^^^


DeclarationError: Undeclared identifier. Did you mean "_transfer" or "transfer"?
   --> contracts/GasToken.sol:262:14:
    |
262 |         emit Transfer(address(0), account, amount);
    |              ^^^^^^^^


DeclarationError: Undeclared identifier. Did you mean "_transfer" or "transfer"?
   --> contracts/GasToken.sol:283:14:
    |
283 |         emit Transfer(account, address(0), amount);
    |              ^^^^^^^^


DeclarationError: Undeclared identifier.
   --> contracts/GasToken.sol:304:14:
    |
304 |         emit Approval(owner, spender, amount);
    |              ^^^^^^^^


Error HH600: Compilation failed

For more info go to https://hardhat.org/HH600 or run Hardhat with --show-stack-traces
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % yarn compile
yarn run v1.22.19
$ npx hardhat compile
Solidity 0.8.19 is not fully supported yet. You can still use Hardhat, but some features, like stack traces, might not work correctly.

Learn more at https://hardhat.org/hardhat-runner/docs/reference/solidity-support

✖ Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y

Warning: SPDX license identifier not provided in source file. Before publishing, consider adding a comment containing "SPDX-License-Identifier: <SPDX-License>" to each source file. Use "SPDX-License-Identifier: UNLICENSED" for non-open-source code. Please see https://spdx.org for more information.
--> contracts/do_not_compile/BondingCurve.sol


DeclarationError: Undeclared identifier. Did you mean "_transfer" or "transfer"?
   --> contracts/GasToken.sol:243:14:
    |
243 |         emit Transfer(sender, recipient, amount);
    |              ^^^^^^^^


DeclarationError: Undeclared identifier. Did you mean "_transfer" or "transfer"?
   --> contracts/GasToken.sol:262:14:
    |
262 |         emit Transfer(address(0), account, amount);
    |              ^^^^^^^^


Error HH600: Compilation failed

For more info go to https://hardhat.org/HH600 or run Hardhat with --show-stack-traces
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % yarn compile
yarn run v1.22.19
$ npx hardhat compile
Solidity 0.8.19 is not fully supported yet. You can still use Hardhat, but some features, like stack traces, might not work correctly.

Learn more at https://hardhat.org/hardhat-runner/docs/reference/solidity-support

✖ Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y

Warning: SPDX license identifier not provided in source file. Before publishing, consider adding a comment containing "SPDX-License-Identifier: <SPDX-License>" to each source file. Use "SPDX-License-Identifier: UNLICENSED" for non-open-source code. Please see https://spdx.org for more information.
--> contracts/do_not_compile/BondingCurve.sol


DeclarationError: Undeclared identifier. Did you mean "bank_"?
   --> contracts/GasToken.sol:946:16:
    |
946 |     revokeMint(_bank);
    |                ^^^^^


DeclarationError: Undeclared identifier. Did you mean "bank_"?
   --> contracts/GasToken.sol:947:5:
    |
947 |     _bank = bank_;
    |     ^^^^^


DeclarationError: Undeclared identifier. Did you mean "bank_"?
   --> contracts/GasToken.sol:948:15:
    |
948 |     grantMint(_bank);
    |               ^^^^^


Error HH600: Compilation failed

For more info go to https://hardhat.org/HH600 or run Hardhat with --show-stack-traces
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % yarn compile
yarn run v1.22.19
$ npx hardhat compile
Solidity 0.8.19 is not fully supported yet. You can still use Hardhat, but some features, like stack traces, might not work correctly.

Learn more at https://hardhat.org/hardhat-runner/docs/reference/solidity-support

✖ Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y

Warning: SPDX license identifier not provided in source file. Before publishing, consider adding a comment containing "SPDX-License-Identifier: <SPDX-License>" to each source file. Use "SPDX-License-Identifier: UNLICENSED" for non-open-source code. Please see https://spdx.org for more information.
--> contracts/do_not_compile/BondingCurve.sol


TypeError: Function has override specified but does not override anything.
   --> contracts/GasToken.sol:133:48:
    |
133 |     function totalSupply() public view virtual override returns (uint256) {
    |                                                ^^^^^^^^


TypeError: Function has override specified but does not override anything.
   --> contracts/GasToken.sol:140:61:
    |
140 |     function balanceOf(address account) public view virtual override returns (uint256) {
    |                                                             ^^^^^^^^


TypeError: Function has override specified but does not override anything.
   --> contracts/GasToken.sol:152:73:
    |
152 |     function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
    |                                                                         ^^^^^^^^


TypeError: Function has override specified but does not override anything.
   --> contracts/GasToken.sol:160:76:
    |
160 |     function allowance(address owner, address spender) public view virtual override returns (uint256) {
    |                                                                            ^^^^^^^^


TypeError: Function has override specified but does not override anything.
   --> contracts/GasToken.sol:171:70:
    |
171 |     function approve(address spender, uint256 amount) public virtual override returns (bool) {
    |                                                                      ^^^^^^^^


TypeError: Function has override specified but does not override anything.
   --> contracts/GasToken.sol:179:93:
    |
179 |     function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {
    |                                                                                             ^^^^^^^^


TypeError: Function has override specified but does not override anything.
   --> contracts/GasToken.sol:941:49:
    |
941 |   function Burn(uint256 amount_) public virtual override {
    |                                                 ^^^^^^^^


DeclarationError: Variable name twapSum_ already taken in this scope.
   --> contracts/GasToken.sol:829:7:
    |
829 |       let twapSum_ := add(sub(twapSum_, and(twapStorage_, oldestMask_)), basefee())
    |       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


TypeError: Expression has to be an lvalue.
   --> contracts/GasToken.sol:903:5:
    |
903 |     owner = _msgSender();
    |     ^^^^^


TypeError: Type address is not implicitly convertible to expected type function () view returns (address).
   --> contracts/GasToken.sol:903:13:
    |
903 |     owner = _msgSender();
    |             ^^^^^^^^^^^^


TypeError: Member "factory" not found or not visible after argument-dependent lookup in contract ISwapRouter.
   --> contracts/GasToken.sol:910:48:
    |
910 |     address _uniswapV2Pair = IUniswapV2Factory(_uniswapRouter.factory())
    |                                                ^^^^^^^^^^^^^^^^^^^^^^


Error HH600: Compilation failed

For more info go to https://hardhat.org/HH600 or run Hardhat with --show-stack-traces
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % yarn compile
yarn run v1.22.19
$ npx hardhat compile
Solidity 0.8.19 is not fully supported yet. You can still use Hardhat, but some features, like stack traces, might not work correctly.

Learn more at https://hardhat.org/hardhat-runner/docs/reference/solidity-support

✖ Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y

Warning: SPDX license identifier not provided in source file. Before publishing, consider adding a comment containing "SPDX-License-Identifier: <SPDX-License>" to each source file. Use "SPDX-License-Identifier: UNLICENSED" for non-open-source code. Please see https://spdx.org for more information.
--> contracts/do_not_compile/BondingCurve.sol


TypeError: Function has override specified but does not override anything.
   --> contracts/GasToken.sol:133:48:
    |
133 |     function totalSupply() public view virtual override returns (uint256) {
    |                                                ^^^^^^^^


TypeError: Function has override specified but does not override anything.
   --> contracts/GasToken.sol:140:61:
    |
140 |     function balanceOf(address account) public view virtual override returns (uint256) {
    |                                                             ^^^^^^^^


TypeError: Function has override specified but does not override anything.
   --> contracts/GasToken.sol:152:73:
    |
152 |     function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
    |                                                                         ^^^^^^^^


TypeError: Function has override specified but does not override anything.
   --> contracts/GasToken.sol:160:76:
    |
160 |     function allowance(address owner, address spender) public view virtual override returns (uint256) {
    |                                                                            ^^^^^^^^


TypeError: Function has override specified but does not override anything.
   --> contracts/GasToken.sol:171:70:
    |
171 |     function approve(address spender, uint256 amount) public virtual override returns (bool) {
    |                                                                      ^^^^^^^^


TypeError: Function has override specified but does not override anything.
   --> contracts/GasToken.sol:179:93:
    |
179 |     function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {
    |                                                                                             ^^^^^^^^


TypeError: Function has override specified but does not override anything.
   --> contracts/GasToken.sol:941:49:
    |
941 |   function Burn(uint256 amount_) public virtual override {
    |                                                 ^^^^^^^^


DeclarationError: Variable name twapSum_ already taken in this scope.
   --> contracts/GasToken.sol:829:7:
    |
829 |       let twapSum_ := add(sub(twapSum_, and(twapStorage_, oldestMask_)), basefee())
    |       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


Error HH600: Compilation failed

For more info go to https://hardhat.org/HH600 or run Hardhat with --show-stack-traces
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % yarn compile
yarn run v1.22.19
$ npx hardhat compile
Solidity 0.8.19 is not fully supported yet. You can still use Hardhat, but some features, like stack traces, might not work correctly.

Learn more at https://hardhat.org/hardhat-runner/docs/reference/solidity-support

✖ Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y

Warning: SPDX license identifier not provided in source file. Before publishing, consider adding a comment containing "SPDX-License-Identifier: <SPDX-License>" to each source file. Use "SPDX-License-Identifier: UNLICENSED" for non-open-source code. Please see https://spdx.org for more information.
--> contracts/do_not_compile/BondingCurve.sol


TypeError: Function has override specified but does not override anything.
   --> contracts/GasToken.sol:133:48:
    |
133 |     function totalSupply() public view virtual override returns (uint256) {
    |                                                ^^^^^^^^


TypeError: Function has override specified but does not override anything.
   --> contracts/GasToken.sol:140:61:
    |
140 |     function balanceOf(address account) public view virtual override returns (uint256) {
    |                                                             ^^^^^^^^


TypeError: Function has override specified but does not override anything.
   --> contracts/GasToken.sol:152:73:
    |
152 |     function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
    |                                                                         ^^^^^^^^


TypeError: Function has override specified but does not override anything.
   --> contracts/GasToken.sol:160:76:
    |
160 |     function allowance(address owner, address spender) public view virtual override returns (uint256) {
    |                                                                            ^^^^^^^^


TypeError: Function has override specified but does not override anything.
   --> contracts/GasToken.sol:171:70:
    |
171 |     function approve(address spender, uint256 amount) public virtual override returns (bool) {
    |                                                                      ^^^^^^^^


TypeError: Function has override specified but does not override anything.
   --> contracts/GasToken.sol:179:93:
    |
179 |     function transferFrom(address sender, address recipient, uint256 amount) public virtual override returns (bool) {
    |                                                                                             ^^^^^^^^


Error HH600: Compilation failed

For more info go to https://hardhat.org/HH600 or run Hardhat with --show-stack-traces
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % yarn compile
yarn run v1.22.19
$ npx hardhat compile
Solidity 0.8.19 is not fully supported yet. You can still use Hardhat, but some features, like stack traces, might not work correctly.

Learn more at https://hardhat.org/hardhat-runner/docs/reference/solidity-support

✖ Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y

Warning: SPDX license identifier not provided in source file. Before publishing, consider adding a comment containing "SPDX-License-Identifier: <SPDX-License>" to each source file. Use "SPDX-License-Identifier: UNLICENSED" for non-open-source code. Please see https://spdx.org for more information.
--> contracts/do_not_compile/BondingCurve.sol


TypeError: Construction control flow ends without initializing all immutable state variables.
   --> contracts/GasToken.sol:811:1:
    |
811 | contract GasToken is ERC20, Ownable, AccessControlEnumerable {
    | ^ (Relevant source part starts here and spans across multiple lines).
Note: Not initialized: 
   --> contracts/GasToken.sol:840:3:
    |
840 |   address public immutable uniswapV2Pair;
    |   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


Error HH600: Compilation failed

For more info go to https://hardhat.org/HH600 or run Hardhat with --show-stack-traces
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % yarn compile
yarn run v1.22.19
$ npx hardhat compile
Solidity 0.8.19 is not fully supported yet. You can still use Hardhat, but some features, like stack traces, might not work correctly.

Learn more at https://hardhat.org/hardhat-runner/docs/reference/solidity-support

✖ Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y

Warning: SPDX license identifier not provided in source file. Before publishing, consider adding a comment containing "SPDX-License-Identifier: <SPDX-License>" to each source file. Use "SPDX-License-Identifier: UNLICENSED" for non-open-source code. Please see https://spdx.org for more information.
--> contracts/do_not_compile/BondingCurve.sol


DeclarationError: Undeclared identifier.
    --> contracts/GasToken.sol:1055:39:
     |
1055 |         require(newAddress != address(uniswapV2Router), "The router already has that address");
     |                                       ^^^^^^^^^^^^^^^


DeclarationError: Undeclared identifier.
    --> contracts/GasToken.sol:1056:56:
     |
1056 |         emit UpdateUniswapV2Router(newAddress, address(uniswapV2Router));
     |                                                        ^^^^^^^^^^^^^^^


DeclarationError: Undeclared identifier.
    --> contracts/GasToken.sol:1057:9:
     |
1057 |         uniswapV2Router = IUniswapV2Router02(newAddress);
     |         ^^^^^^^^^^^^^^^


DeclarationError: Undeclared identifier. Did you mean "IUniswapV2Pair"?
    --> contracts/GasToken.sol:1077:25:
     |
1077 |         require(pair != uniswapV2Pair, "The PancakeSwap pair cannot be removed from automatedMarketMakerPairs");
     |                         ^^^^^^^^^^^^^


Error HH600: Compilation failed

For more info go to https://hardhat.org/HH600 or run Hardhat with --show-stack-traces
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % yarn compile
yarn run v1.22.19
$ npx hardhat compile
Solidity 0.8.19 is not fully supported yet. You can still use Hardhat, but some features, like stack traces, might not work correctly.

Learn more at https://hardhat.org/hardhat-runner/docs/reference/solidity-support

✖ Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y

Warning: SPDX license identifier not provided in source file. Before publishing, consider adding a comment containing "SPDX-License-Identifier: <SPDX-License>" to each source file. Use "SPDX-License-Identifier: UNLICENSED" for non-open-source code. Please see https://spdx.org for more information.
--> contracts/do_not_compile/BondingCurve.sol


Warning: Unnamed return variable can remain unassigned. Add an explicit return with value to all non-reverting code paths or name the variable.
   --> contracts/Bank.sol:141:54:
    |
141 |   function _Insert(address address_) private returns(uint256) {
    |                                                      ^^^^^^^


Warning: Unnamed return variable can remain unassigned. Add an explicit return with value to all non-reverting code paths or name the variable.
   --> contracts/Bank.sol:181:92:
    |
181 |   function InsertAt(address address_, address next_, address prev_) public payable returns(bool) {
    |                                                                                            ^^^^


Warning: Unnamed return variable can remain unassigned. Add an explicit return with value to all non-reverting code paths or name the variable.
   --> contracts/Bank.sol:273:65:
    |
273 |   function BurnPosition(uint256 amount_) public payable returns(bool) {
    |                                                                 ^^^^


Warning: Unused local variable.
   --> contracts/Bank.sol:144:5:
    |
144 |     uint256 CR_ = 10000 * position_.collateral / (position_.basefee * position_.debt); // divisor 10000
    |     ^^^^^^^^^^^


Warning: Unused local variable.
   --> contracts/Bank.sol:146:5:
    |
146 |     uint256 weight_ = 150 * dTotal * block.basefee / cTotal; // weight can be above 1 (significantly overcollateralized vault)
    |     ^^^^^^^^^^^^^^^


Warning: Unused local variable.
   --> contracts/Bank.sol:151:5:
    |
151 |     uint256 median_ = (headCR_ + tailCR_) / 2;
    |     ^^^^^^^^^^^^^^^


Warning: Unused function parameter. Remove or comment out the variable name to silence this warning.
   --> contracts/Bank.sol:181:54:
    |
181 |   function InsertAt(address address_, address next_, address prev_) public payable returns(bool) {
    |                                                      ^^^^^^^^^^^^^


Warning: Unused local variable.
   --> contracts/Bank.sol:183:5:
    |
183 |     position storage position_ = _positions[address_];
    |     ^^^^^^^^^^^^^^^^^^^^^^^^^^


Warning: Unused local variable.
   --> contracts/Bank.sol:281:5:
    |
281 |     bool success;
    |     ^^^^^^^^^^^^


Warning: Unused local variable.
   --> contracts/Bank.sol:282:5:
    |
282 |     bytes memory message;
    |     ^^^^^^^^^^^^^^^^^^^^


Warning: Unused local variable.
   --> contracts/Bank.sol:284:5:
    |
284 |     bytes memory payload = abi.encodeWithSignature("Withdraw(uint256)", value_);
    |     ^^^^^^^^^^^^^^^^^^^^


Warning: Function state mutability can be restricted to view
  --> contracts/Bank.sol:44:3:
   |
44 |   function getIndex(uint256 index_) private returns(uint256 node_) {
   |   ^ (Relevant source part starts here and spans across multiple lines).


Warning: Function state mutability can be restricted to view
   --> contracts/Bank.sol:141:3:
    |
141 |   function _Insert(address address_) private returns(uint256) {
    |   ^ (Relevant source part starts here and spans across multiple lines).


Compiled 24 Solidity files successfully
✨  Done in 17.09s.
charlestaylor@charless-Air eth-den-rgas-token % cls
zsh: command not found: cls
charlestaylor@charless-Air eth-den-rgas-token % clear

charlestaylor@charless-Air eth-den-rgas-token % yarn deploy
yarn run v1.22.19
error Command "deploy" not found.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % yarn deploy:testnet1clear
yarn run v1.22.19
error Command "deploy:testnet1clear" not found.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % clear













charlestaylor@charless-Air eth-den-rgas-token % yarn deploy
yarn run v1.22.19
$ deploy:testnet1 && deploy:testnet2 && deploy:testnet3 && deploy:testnet4 && deploy:testnet5
/bin/sh: deploy:testnet1: command not found
error Command failed with exit code 127.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % clear















charlestaylor@charless-Air eth-den-rgas-token % yarn deploy:testnet1
yarn run v1.22.19
$ npx hardhat run --network sepoliaTestnet scripts/deploy.ts
✖ Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y

Deploying to sepoliaTestnet network...
Nothing to compile
Compiled contracts...
Deploying smart contracts to...sepoliaTestnet:
GasToken to 0xc87177D45cD32F4E5f01C8350ebe6a7Ba7bF9E33
Vault to 0x5084664d4Df38052d95aacDF5520a3666683722D
Arbitrage to 0x9Aa472581420e573e2302f104F3B8B0D7598e4e3
Treasury to 0x8BE1B9B05547595A18B9Ba869AF0685a16eb43A8
Bank to 0x2dc618CB3a6fF35F2AD415b2061ab4F25BaF488D
LiquidationEngine to 0x9dd3eBa7F38907ff1A43993A17182Da45815b6Ca
Verifying smart contracts on...sepoliaTestnet:
Nothing to compile
Successfully submitted source code for contract
contracts/GasToken.sol:GasToken at 0xc87177D45cD32F4E5f01C8350ebe6a7Ba7bF9E33
for verification on the block explorer. Waiting for verification result...

Successfully verified contract GasToken on Etherscan.
https://sepolia.etherscan.io/address/0xc87177D45cD32F4E5f01C8350ebe6a7Ba7bF9E33#code
Warning: SPDX license identifier not provided in source file. Before publishing, consider adding a comment containing "SPDX-License-Identifier: <SPDX-License>" to each source file. Use "SPDX-License-Identifier: UNLICENSED" for non-open-source code. Please see https://spdx.org for more information.
--> contracts/do_not_compile/BondingCurve.sol


Warning: Unnamed return variable can remain unassigned. Add an explicit return with value to all non-reverting code paths or name the variable.
   --> contracts/Bank.sol:141:54:
    |
141 |   function _Insert(address address_) private returns(uint256) {
    |                                                      ^^^^^^^


Warning: Unnamed return variable can remain unassigned. Add an explicit return with value to all non-reverting code paths or name the variable.
   --> contracts/Bank.sol:181:92:
    |
181 |   function InsertAt(address address_, address next_, address prev_) public payable returns(bool) {
    |                                                                                            ^^^^


Warning: Unnamed return variable can remain unassigned. Add an explicit return with value to all non-reverting code paths or name the variable.
   --> contracts/Bank.sol:273:65:
    |
273 |   function BurnPosition(uint256 amount_) public payable returns(bool) {
    |                                                                 ^^^^


Warning: Unused local variable.
   --> contracts/Bank.sol:144:5:
    |
144 |     uint256 CR_ = 10000 * position_.collateral / (position_.basefee * position_.debt); // divisor 10000
    |     ^^^^^^^^^^^


Warning: Unused local variable.
   --> contracts/Bank.sol:146:5:
    |
146 |     uint256 weight_ = 150 * dTotal * block.basefee / cTotal; // weight can be above 1 (significantly overcollateralized vault)
    |     ^^^^^^^^^^^^^^^


Warning: Unused local variable.
   --> contracts/Bank.sol:151:5:
    |
151 |     uint256 median_ = (headCR_ + tailCR_) / 2;
    |     ^^^^^^^^^^^^^^^


Warning: Unused function parameter. Remove or comment out the variable name to silence this warning.
   --> contracts/Bank.sol:181:54:
    |
181 |   function InsertAt(address address_, address next_, address prev_) public payable returns(bool) {
    |                                                      ^^^^^^^^^^^^^


Warning: Unused local variable.
   --> contracts/Bank.sol:183:5:
    |
183 |     position storage position_ = _positions[address_];
    |     ^^^^^^^^^^^^^^^^^^^^^^^^^^


Warning: Unused local variable.
   --> contracts/Bank.sol:281:5:
    |
281 |     bool success;
    |     ^^^^^^^^^^^^


Warning: Unused local variable.
   --> contracts/Bank.sol:282:5:
    |
282 |     bytes memory message;
    |     ^^^^^^^^^^^^^^^^^^^^


Warning: Unused local variable.
   --> contracts/Bank.sol:284:5:
    |
284 |     bytes memory payload = abi.encodeWithSignature("Withdraw(uint256)", value_);
    |     ^^^^^^^^^^^^^^^^^^^^


Warning: Function state mutability can be restricted to view
  --> contracts/Bank.sol:44:3:
   |
44 |   function getIndex(uint256 index_) private returns(uint256 node_) {
   |   ^ (Relevant source part starts here and spans across multiple lines).


Warning: Function state mutability can be restricted to view
   --> contracts/Bank.sol:141:3:
    |
141 |   function _Insert(address address_) private returns(uint256) {
    |   ^ (Relevant source part starts here and spans across multiple lines).


Compiled 24 Solidity files successfully
Successfully submitted source code for contract
contracts/Vault.sol:Vault at 0x5084664d4Df38052d95aacDF5520a3666683722D
for verification on the block explorer. Waiting for verification result...

Successfully verified contract Vault on Etherscan.
https://sepolia.etherscan.io/address/0x5084664d4Df38052d95aacDF5520a3666683722D#code
Nothing to compile
Successfully submitted source code for contract
contracts/Arbitrage.sol:Arbitrage at 0x9Aa472581420e573e2302f104F3B8B0D7598e4e3
for verification on the block explorer. Waiting for verification result...

Successfully verified contract Arbitrage on Etherscan.
https://sepolia.etherscan.io/address/0x9Aa472581420e573e2302f104F3B8B0D7598e4e3#code
Nothing to compile
Successfully submitted source code for contract
contracts/Treasury.sol:Treasury at 0x8BE1B9B05547595A18B9Ba869AF0685a16eb43A8
for verification on the block explorer. Waiting for verification result...

Successfully verified contract Treasury on Etherscan.
https://sepolia.etherscan.io/address/0x8BE1B9B05547595A18B9Ba869AF0685a16eb43A8#code
Nothing to compile
Warning: Unnamed return variable can remain unassigned. Add an explicit return with value to all non-reverting code paths or name the variable.
   --> contracts/Bank.sol:141:54:
    |
141 |   function _Insert(address address_) private returns(uint256) {
    |                                                      ^^^^^^^


Warning: Unnamed return variable can remain unassigned. Add an explicit return with value to all non-reverting code paths or name the variable.
   --> contracts/Bank.sol:181:92:
    |
181 |   function InsertAt(address address_, address next_, address prev_) public payable returns(bool) {
    |                                                                                            ^^^^


Warning: Unnamed return variable can remain unassigned. Add an explicit return with value to all non-reverting code paths or name the variable.
   --> contracts/Bank.sol:273:65:
    |
273 |   function BurnPosition(uint256 amount_) public payable returns(bool) {
    |                                                                 ^^^^


Warning: Unused local variable.
   --> contracts/Bank.sol:144:5:
    |
144 |     uint256 CR_ = 10000 * position_.collateral / (position_.basefee * position_.debt); // divisor 10000
    |     ^^^^^^^^^^^


Warning: Unused local variable.
   --> contracts/Bank.sol:146:5:
    |
146 |     uint256 weight_ = 150 * dTotal * block.basefee / cTotal; // weight can be above 1 (significantly overcollateralized vault)
    |     ^^^^^^^^^^^^^^^


Warning: Unused local variable.
   --> contracts/Bank.sol:151:5:
    |
151 |     uint256 median_ = (headCR_ + tailCR_) / 2;
    |     ^^^^^^^^^^^^^^^


Warning: Unused function parameter. Remove or comment out the variable name to silence this warning.
   --> contracts/Bank.sol:181:54:
    |
181 |   function InsertAt(address address_, address next_, address prev_) public payable returns(bool) {
    |                                                      ^^^^^^^^^^^^^


Warning: Unused local variable.
   --> contracts/Bank.sol:183:5:
    |
183 |     position storage position_ = _positions[address_];
    |     ^^^^^^^^^^^^^^^^^^^^^^^^^^


Warning: Unused local variable.
   --> contracts/Bank.sol:281:5:
    |
281 |     bool success;
    |     ^^^^^^^^^^^^


Warning: Unused local variable.
   --> contracts/Bank.sol:282:5:
    |
282 |     bytes memory message;
    |     ^^^^^^^^^^^^^^^^^^^^


Warning: Unused local variable.
   --> contracts/Bank.sol:284:5:
    |
284 |     bytes memory payload = abi.encodeWithSignature("Withdraw(uint256)", value_);
    |     ^^^^^^^^^^^^^^^^^^^^


Warning: Function state mutability can be restricted to view
  --> contracts/Bank.sol:44:3:
   |
44 |   function getIndex(uint256 index_) private returns(uint256 node_) {
   |   ^ (Relevant source part starts here and spans across multiple lines).


Warning: Function state mutability can be restricted to view
   --> contracts/Bank.sol:141:3:
    |
141 |   function _Insert(address address_) private returns(uint256) {
    |   ^ (Relevant source part starts here and spans across multiple lines).


Successfully submitted source code for contract
contracts/Bank.sol:Bank at 0x2dc618CB3a6fF35F2AD415b2061ab4F25BaF488D
for verification on the block explorer. Waiting for verification result...

Successfully verified contract Bank on Etherscan.
https://sepolia.etherscan.io/address/0x2dc618CB3a6fF35F2AD415b2061ab4F25BaF488D#code
Nothing to compile
Successfully submitted source code for contract
contracts/LiquidationEngine.sol:LiquidationEngine at 0x9dd3eBa7F38907ff1A43993A17182Da45815b6Ca
for verification on the block explorer. Waiting for verification result...

Successfully verified contract LiquidationEngine on Etherscan.
https://sepolia.etherscan.io/address/0x9dd3eBa7F38907ff1A43993A17182Da45815b6Ca#code
✨  Done in 183.00s.
charlestaylor@charless-Air eth-den-rgas-token % clear

charlestaylor@charless-Air eth-den-rgas-token % yarn deploy:testnet2
yarn run v1.22.19
$ npx hardhat run --network scrollTestnet scripts/deploy.ts
✖ Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y

Warning: SPDX license identifier not provided in source file. Before publishing, consider adding a comment containing "SPDX-License-Identifier: <SPDX-License>" to each source file. Use "SPDX-License-Identifier: UNLICENSED" for non-open-source code. Please see https://spdx.org for more information.
--> contracts/do_not_compile/BondingCurve.sol


Warning: Unnamed return variable can remain unassigned. Add an explicit return with value to all non-reverting code paths or name the variable.
   --> contracts/Bank.sol:141:54:
    |
141 |   function _Insert(address address_) private returns(uint256) {
    |                                                      ^^^^^^^


Warning: Unnamed return variable can remain unassigned. Add an explicit return with value to all non-reverting code paths or name the variable.
   --> contracts/Bank.sol:181:92:
    |
181 |   function InsertAt(address address_, address next_, address prev_) public payable returns(bool) {
    |                                                                                            ^^^^


Warning: Unnamed return variable can remain unassigned. Add an explicit return with value to all non-reverting code paths or name the variable.
   --> contracts/Bank.sol:273:65:
    |
273 |   function BurnPosition(uint256 amount_) public payable returns(bool) {
    |                                                                 ^^^^


Warning: Unused local variable.
   --> contracts/Bank.sol:144:5:
    |
144 |     uint256 CR_ = 10000 * position_.collateral / (position_.basefee * position_.debt); // divisor 10000
    |     ^^^^^^^^^^^


Warning: Unused local variable.
   --> contracts/Bank.sol:146:5:
    |
146 |     uint256 weight_ = 150 * dTotal * block.basefee / cTotal; // weight can be above 1 (significantly overcollateralized vault)
    |     ^^^^^^^^^^^^^^^


Warning: Unused local variable.
   --> contracts/Bank.sol:151:5:
    |
151 |     uint256 median_ = (headCR_ + tailCR_) / 2;
    |     ^^^^^^^^^^^^^^^


Warning: Unused function parameter. Remove or comment out the variable name to silence this warning.
   --> contracts/Bank.sol:181:54:
    |
181 |   function InsertAt(address address_, address next_, address prev_) public payable returns(bool) {
    |                                                      ^^^^^^^^^^^^^


Warning: Unused local variable.
   --> contracts/Bank.sol:183:5:
    |
183 |     position storage position_ = _positions[address_];
    |     ^^^^^^^^^^^^^^^^^^^^^^^^^^


Warning: Unused local variable.
   --> contracts/Bank.sol:281:5:
    |
281 |     bool success;
    |     ^^^^^^^^^^^^


Warning: Unused local variable.
   --> contracts/Bank.sol:282:5:
    |
282 |     bytes memory message;
    |     ^^^^^^^^^^^^^^^^^^^^


Warning: Unused local variable.
   --> contracts/Bank.sol:284:5:
    |
284 |     bytes memory payload = abi.encodeWithSignature("Withdraw(uint256)", value_);
    |     ^^^^^^^^^^^^^^^^^^^^


Warning: Function state mutability can be restricted to view
  --> contracts/Bank.sol:44:3:
   |
44 |   function getIndex(uint256 index_) private returns(uint256 node_) {
   |   ^ (Relevant source part starts here and spans across multiple lines).


Warning: Function state mutability can be restricted to view
   --> contracts/Bank.sol:141:3:
    |
141 |   function _Insert(address address_) private returns(uint256) {
    |   ^ (Relevant source part starts here and spans across multiple lines).


Compiled 24 Solidity files successfully
Deploying to scrollTestnet network...
Nothing to compile
Compiled contracts...
Deploying smart contracts to...scrollTestnet:
Error: insufficient funds for intrinsic transaction cost [ See: https://links.ethers.org/v5-errors-INSUFFICIENT_FUNDS ] (error={"name":"ProviderError","_stack":"ProviderError: HttpProviderError\n    at HttpProvider.request (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/providers/http.ts:83:19)\n    at LocalAccountsProvider.request (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/providers/accounts.ts:187:34)\n    at processTicksAndRejections (node:internal/process/task_queues:95:5)\n    at async EthersProviderWrapper.send (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@nomiclabs/hardhat-ethers/src/internal/ethers-provider-wrapper.ts:13:20)","code":-32000,"_isProviderError":true}, method="estimateGas", transaction={"from":"0x1C77905fEAfD85f7fdeD7aD5f871F93C2B11dcfF","data":"0x6080604052600b8054600163ffffff0160a01b03191661dead17905560826017553480156200002d57600080fd5b506040518060400160405280600c81526020016b28a49023b0b9902a37b5b2b760a11b81525060405180604001604052806002815260200161514960f01b81525081600390816200007f9190620005d5565b5060046200008e8282620005d5565b50506005805460ff1916601217905550620000b0620000aa3390565b62000186565b620000bd600033620001e0565b620000e97f9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a633620001e0565b600c80546001600160a01b03191673bd4eafe5215830399a9a30ba588fbe41800146399081179091556200011f906001620001f0565b6200012c306001620001f0565b620001506200014860055461010090046001600160a01b031690565b6001620001f0565b620001806200016c60055461010090046001600160a01b031690565b6c01431e0fae6d7217caa0000000620002db565b620006c3565b600580546001600160a01b03838116610100818102610100600160a81b031985161790945560405193909204169182907f8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e090600090a35050565b620001ec82826200038c565b5050565b620001fa620003b7565b6001600160a01b03821660009081526019602052604090205481151560ff9091161515036200027c5760405162461bcd60e51b8152602060048201526024808201527f4163636f756e7420697320616c72656164792065786c756465642066726f6d206044820152636665657360e01b60648201526084015b60405180910390fd5b6001600160a01b038216600081815260196020908152604091829020805460ff191685151590811790915591519182527f9d8f7706ea1113d1a167b526eca956215946dd36cc7df39eb16180222d8b5df7910160405180910390a25050565b6001600160a01b038216620003335760405162461bcd60e51b815260206004820152601f60248201527f45524332303a206d696e7420746f20746865207a65726f206164647265737300604482015260640162000273565b80600254620003439190620006a1565b6002556001600160a01b0382166000908152602081905260409020546200036c908290620006a1565b6001600160a01b0390921660009081526020819052604090209190915550565b6200039882826200041b565b6000828152600760205260409020620003b29082620004bf565b505050565b6005546001600160a01b03610100909104163314620004195760405162461bcd60e51b815260206004820181905260248201527f4f776e61626c653a2063616c6c6572206973206e6f7420746865206f776e6572604482015260640162000273565b565b60008281526006602090815260408083206001600160a01b038516845290915290205460ff16620001ec5760008281526006602090815260408083206001600160a01b03851684529091529020805460ff191660011790556200047b3390565b6001600160a01b0316816001600160a01b0316837f2f8788117e7eff1d82e926ec794901d17c78024a50270940304540a733656f0d60405160405180910390a45050565b6000620004d6836001600160a01b038416620004df565b90505b92915050565b60008181526001830160205260408120546200052857508154600181810184556000848152602080822090930184905584548482528286019093526040902091909155620004d9565b506000620004d9565b634e487b7160e01b600052604160045260246000fd5b600181811c908216806200055c57607f821691505b6020821081036200057d57634e487b7160e01b600052602260045260246000fd5b50919050565b601f821115620003b257600081815260208120601f850160051c81016020861015620005ac5750805b601f850160051c820191505b81811015620005cd57828155600101620005b8565b505050505050565b81516001600160401b03811115620005f157620005f162000531565b620006098162000602845462000547565b8462000583565b602080601f831160018114620006415760008415620006285750858301515b600019600386901b1c1916600185901b178555620005cd565b600085815260208120601f198616915b82811015620006725788860151825594840194600190910190840162000651565b5085821015620006915787850151600019600388901b60f8161c191681555b5050505050600190811b01905550565b80820180821115620004d957634e487b7160e01b600052601160045260246000fd5b61246f80620006d36000396000f3fe6080604052600436106103c75760003560e01c806391d14854116101f2578063b90306ad1161010d578063d547741f116100a0578063e6c75f711161006f578063e6c75f7114610ba4578063e84d44f814610bba578063f2fde38b14610bdb578063fb7f634a14610bfb576103ce565b8063d547741f14610b08578063dd62ed3e14610b28578063e27ad5eb14610b6e578063e2f4560514610b8e576103ce565b8063ca15c873116100dc578063ca15c87314610a74578063cf8f19bf14610a94578063d46d9ba114610ab4578063d539139314610ad4576103ce565b8063b90306ad146109fe578063c024666814610a1e578063c492f04614610a3e578063c9b4c06314610a5e576103ce565b8063a336d8c311610185578063aacebbe311610154578063aacebbe31461096e578063afa4f3b21461098e578063b3b5e043146109ae578063b62496f5146109ce576103ce565b8063a336d8c3146108f8578063a457c2d714610918578063a6b6388814610938578063a9059cbb1461094e576103ce565b8063980f02fe116101c1578063980f02fe146108835780639f34a5b4146108a3578063a06d8fc7146108c3578063a217fddf146108e3576103ce565b806391d14854146108225780639466125f14610842578063955ebc9e1461085857806395d89b411461086e576103ce565b80632f2ff15d116102e25780636b67c4df116102755780637b16cea0116102445780637b16cea0146107705780638942dd84146107a95780638da5cb5b146107df5780639010d07c14610802576103ce565b80636b67c4df146106ef57806370a0823114610705578063715018a61461073b57806375f0a87414610750576103ce565b80633935bac6116102b15780633935bac61461067957806339509351146106995780635c38ffe2146106b95780635fd65fea146106d9576103ce565b80632f2ff15d146105f6578063313ce5671461061657806336568abe146106385780633884f36414610658576103ce565b8063122fe6851161035a57806323b872dd1161032957806323b872dd14610566578063248a9ca314610586578063263b5fcb146105b657806327c8f835146105d6576103ce565b8063122fe685146104ed57806313114a9d1461052557806318160ddd1461053b57806322bd3f7f14610550576103ce565b8063095ea7b311610396578063095ea7b31461046c57806309c58fcd1461048c57806310f58246146104ad5780631129e65b146104cd576103ce565b806301ffc9a7146103dc57806302259e9e1461041157806306fdde031461043557806307efbfdc14610457576103ce565b366103ce57005b3480156103da57600080fd5b005b3480156103e857600080fd5b506103fc6103f7366004611f50565b610c1b565b60405190151581526020015b60405180910390f35b34801561041d57600080fd5b50610427600f5481565b604051908152602001610408565b34801561044157600080fd5b5061044a610c46565b6040516104089190611f9e565b34801561046357600080fd5b506103da610cd8565b34801561047857600080fd5b506103fc610487366004611fed565b610d3c565b34801561049857600080fd5b50600b546103fc90600160a81b900460ff1681565b3480156104b957600080fd5b506103da6104c8366004612017565b610d52565b3480156104d957600080fd5b506103da6104e8366004612017565b610d99565b3480156104f957600080fd5b5060185461050d906001600160a01b031681565b6040516001600160a01b039091168152602001610408565b34801561053157600080fd5b5061042760165481565b34801561054757600080fd5b50600254610427565b34801561055c57600080fd5b5061042760175481565b34801561057257600080fd5b506103fc610581366004612032565b610dac565b34801561059257600080fd5b506104276105a136600461206e565b60009081526006602052604090206001015490565b3480156105c257600080fd5b506103da6105d1366004612097565b610e15565b3480156105e257600080fd5b50600b5461050d906001600160a01b031681565b34801561060257600080fd5b506103da6106113660046120b2565b610f1d565b34801561062257600080fd5b5060055460405160ff9091168152602001610408565b34801561064457600080fd5b506103da6106533660046120b2565b610f47565b34801561066457600080fd5b50600b546103fc90600160b81b900460ff1681565b34801561068557600080fd5b506103da610694366004612017565b610fc5565b3480156106a557600080fd5b506103fc6106b4366004611fed565b610ffa565b3480156106c557600080fd5b506103da6106d436600461206e565b611031565b3480156106e557600080fd5b5061042760135481565b3480156106fb57600080fd5b5061042760125481565b34801561071157600080fd5b50610427610720366004612017565b6001600160a01b031660009081526020819052604090205490565b34801561074757600080fd5b506103da611051565b34801561075c57600080fd5b50600c5461050d906001600160a01b031681565b34801561077c57600080fd5b506103fc61078b366004612017565b6001600160a01b031660009081526019602052604090205460ff1690565b3480156107b557600080fd5b5060098054600a80544882821b81019092556103ff60f01b16909103019081905560199004600855005b3480156107eb57600080fd5b5060055461010090046001600160a01b031661050d565b34801561080e57600080fd5b5061050d61081d3660046120de565b611065565b34801561082e57600080fd5b506103fc61083d3660046120b2565b611084565b34801561084e57600080fd5b5061042760085481565b34801561086457600080fd5b5061042760145481565b34801561087a57600080fd5b5061044a6110af565b34801561088f57600080fd5b506103da61089e366004612100565b6110be565b3480156108af57600080fd5b506103da6108be36600461206e565b611130565b3480156108cf57600080fd5b506103da6108de366004612017565b611150565b3480156108ef57600080fd5b50610427600081565b34801561090457600080fd5b50600d5461050d906001600160a01b031681565b34801561092457600080fd5b506103fc610933366004611fed565b611185565b34801561094457600080fd5b50610427600e5481565b34801561095a57600080fd5b506103fc610969366004611fed565b6111d4565b34801561097a57600080fd5b506103da610989366004612017565b6111e1565b34801561099a57600080fd5b506103da6109a936600461206e565b6112c3565b3480156109ba57600080fd5b506103da6109c936600461206e565b6112e3565b3480156109da57600080fd5b506103fc6109e9366004612017565b601a6020526000908152604090205460ff1681565b348015610a0a57600080fd5b506103da610a1936600461206e565b611303565b348015610a2a57600080fd5b506103da610a39366004612123565b61130f565b348015610a4a57600080fd5b506103da610a5936600461214d565b6113f2565b348015610a6a57600080fd5b5061042760155481565b348015610a8057600080fd5b50610427610a8f36600461206e565b6114ac565b348015610aa057600080fd5b506103da610aaf366004612097565b6114c3565b348015610ac057600080fd5b506103da610acf366004612100565b6115bf565b348015610ae057600080fd5b506104277f9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a681565b348015610b1457600080fd5b506103da610b233660046120b2565b61162b565b348015610b3457600080fd5b50610427610b433660046121d1565b6001600160a01b03918216600090815260016020908152604080832093909416825291909152205490565b348015610b7a57600080fd5b506103da610b89366004612097565b611650565b348015610b9a57600080fd5b5061042760105481565b348015610bb057600080fd5b5061042760115481565b348015610bc657600080fd5b50600b546103fc90600160b01b900460ff1681565b348015610be757600080fd5b506103da610bf6366004612017565b611676565b348015610c0757600080fd5b506103da610c1636600461206e565b6116ec565b60006001600160e01b03198216635a05180f60e01b1480610c405750610c40826116f9565b92915050565b606060038054610c55906121fb565b80601f0160208091040260200160405190810160405280929190818152602001828054610c81906121fb565b8015610cce5780601f10610ca357610100808354040283529160200191610cce565b820191906000526020600020905b815481529060010190602001808311610cb157829003601f168201915b5050505050905090565b610ce061172e565b60056012556002601455600f6016819055600b805461ffff60b01b191661010160b01b1790556a108b2a2c280290940000006010556c01431e0fae6d7217caa0000000600e8190556af8277896582678ac000000909155601155565b6000610d4933848461178e565b50600192915050565b610d5a61172e565b600d54610d6f906001600160a01b0316610fc5565b600d80546001600160a01b0319166001600160a01b038316908117909155610d9690611150565b50565b610da161172e565b610d9681600161130f565b6000610db984848461187d565b610e0b8433610e06856040518060600160405280602881526020016123ed602891396001600160a01b038a16600090815260016020908152604080832033845290915290205491906119d1565b61178e565b5060019392505050565b610e1d61172e565b801515600b60169054906101000a900460ff16151503610e845760405162461bcd60e51b815260206004820152601d60248201527f43616e27742073657420666c616720746f2073616d652073746174757300000060448201526064015b60405180910390fd5b801515600003610eb5576012805460135560009055600b805460ff60b01b1916600160b01b83151502179055610ee4565b6013546012819055601454610ec99161224b565b601655600b805460ff60b01b1916600160b01b831515021790555b60405181151581527f6ba6c1012539169f5a820a29533d8c8b797a1c7a5634edbd3124a80de0e75cba906020015b60405180910390a150565b600082815260066020526040902060010154610f3881611a08565b610f428383611a12565b505050565b6001600160a01b0381163314610fb75760405162461bcd60e51b815260206004820152602f60248201527f416363657373436f6e74726f6c3a2063616e206f6e6c792072656e6f756e636560448201526e103937b632b9903337b91039b2b63360891b6064820152608401610e7b565b610fc18282611a34565b5050565b6000610fd081611a08565b610fc17f9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a683611a34565b3360008181526001602090815260408083206001600160a01b03871684529091528120549091610d49918590610e0690869061224b565b61103961172e565b61104b81670de0b6b3a764000061225e565b600f5550565b61105961172e565b6110636000611a56565b565b600082815260076020526040812061107d9083611ab0565b9392505050565b60009182526006602090815260408084206001600160a01b0393909316845291905290205460ff1690565b606060048054610c55906121fb565b6110c661172e565b60068160ff1611156111155760405162461bcd60e51b8152602060048201526018602482015277466565206d757374206265206c657373207468616e20362560401b6044820152606401610e7b565b60ff8116601481905560125461112a9161224b565b60165550565b61113861172e565b61114a81670de0b6b3a764000061225e565b60115550565b600061115b81611a08565b610fc17f9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a683611a12565b6000610d493384610e0685604051806060016040528060258152602001612415602591393360009081526001602090815260408083206001600160a01b038d16845290915290205491906119d1565b6000610d4933848461187d565b6111e961172e565b600c546001600160a01b039081169082160361125c5760405162461bcd60e51b815260206004820152602c60248201527f546865206d61726b6574696e672077616c6c657420697320616c72656164792060448201526b74686973206164647265737360a01b6064820152608401610e7b565b61126781600161130f565b600c546040516001600160a01b038084169216907f8616c7a330e3cf61290821331585511f1e2778171e2b005fb5ec60cfe874dc6790600090a3600c80546001600160a01b0319166001600160a01b0392909216919091179055565b6112cb61172e565b6112dd81670de0b6b3a764000061225e565b60105550565b6112eb61172e565b6112fd81670de0b6b3a764000061225e565b600e5550565b610fc132600083610dac565b61131761172e565b6001600160a01b03821660009081526019602052604090205481151560ff9091161515036113935760405162461bcd60e51b8152602060048201526024808201527f4163636f756e7420697320616c72656164792065786c756465642066726f6d206044820152636665657360e01b6064820152608401610e7b565b6001600160a01b038216600081815260196020908152604091829020805460ff191685151590811790915591519182527f9d8f7706ea1113d1a167b526eca956215946dd36cc7df39eb16180222d8b5df7910160405180910390a25050565b6113fa61172e565b60005b8281101561146b57816019600086868581811061141c5761141c612275565b90506020020160208101906114319190612017565b6001600160a01b031681526020810191909152604001600020805460ff1916911515919091179055806114638161228b565b9150506113fd565b507f7fdaf542373fa84f4ee8d662c642f44e4c2276a217d7d29e548b6eb29a233b3583838360405161149f939291906122a4565b60405180910390a1505050565b6000818152600760205260408120610c4090611abc565b6114cb61172e565b801515600b60179054906101000a900460ff1615150361152d5760405162461bcd60e51b815260206004820152601d60248201527f43616e27742073657420666c616720746f2073616d65207374617475730000006044820152606401610e7b565b80151560000361155e576014805460155560009055600b805460ff60b81b1916600160b81b8315150217905561158d565b60155460148190556012546115729161224b565b601655600b805460ff60b81b1916600160b81b831515021790555b60405181151581527feeddd25ab572944f46f2e1d17c56bb44594bdf0b4696199da23db34f0bcf9b9a90602001610f12565b6115c761172e565b60068160ff1611156116165760405162461bcd60e51b8152602060048201526018602482015277466565206d757374206265206c657373207468616e20362560401b6044820152606401610e7b565b60ff8116601281905560145461112a9161224b565b60008281526006602052604090206001015461164681611a08565b610f428383611a34565b61165861172e565b600b8054911515600160a81b0260ff60a81b19909216919091179055565b61167e61172e565b6001600160a01b0381166116e35760405162461bcd60e51b815260206004820152602660248201527f4f776e61626c653a206e6577206f776e657220697320746865207a65726f206160448201526564647265737360d01b6064820152608401610e7b565b610d9681611a56565b6116f461172e565b601755565b60006001600160e01b03198216637965db0b60e01b1480610c4057506301ffc9a760e01b6001600160e01b0319831614610c40565b6005546001600160a01b036101009091041633146110635760405162461bcd60e51b815260206004820181905260248201527f4f776e61626c653a2063616c6c6572206973206e6f7420746865206f776e65726044820152606401610e7b565b6001600160a01b0383166117f05760405162461bcd60e51b8152602060048201526024808201527f45524332303a20617070726f76652066726f6d20746865207a65726f206164646044820152637265737360e01b6064820152608401610e7b565b6001600160a01b0382166118515760405162461bcd60e51b815260206004820152602260248201527f45524332303a20617070726f766520746f20746865207a65726f206164647265604482015261737360f01b6064820152608401610e7b565b6001600160a01b0392831660009081526001602090815260408083209490951682529290925291902055565b6001600160a01b0383166118e15760405162461bcd60e51b815260206004820152602560248201527f45524332303a207472616e736665722066726f6d20746865207a65726f206164604482015264647265737360d81b6064820152608401610e7b565b6001600160a01b0382166119435760405162461bcd60e51b815260206004820152602360248201527f45524332303a207472616e7366657220746f20746865207a65726f206164647260448201526265737360e81b6064820152608401610e7b565b611980816040518060600160405280602681526020016123c7602691396001600160a01b03861660009081526020819052604090205491906119d1565b6001600160a01b0380851660009081526020819052604080822093909355908416815220546119b090829061224b565b6001600160a01b039092166000908152602081905260409020919091555050565b600081848411156119f55760405162461bcd60e51b8152600401610e7b9190611f9e565b50611a0083856122fb565b949350505050565b610d968133611ac6565b611a1c8282611b1f565b6000828152600760205260409020610f429082611ba5565b611a3e8282611bba565b6000828152600760205260409020610f429082611c21565b600580546001600160a01b03838116610100818102610100600160a81b031985161790945560405193909204169182907f8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e090600090a35050565b600061107d8383611c36565b6000610c40825490565b611ad08282611084565b610fc157611add81611c60565b611ae8836020611c72565b604051602001611af992919061230e565b60408051601f198184030181529082905262461bcd60e51b8252610e7b91600401611f9e565b611b298282611084565b610fc15760008281526006602090815260408083206001600160a01b03851684529091529020805460ff19166001179055611b613390565b6001600160a01b0316816001600160a01b0316837f2f8788117e7eff1d82e926ec794901d17c78024a50270940304540a733656f0d60405160405180910390a45050565b600061107d836001600160a01b038416611e0e565b611bc48282611084565b15610fc15760008281526006602090815260408083206001600160a01b0385168085529252808320805460ff1916905551339285917ff6391f5c32d9c69d2a47ea670b442974b53935d1edc7fd64eb21e047a839171b9190a45050565b600061107d836001600160a01b038416611e5d565b6000826000018281548110611c4d57611c4d612275565b9060005260206000200154905092915050565b6060610c406001600160a01b03831660145b60606000611c8183600261225e565b611c8c90600261224b565b67ffffffffffffffff811115611ca457611ca4612383565b6040519080825280601f01601f191660200182016040528015611cce576020820181803683370190505b509050600360fc1b81600081518110611ce957611ce9612275565b60200101906001600160f81b031916908160001a905350600f60fb1b81600181518110611d1857611d18612275565b60200101906001600160f81b031916908160001a9053506000611d3c84600261225e565b611d4790600161224b565b90505b6001811115611dbf576f181899199a1a9b1b9c1cb0b131b232b360811b85600f1660108110611d7b57611d7b612275565b1a60f81b828281518110611d9157611d91612275565b60200101906001600160f81b031916908160001a90535060049490941c93611db881612399565b9050611d4a565b50831561107d5760405162461bcd60e51b815260206004820181905260248201527f537472696e67733a20686578206c656e67746820696e73756666696369656e746044820152606401610e7b565b6000818152600183016020526040812054611e5557508154600181810184556000848152602080822090930184905584548482528286019093526040902091909155610c40565b506000610c40565b60008181526001830160205260408120548015611f46576000611e816001836122fb565b8554909150600090611e95906001906122fb565b9050818114611efa576000866000018281548110611eb557611eb5612275565b9060005260206000200154905080876000018481548110611ed857611ed8612275565b6000918252602080832090910192909255918252600188019052604090208390555b8554869080611f0b57611f0b6123b0565b600190038181906000526020600020016000905590558560010160008681526020019081526020016000206000905560019350505050610c40565b6000915050610c40565b600060208284031215611f6257600080fd5b81356001600160e01b03198116811461107d57600080fd5b60005b83811015611f95578181015183820152602001611f7d565b50506000910152565b6020815260008251806020840152611fbd816040850160208701611f7a565b601f01601f19169190910160400192915050565b80356001600160a01b0381168114611fe857600080fd5b919050565b6000806040838503121561200057600080fd5b61200983611fd1565b946020939093013593505050565b60006020828403121561202957600080fd5b61107d82611fd1565b60008060006060848603121561204757600080fd5b61205084611fd1565b925061205e60208501611fd1565b9150604084013590509250925092565b60006020828403121561208057600080fd5b5035919050565b80358015158114611fe857600080fd5b6000602082840312156120a957600080fd5b61107d82612087565b600080604083850312156120c557600080fd5b823591506120d560208401611fd1565b90509250929050565b600080604083850312156120f157600080fd5b50508035926020909101359150565b60006020828403121561211257600080fd5b813560ff8116811461107d57600080fd5b6000806040838503121561213657600080fd5b61213f83611fd1565b91506120d560208401612087565b60008060006040848603121561216257600080fd5b833567ffffffffffffffff8082111561217a57600080fd5b818601915086601f83011261218e57600080fd5b81358181111561219d57600080fd5b8760208260051b85010111156121b257600080fd5b6020928301955093506121c89186019050612087565b90509250925092565b600080604083850312156121e457600080fd5b6121ed83611fd1565b91506120d560208401611fd1565b600181811c9082168061220f57607f821691505b60208210810361222f57634e487b7160e01b600052602260045260246000fd5b50919050565b634e487b7160e01b600052601160045260246000fd5b80820180821115610c4057610c40612235565b8082028115828204841417610c4057610c40612235565b634e487b7160e01b600052603260045260246000fd5b60006001820161229d5761229d612235565b5060010190565b6040808252810183905260008460608301825b868110156122e5576001600160a01b036122d084611fd1565b168252602092830192909101906001016122b7565b5080925050508215156020830152949350505050565b81810381811115610c4057610c40612235565b7f416363657373436f6e74726f6c3a206163636f756e7420000000000000000000815260008351612346816017850160208801611f7a565b7001034b99036b4b9b9b4b733903937b6329607d1b6017918401918201528351612377816028840160208801611f7a565b01602801949350505050565b634e487b7160e01b600052604160045260246000fd5b6000816123a8576123a8612235565b506000190190565b634e487b7160e01b600052603160045260246000fdfe45524332303a207472616e7366657220616d6f756e7420657863656564732062616c616e636545524332303a207472616e7366657220616d6f756e74206578636565647320616c6c6f77616e636545524332303a2064656372656173656420616c6c6f77616e63652062656c6f77207a65726fa2646970667358221220415c00370705353257924026c35bbf774dd1fac49c77a7029328fa1702e0d6be64736f6c63430008130033","accessList":null}, code=INSUFFICIENT_FUNDS, version=providers/5.7.2)
    at Logger.makeError (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@ethersproject/logger/src.ts/index.ts:269:28)
    at Logger.throwError (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@ethersproject/logger/src.ts/index.ts:281:20)
    at checkError (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@ethersproject/providers/src.ts/json-rpc-provider.ts:98:16)
    at EthersProviderWrapper.<anonymous> (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@ethersproject/providers/src.ts/json-rpc-provider.ts:642:20)
    at step (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@ethersproject/providers/lib/json-rpc-provider.js:48:23)
    at Object.throw (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@ethersproject/providers/lib/json-rpc-provider.js:29:53)
    at rejected (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@ethersproject/providers/lib/json-rpc-provider.js:21:65)
    at processTicksAndRejections (node:internal/process/task_queues:95:5) {
  reason: 'insufficient funds for intrinsic transaction cost',
  code: 'INSUFFICIENT_FUNDS',
  error: ProviderError: HttpProviderError
      at HttpProvider.request (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/providers/http.ts:83:19)
      at LocalAccountsProvider.request (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/providers/accounts.ts:187:34)
      at processTicksAndRejections (node:internal/process/task_queues:95:5)
      at async EthersProviderWrapper.send (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@nomiclabs/hardhat-ethers/src/internal/ethers-provider-wrapper.ts:13:20),
  method: 'estimateGas',
  transaction: {
    from: '0x1C77905fEAfD85f7fdeD7aD5f871F93C2B11dcfF',
    data: '0x6080604052600b8054600163ffffff0160a01b03191661dead17905560826017553480156200002d57600080fd5b506040518060400160405280600c81526020016b28a49023b0b9902a37b5b2b760a11b81525060405180604001604052806002815260200161514960f01b81525081600390816200007f9190620005d5565b5060046200008e8282620005d5565b50506005805460ff1916601217905550620000b0620000aa3390565b62000186565b620000bd600033620001e0565b620000e97f9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a633620001e0565b600c80546001600160a01b03191673bd4eafe5215830399a9a30ba588fbe41800146399081179091556200011f906001620001f0565b6200012c306001620001f0565b620001506200014860055461010090046001600160a01b031690565b6001620001f0565b620001806200016c60055461010090046001600160a01b031690565b6c01431e0fae6d7217caa0000000620002db565b620006c3565b600580546001600160a01b03838116610100818102610100600160a81b031985161790945560405193909204169182907f8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e090600090a35050565b620001ec82826200038c565b5050565b620001fa620003b7565b6001600160a01b03821660009081526019602052604090205481151560ff9091161515036200027c5760405162461bcd60e51b8152602060048201526024808201527f4163636f756e7420697320616c72656164792065786c756465642066726f6d206044820152636665657360e01b60648201526084015b60405180910390fd5b6001600160a01b038216600081815260196020908152604091829020805460ff191685151590811790915591519182527f9d8f7706ea1113d1a167b526eca956215946dd36cc7df39eb16180222d8b5df7910160405180910390a25050565b6001600160a01b038216620003335760405162461bcd60e51b815260206004820152601f60248201527f45524332303a206d696e7420746f20746865207a65726f206164647265737300604482015260640162000273565b80600254620003439190620006a1565b6002556001600160a01b0382166000908152602081905260409020546200036c908290620006a1565b6001600160a01b0390921660009081526020819052604090209190915550565b6200039882826200041b565b6000828152600760205260409020620003b29082620004bf565b505050565b6005546001600160a01b03610100909104163314620004195760405162461bcd60e51b815260206004820181905260248201527f4f776e61626c653a2063616c6c6572206973206e6f7420746865206f776e6572604482015260640162000273565b565b60008281526006602090815260408083206001600160a01b038516845290915290205460ff16620001ec5760008281526006602090815260408083206001600160a01b03851684529091529020805460ff191660011790556200047b3390565b6001600160a01b0316816001600160a01b0316837f2f8788117e7eff1d82e926ec794901d17c78024a50270940304540a733656f0d60405160405180910390a45050565b6000620004d6836001600160a01b038416620004df565b90505b92915050565b60008181526001830160205260408120546200052857508154600181810184556000848152602080822090930184905584548482528286019093526040902091909155620004d9565b506000620004d9565b634e487b7160e01b600052604160045260246000fd5b600181811c908216806200055c57607f821691505b6020821081036200057d57634e487b7160e01b600052602260045260246000fd5b50919050565b601f821115620003b257600081815260208120601f850160051c81016020861015620005ac5750805b601f850160051c820191505b81811015620005cd57828155600101620005b8565b505050505050565b81516001600160401b03811115620005f157620005f162000531565b620006098162000602845462000547565b8462000583565b602080601f831160018114620006415760008415620006285750858301515b600019600386901b1c1916600185901b178555620005cd565b600085815260208120601f198616915b82811015620006725788860151825594840194600190910190840162000651565b5085821015620006915787850151600019600388901b60f8161c191681555b5050505050600190811b01905550565b80820180821115620004d957634e487b7160e01b600052601160045260246000fd5b61246f80620006d36000396000f3fe6080604052600436106103c75760003560e01c806391d14854116101f2578063b90306ad1161010d578063d547741f116100a0578063e6c75f711161006f578063e6c75f7114610ba4578063e84d44f814610bba578063f2fde38b14610bdb578063fb7f634a14610bfb576103ce565b8063d547741f14610b08578063dd62ed3e14610b28578063e27ad5eb14610b6e578063e2f4560514610b8e576103ce565b8063ca15c873116100dc578063ca15c87314610a74578063cf8f19bf14610a94578063d46d9ba114610ab4578063d539139314610ad4576103ce565b8063b90306ad146109fe578063c024666814610a1e578063c492f04614610a3e578063c9b4c06314610a5e576103ce565b8063a336d8c311610185578063aacebbe311610154578063aacebbe31461096e578063afa4f3b21461098e578063b3b5e043146109ae578063b62496f5146109ce576103ce565b8063a336d8c3146108f8578063a457c2d714610918578063a6b6388814610938578063a9059cbb1461094e576103ce565b8063980f02fe116101c1578063980f02fe146108835780639f34a5b4146108a3578063a06d8fc7146108c3578063a217fddf146108e3576103ce565b806391d14854146108225780639466125f14610842578063955ebc9e1461085857806395d89b411461086e576103ce565b80632f2ff15d116102e25780636b67c4df116102755780637b16cea0116102445780637b16cea0146107705780638942dd84146107a95780638da5cb5b146107df5780639010d07c14610802576103ce565b80636b67c4df146106ef57806370a0823114610705578063715018a61461073b57806375f0a87414610750576103ce565b80633935bac6116102b15780633935bac61461067957806339509351146106995780635c38ffe2146106b95780635fd65fea146106d9576103ce565b80632f2ff15d146105f6578063313ce5671461061657806336568abe146106385780633884f36414610658576103ce565b8063122fe6851161035a57806323b872dd1161032957806323b872dd14610566578063248a9ca314610586578063263b5fcb146105b657806327c8f835146105d6576103ce565b8063122fe685146104ed57806313114a9d1461052557806318160ddd1461053b57806322bd3f7f14610550576103ce565b8063095ea7b311610396578063095ea7b31461046c57806309c58fcd1461048c57806310f58246146104ad5780631129e65b146104cd576103ce565b806301ffc9a7146103dc57806302259e9e1461041157806306fdde031461043557806307efbfdc14610457576103ce565b366103ce57005b3480156103da57600080fd5b005b3480156103e857600080fd5b506103fc6103f7366004611f50565b610c1b565b60405190151581526020015b60405180910390f35b34801561041d57600080fd5b50610427600f5481565b604051908152602001610408565b34801561044157600080fd5b5061044a610c46565b6040516104089190611f9e565b34801561046357600080fd5b506103da610cd8565b34801561047857600080fd5b506103fc610487366004611fed565b610d3c565b34801561049857600080fd5b50600b546103fc90600160a81b900460ff1681565b3480156104b957600080fd5b506103da6104c8366004612017565b610d52565b3480156104d957600080fd5b506103da6104e8366004612017565b610d99565b3480156104f957600080fd5b5060185461050d906001600160a01b031681565b6040516001600160a01b039091168152602001610408565b34801561053157600080fd5b5061042760165481565b34801561054757600080fd5b50600254610427565b34801561055c57600080fd5b5061042760175481565b34801561057257600080fd5b506103fc610581366004612032565b610dac565b34801561059257600080fd5b506104276105a136600461206e565b60009081526006602052604090206001015490565b3480156105c257600080fd5b506103da6105d1366004612097565b610e15565b3480156105e257600080fd5b50600b5461050d906001600160a01b031681565b34801561060257600080fd5b506103da6106113660046120b2565b610f1d565b34801561062257600080fd5b5060055460405160ff9091168152602001610408565b34801561064457600080fd5b506103da6106533660046120b2565b610f47565b34801561066457600080fd5b50600b546103fc90600160b81b900460ff1681565b34801561068557600080fd5b506103da610694366004612017565b610fc5565b3480156106a557600080fd5b506103fc6106b4366004611fed565b610ffa565b3480156106c557600080fd5b506103da6106d436600461206e565b611031565b3480156106e557600080fd5b5061042760135481565b3480156106fb57600080fd5b5061042760125481565b34801561071157600080fd5b50610427610720366004612017565b6001600160a01b031660009081526020819052604090205490565b34801561074757600080fd5b506103da611051565b34801561075c57600080fd5b50600c5461050d906001600160a01b031681565b34801561077c57600080fd5b506103fc61078b366004612017565b6001600160a01b031660009081526019602052604090205460ff1690565b3480156107b557600080fd5b5060098054600a80544882821b81019092556103ff60f01b16909103019081905560199004600855005b3480156107eb57600080fd5b5060055461010090046001600160a01b031661050d565b34801561080e57600080fd5b5061050d61081d3660046120de565b611065565b34801561082e57600080fd5b506103fc61083d3660046120b2565b611084565b34801561084e57600080fd5b5061042760085481565b34801561086457600080fd5b5061042760145481565b34801561087a57600080fd5b5061044a6110af565b34801561088f57600080fd5b506103da61089e366004612100565b6110be565b3480156108af57600080fd5b506103da6108be36600461206e565b611130565b3480156108cf57600080fd5b506103da6108de366004612017565b611150565b3480156108ef57600080fd5b50610427600081565b34801561090457600080fd5b50600d5461050d906001600160a01b031681565b34801561092457600080fd5b506103fc610933366004611fed565b611185565b34801561094457600080fd5b50610427600e5481565b34801561095a57600080fd5b506103fc610969366004611fed565b6111d4565b34801561097a57600080fd5b506103da610989366004612017565b6111e1565b34801561099a57600080fd5b506103da6109a936600461206e565b6112c3565b3480156109ba57600080fd5b506103da6109c936600461206e565b6112e3565b3480156109da57600080fd5b506103fc6109e9366004612017565b601a6020526000908152604090205460ff1681565b348015610a0a57600080fd5b506103da610a1936600461206e565b611303565b348015610a2a57600080fd5b506103da610a39366004612123565b61130f565b348015610a4a57600080fd5b506103da610a5936600461214d565b6113f2565b348015610a6a57600080fd5b5061042760155481565b348015610a8057600080fd5b50610427610a8f36600461206e565b6114ac565b348015610aa057600080fd5b506103da610aaf366004612097565b6114c3565b348015610ac057600080fd5b506103da610acf366004612100565b6115bf565b348015610ae057600080fd5b506104277f9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a681565b348015610b1457600080fd5b506103da610b233660046120b2565b61162b565b348015610b3457600080fd5b50610427610b433660046121d1565b6001600160a01b03918216600090815260016020908152604080832093909416825291909152205490565b348015610b7a57600080fd5b506103da610b89366004612097565b611650565b348015610b9a57600080fd5b5061042760105481565b348015610bb057600080fd5b5061042760115481565b348015610bc657600080fd5b50600b546103fc90600160b01b900460ff1681565b348015610be757600080fd5b506103da610bf6366004612017565b611676565b348015610c0757600080fd5b506103da610c1636600461206e565b6116ec565b60006001600160e01b03198216635a05180f60e01b1480610c405750610c40826116f9565b92915050565b606060038054610c55906121fb565b80601f0160208091040260200160405190810160405280929190818152602001828054610c81906121fb565b8015610cce5780601f10610ca357610100808354040283529160200191610cce565b820191906000526020600020905b8154'... 12150 more characters,
    accessList: null
  }
}
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % yarn deploy:testnet3
yarn run v1.22.19
$ npx hardhat run --network mantleTestnet scripts/deploy.ts
✖ Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y

Deploying to mantleTestnet network...
Nothing to compile
Compiled contracts...
Deploying smart contracts to...mantleTestnet:
GasToken to 0x8924755a7FB45bF0A37A6A773795CFa878114A26
Vault to 0xaA7bb5855C88A5b95665BAadB99F04DeEe8E8de3
Arbitrage to 0x749Ac2b79f45449ef4E25Fac166E2aa11EA08e2c
Treasury to 0x74D134C1E6a8303b60D513AbcdBbCC6d52aD0147
Bank to 0x77eFB7ed59Ca1e35dacA17bAaC473A70fb6E8e54
LiquidationEngine to 0x76c57C952831F450C75fd28DC464B9b8D563fFE4
Verifying smart contracts on...mantleTestnet:
NomicLabsHardhatPluginError: Trying to verify a contract in a network with chain id 5001, but the plugin doesn't recognize it as a supported chain.

You can manually add support for it by following these instructions: https://hardhat.org/verify-custom-networks

To see the list of supported networks, run this command:

  npx hardhat verify --list-networks
    at throwUnsupportedNetwork (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@nomiclabs/hardhat-etherscan/src/errors.ts:18:9)
    at getEtherscanEndpoints (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@nomiclabs/hardhat-etherscan/src/network/prober.ts:46:28)
    at processTicksAndRejections (node:internal/process/task_queues:95:5)
    at async Environment._runTaskDefinition (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/runtime-environment.ts:311:14)
    at async Environment.run (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/runtime-environment.ts:159:14)
    at async SimpleTaskDefinition.verifySubtask [as action] (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@nomiclabs/hardhat-etherscan/src/index.ts:220:30)
    at async Environment._runTaskDefinition (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/runtime-environment.ts:311:14)
    at async Environment.run (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/runtime-environment.ts:159:14)
    at async main (/Users/charlestaylor/Documents/eth-den-rgas-token/scripts/deploy.ts:85:5)
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % yarn deploy:testnet4
yarn run v1.22.19
$ npx hardhat run --network mumbaiTestnet scripts/deploy.ts
✖ Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y

Deploying to mumbaiTestnet network...
Nothing to compile
Compiled contracts...
Deploying smart contracts to...mumbaiTestnet:
GasToken to 0x8924755a7FB45bF0A37A6A773795CFa878114A26
Vault to 0xaA7bb5855C88A5b95665BAadB99F04DeEe8E8de3
Arbitrage to 0x749Ac2b79f45449ef4E25Fac166E2aa11EA08e2c
Treasury to 0x74D134C1E6a8303b60D513AbcdBbCC6d52aD0147
Bank to 0x77eFB7ed59Ca1e35dacA17bAaC473A70fb6E8e54
LiquidationEngine to 0x76c57C952831F450C75fd28DC464B9b8D563fFE4
Verifying smart contracts on...mumbaiTestnet:
NomicLabsHardhatPluginError: You are trying to verify a contract in 'polygonMumbai', but no API token was found for this network. Please provide one in your hardhat config. For example:

{
  ...
  etherscan: {
    apiKey: {
      polygonMumbai: 'your API key'
    }
  }
}

See https://etherscan.io/apis
    at throwMissingApiKeyError (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@nomiclabs/hardhat-etherscan/src/resolveEtherscanApiKey.ts:27:9)
    at resolveEtherscanApiKey (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@nomiclabs/hardhat-etherscan/src/resolveEtherscanApiKey.ts:20:5)
    at SimpleTaskDefinition.verifySubtask [as action] (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@nomiclabs/hardhat-etherscan/src/index.ts:222:49)
    at processTicksAndRejections (node:internal/process/task_queues:95:5)
    at async Environment._runTaskDefinition (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/runtime-environment.ts:311:14)
    at async Environment.run (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/runtime-environment.ts:159:14)
    at async main (/Users/charlestaylor/Documents/eth-den-rgas-token/scripts/deploy.ts:85:5)
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % yarn deploy:testnet5
yarn run v1.22.19
$ npx hardhat run --network neonTestnet scripts/deploy.ts
✖ Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y

Deploying to neonTestnet network...
Nothing to compile
Compiled contracts...
Deploying smart contracts to...neonTestnet:
HardhatError: HH110: Invalid JSON-RPC response received: 
    at parseJsonResponse (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/util/jsonrpc.ts:47:11)
    at HttpProvider._fetchJsonRpcResponse (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/providers/http.ts:212:31)
    at processTicksAndRejections (node:internal/process/task_queues:95:5)
    at async HttpProvider.request (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/providers/http.ts:89:29)
    at async AutomaticGasPriceProvider._suggestEip1559FeePriceValues (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/providers/gas-providers.ts:232:22)
    at async AutomaticGasPriceProvider.request (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/providers/gas-providers.ts:173:34)
    at async EthersProviderWrapper.send (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@nomiclabs/hardhat-ethers/src/internal/ethers-provider-wrapper.ts:13:20)
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % yarn deploy:testnet5
yarn run v1.22.19
$ npx hardhat run --network neonTestnet scripts/deploy.ts
✖ Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y

Deploying to neonTestnet network...
Nothing to compile
Compiled contracts...
Deploying smart contracts to...neonTestnet:
GasToken to 0x8924755a7FB45bF0A37A6A773795CFa878114A26
ΩVault to 0xaA7bb5855C88A5b95665BAadB99F04DeEe8E8de3
HardhatError: HH110: Invalid JSON-RPC response received: 
    at parseJsonResponse (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/util/jsonrpc.ts:47:11)
    at HttpProvider._fetchJsonRpcResponse (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/providers/http.ts:212:31)
    at processTicksAndRejections (node:internal/process/task_queues:95:5)
    at async HttpProvider.request (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/providers/http.ts:89:29)
    at async EthersProviderWrapper.send (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@nomiclabs/hardhat-ethers/src/internal/ethers-provider-wrapper.ts:13:20)
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % clear

charlestaylor@charless-Air eth-den-rgas-token % yarn deploy:testnet2
yarn run v1.22.19
$ npx hardhat run --network scrollTestnet scripts/deploy.ts
✖ Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y

Deploying to scrollTestnet network...
Nothing to compile
Compiled contracts...
Deploying smart contracts to...scrollTestnet:
HardhatError: HH110: Invalid JSON-RPC response received: Bad Request

    at parseJsonResponse (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/util/jsonrpc.ts:47:11)
    at HttpProvider._fetchJsonRpcResponse (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/providers/http.ts:212:31)
    at processTicksAndRejections (node:internal/process/task_queues:95:5)
    at async HttpProvider.request (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/providers/http.ts:89:29)
    at async ChainIdValidatorProvider._getChainIdFromEthNetVersion (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/providers/chainId.ts:33:17)
    at async ChainIdValidatorProvider._getChainId (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/providers/chainId.ts:17:25)
    at async ChainIdValidatorProvider.request (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/providers/chainId.ts:55:29)
    at async EthersProviderWrapper.send (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@nomiclabs/hardhat-ethers/src/internal/ethers-provider-wrapper.ts:13:20)
    at async getSigners (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@nomiclabs/hardhat-ethers/src/internal/helpers.ts:45:20)
    at async getContractFactoryByAbiAndBytecode (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@nomiclabs/hardhat-ethers/src/internal/helpers.ts:288:21)
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % clear

charlestaylor@charless-Air eth-den-rgas-token % yarn deploy:testnet5
yarn run v1.22.19
$ npx hardhat run --network neonTestnet scripts/deploy.ts
✖ Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y

Deploying to neonTestnet network...
Nothing to compile
Compiled contracts...
Deploying smart contracts to...neonTestnet:
GasToken to 0x749Ac2b79f45449ef4E25Fac166E2aa11EA08e2c
Vault to 0x74D134C1E6a8303b60D513AbcdBbCC6d52aD0147
HardhatError: HH110: Invalid JSON-RPC response received: 
    at parseJsonResponse (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/util/jsonrpc.ts:47:11)
    at HttpProvider._fetchJsonRpcResponse (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/providers/http.ts:212:31)
    at processTicksAndRejections (node:internal/process/task_queues:95:5)
    at async HttpProvider.request (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/providers/http.ts:89:29)
    at async EthersProviderWrapper.send (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@nomiclabs/hardhat-ethers/src/internal/ethers-provider-wrapper.ts:13:20)
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % clar
zsh: command not found: clar
charlestaylor@charless-Air eth-den-rgas-token % clear

charlestaylor@charless-Air eth-den-rgas-token % yarn deploy:testnet5
yarn run v1.22.19
$ npx hardhat run --network neonTestnet scripts/deploy.ts
✖ Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y

Deploying to neonTestnet network...
Nothing to compile
Compiled contracts...
Deploying smart contracts to...neonTestnet:
HardhatError: HH110: Invalid JSON-RPC response received: 
    at parseJsonResponse (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/util/jsonrpc.ts:47:11)
    at HttpProvider._fetchJsonRpcResponse (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/providers/http.ts:212:31)
    at processTicksAndRejections (node:internal/process/task_queues:95:5)
    at async HttpProvider.request (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/providers/http.ts:89:29)
    at async LocalAccountsProvider._getNonce (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/providers/accounts.ts:230:23)
    at async LocalAccountsProvider.request (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/providers/accounts.ts:168:27)
    at async EthersProviderWrapper.send (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@nomiclabs/hardhat-ethers/src/internal/ethers-provider-wrapper.ts:13:20)
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % yarn deploy:testnet2
yarn run v1.22.19
$ npx hardhat run --network scrollTestnet scripts/deploy.ts
✖ Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y

Deploying to scrollTestnet network...
Nothing to compile
Compiled contracts...
Deploying smart contracts to...scrollTestnet:
Error: insufficient funds for intrinsic transaction cost [ See: https://links.ethers.org/v5-errors-INSUFFICIENT_FUNDS ] (error={"name":"ProviderError","_stack":"ProviderError: HttpProviderError\n    at HttpProvider.request (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/providers/http.ts:83:19)\n    at LocalAccountsProvider.request (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/providers/accounts.ts:187:34)\n    at processTicksAndRejections (node:internal/process/task_queues:95:5)\n    at async EthersProviderWrapper.send (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@nomiclabs/hardhat-ethers/src/internal/ethers-provider-wrapper.ts:13:20)","code":-32000,"_isProviderError":true}, method="estimateGas", transaction={"from":"0x1C77905fEAfD85f7fdeD7aD5f871F93C2B11dcfF","data":"0x6080604052600b8054600163ffffff0160a01b03191661dead17905560826017553480156200002d57600080fd5b506040518060400160405280600c81526020016b28a49023b0b9902a37b5b2b760a11b81525060405180604001604052806002815260200161514960f01b81525081600390816200007f9190620005d5565b5060046200008e8282620005d5565b50506005805460ff1916601217905550620000b0620000aa3390565b62000186565b620000bd600033620001e0565b620000e97f9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a633620001e0565b600c80546001600160a01b03191673bd4eafe5215830399a9a30ba588fbe41800146399081179091556200011f906001620001f0565b6200012c306001620001f0565b620001506200014860055461010090046001600160a01b031690565b6001620001f0565b620001806200016c60055461010090046001600160a01b031690565b6c01431e0fae6d7217caa0000000620002db565b620006c3565b600580546001600160a01b03838116610100818102610100600160a81b031985161790945560405193909204169182907f8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e090600090a35050565b620001ec82826200038c565b5050565b620001fa620003b7565b6001600160a01b03821660009081526019602052604090205481151560ff9091161515036200027c5760405162461bcd60e51b8152602060048201526024808201527f4163636f756e7420697320616c72656164792065786c756465642066726f6d206044820152636665657360e01b60648201526084015b60405180910390fd5b6001600160a01b038216600081815260196020908152604091829020805460ff191685151590811790915591519182527f9d8f7706ea1113d1a167b526eca956215946dd36cc7df39eb16180222d8b5df7910160405180910390a25050565b6001600160a01b038216620003335760405162461bcd60e51b815260206004820152601f60248201527f45524332303a206d696e7420746f20746865207a65726f206164647265737300604482015260640162000273565b80600254620003439190620006a1565b6002556001600160a01b0382166000908152602081905260409020546200036c908290620006a1565b6001600160a01b0390921660009081526020819052604090209190915550565b6200039882826200041b565b6000828152600760205260409020620003b29082620004bf565b505050565b6005546001600160a01b03610100909104163314620004195760405162461bcd60e51b815260206004820181905260248201527f4f776e61626c653a2063616c6c6572206973206e6f7420746865206f776e6572604482015260640162000273565b565b60008281526006602090815260408083206001600160a01b038516845290915290205460ff16620001ec5760008281526006602090815260408083206001600160a01b03851684529091529020805460ff191660011790556200047b3390565b6001600160a01b0316816001600160a01b0316837f2f8788117e7eff1d82e926ec794901d17c78024a50270940304540a733656f0d60405160405180910390a45050565b6000620004d6836001600160a01b038416620004df565b90505b92915050565b60008181526001830160205260408120546200052857508154600181810184556000848152602080822090930184905584548482528286019093526040902091909155620004d9565b506000620004d9565b634e487b7160e01b600052604160045260246000fd5b600181811c908216806200055c57607f821691505b6020821081036200057d57634e487b7160e01b600052602260045260246000fd5b50919050565b601f821115620003b257600081815260208120601f850160051c81016020861015620005ac5750805b601f850160051c820191505b81811015620005cd57828155600101620005b8565b505050505050565b81516001600160401b03811115620005f157620005f162000531565b620006098162000602845462000547565b8462000583565b602080601f831160018114620006415760008415620006285750858301515b600019600386901b1c1916600185901b178555620005cd565b600085815260208120601f198616915b82811015620006725788860151825594840194600190910190840162000651565b5085821015620006915787850151600019600388901b60f8161c191681555b5050505050600190811b01905550565b80820180821115620004d957634e487b7160e01b600052601160045260246000fd5b61246f80620006d36000396000f3fe6080604052600436106103c75760003560e01c806391d14854116101f2578063b90306ad1161010d578063d547741f116100a0578063e6c75f711161006f578063e6c75f7114610ba4578063e84d44f814610bba578063f2fde38b14610bdb578063fb7f634a14610bfb576103ce565b8063d547741f14610b08578063dd62ed3e14610b28578063e27ad5eb14610b6e578063e2f4560514610b8e576103ce565b8063ca15c873116100dc578063ca15c87314610a74578063cf8f19bf14610a94578063d46d9ba114610ab4578063d539139314610ad4576103ce565b8063b90306ad146109fe578063c024666814610a1e578063c492f04614610a3e578063c9b4c06314610a5e576103ce565b8063a336d8c311610185578063aacebbe311610154578063aacebbe31461096e578063afa4f3b21461098e578063b3b5e043146109ae578063b62496f5146109ce576103ce565b8063a336d8c3146108f8578063a457c2d714610918578063a6b6388814610938578063a9059cbb1461094e576103ce565b8063980f02fe116101c1578063980f02fe146108835780639f34a5b4146108a3578063a06d8fc7146108c3578063a217fddf146108e3576103ce565b806391d14854146108225780639466125f14610842578063955ebc9e1461085857806395d89b411461086e576103ce565b80632f2ff15d116102e25780636b67c4df116102755780637b16cea0116102445780637b16cea0146107705780638942dd84146107a95780638da5cb5b146107df5780639010d07c14610802576103ce565b80636b67c4df146106ef57806370a0823114610705578063715018a61461073b57806375f0a87414610750576103ce565b80633935bac6116102b15780633935bac61461067957806339509351146106995780635c38ffe2146106b95780635fd65fea146106d9576103ce565b80632f2ff15d146105f6578063313ce5671461061657806336568abe146106385780633884f36414610658576103ce565b8063122fe6851161035a57806323b872dd1161032957806323b872dd14610566578063248a9ca314610586578063263b5fcb146105b657806327c8f835146105d6576103ce565b8063122fe685146104ed57806313114a9d1461052557806318160ddd1461053b57806322bd3f7f14610550576103ce565b8063095ea7b311610396578063095ea7b31461046c57806309c58fcd1461048c57806310f58246146104ad5780631129e65b146104cd576103ce565b806301ffc9a7146103dc57806302259e9e1461041157806306fdde031461043557806307efbfdc14610457576103ce565b366103ce57005b3480156103da57600080fd5b005b3480156103e857600080fd5b506103fc6103f7366004611f50565b610c1b565b60405190151581526020015b60405180910390f35b34801561041d57600080fd5b50610427600f5481565b604051908152602001610408565b34801561044157600080fd5b5061044a610c46565b6040516104089190611f9e565b34801561046357600080fd5b506103da610cd8565b34801561047857600080fd5b506103fc610487366004611fed565b610d3c565b34801561049857600080fd5b50600b546103fc90600160a81b900460ff1681565b3480156104b957600080fd5b506103da6104c8366004612017565b610d52565b3480156104d957600080fd5b506103da6104e8366004612017565b610d99565b3480156104f957600080fd5b5060185461050d906001600160a01b031681565b6040516001600160a01b039091168152602001610408565b34801561053157600080fd5b5061042760165481565b34801561054757600080fd5b50600254610427565b34801561055c57600080fd5b5061042760175481565b34801561057257600080fd5b506103fc610581366004612032565b610dac565b34801561059257600080fd5b506104276105a136600461206e565b60009081526006602052604090206001015490565b3480156105c257600080fd5b506103da6105d1366004612097565b610e15565b3480156105e257600080fd5b50600b5461050d906001600160a01b031681565b34801561060257600080fd5b506103da6106113660046120b2565b610f1d565b34801561062257600080fd5b5060055460405160ff9091168152602001610408565b34801561064457600080fd5b506103da6106533660046120b2565b610f47565b34801561066457600080fd5b50600b546103fc90600160b81b900460ff1681565b34801561068557600080fd5b506103da610694366004612017565b610fc5565b3480156106a557600080fd5b506103fc6106b4366004611fed565b610ffa565b3480156106c557600080fd5b506103da6106d436600461206e565b611031565b3480156106e557600080fd5b5061042760135481565b3480156106fb57600080fd5b5061042760125481565b34801561071157600080fd5b50610427610720366004612017565b6001600160a01b031660009081526020819052604090205490565b34801561074757600080fd5b506103da611051565b34801561075c57600080fd5b50600c5461050d906001600160a01b031681565b34801561077c57600080fd5b506103fc61078b366004612017565b6001600160a01b031660009081526019602052604090205460ff1690565b3480156107b557600080fd5b5060098054600a80544882821b81019092556103ff60f01b16909103019081905560199004600855005b3480156107eb57600080fd5b5060055461010090046001600160a01b031661050d565b34801561080e57600080fd5b5061050d61081d3660046120de565b611065565b34801561082e57600080fd5b506103fc61083d3660046120b2565b611084565b34801561084e57600080fd5b5061042760085481565b34801561086457600080fd5b5061042760145481565b34801561087a57600080fd5b5061044a6110af565b34801561088f57600080fd5b506103da61089e366004612100565b6110be565b3480156108af57600080fd5b506103da6108be36600461206e565b611130565b3480156108cf57600080fd5b506103da6108de366004612017565b611150565b3480156108ef57600080fd5b50610427600081565b34801561090457600080fd5b50600d5461050d906001600160a01b031681565b34801561092457600080fd5b506103fc610933366004611fed565b611185565b34801561094457600080fd5b50610427600e5481565b34801561095a57600080fd5b506103fc610969366004611fed565b6111d4565b34801561097a57600080fd5b506103da610989366004612017565b6111e1565b34801561099a57600080fd5b506103da6109a936600461206e565b6112c3565b3480156109ba57600080fd5b506103da6109c936600461206e565b6112e3565b3480156109da57600080fd5b506103fc6109e9366004612017565b601a6020526000908152604090205460ff1681565b348015610a0a57600080fd5b506103da610a1936600461206e565b611303565b348015610a2a57600080fd5b506103da610a39366004612123565b61130f565b348015610a4a57600080fd5b506103da610a5936600461214d565b6113f2565b348015610a6a57600080fd5b5061042760155481565b348015610a8057600080fd5b50610427610a8f36600461206e565b6114ac565b348015610aa057600080fd5b506103da610aaf366004612097565b6114c3565b348015610ac057600080fd5b506103da610acf366004612100565b6115bf565b348015610ae057600080fd5b506104277f9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a681565b348015610b1457600080fd5b506103da610b233660046120b2565b61162b565b348015610b3457600080fd5b50610427610b433660046121d1565b6001600160a01b03918216600090815260016020908152604080832093909416825291909152205490565b348015610b7a57600080fd5b506103da610b89366004612097565b611650565b348015610b9a57600080fd5b5061042760105481565b348015610bb057600080fd5b5061042760115481565b348015610bc657600080fd5b50600b546103fc90600160b01b900460ff1681565b348015610be757600080fd5b506103da610bf6366004612017565b611676565b348015610c0757600080fd5b506103da610c1636600461206e565b6116ec565b60006001600160e01b03198216635a05180f60e01b1480610c405750610c40826116f9565b92915050565b606060038054610c55906121fb565b80601f0160208091040260200160405190810160405280929190818152602001828054610c81906121fb565b8015610cce5780601f10610ca357610100808354040283529160200191610cce565b820191906000526020600020905b815481529060010190602001808311610cb157829003601f168201915b5050505050905090565b610ce061172e565b60056012556002601455600f6016819055600b805461ffff60b01b191661010160b01b1790556a108b2a2c280290940000006010556c01431e0fae6d7217caa0000000600e8190556af8277896582678ac000000909155601155565b6000610d4933848461178e565b50600192915050565b610d5a61172e565b600d54610d6f906001600160a01b0316610fc5565b600d80546001600160a01b0319166001600160a01b038316908117909155610d9690611150565b50565b610da161172e565b610d9681600161130f565b6000610db984848461187d565b610e0b8433610e06856040518060600160405280602881526020016123ed602891396001600160a01b038a16600090815260016020908152604080832033845290915290205491906119d1565b61178e565b5060019392505050565b610e1d61172e565b801515600b60169054906101000a900460ff16151503610e845760405162461bcd60e51b815260206004820152601d60248201527f43616e27742073657420666c616720746f2073616d652073746174757300000060448201526064015b60405180910390fd5b801515600003610eb5576012805460135560009055600b805460ff60b01b1916600160b01b83151502179055610ee4565b6013546012819055601454610ec99161224b565b601655600b805460ff60b01b1916600160b01b831515021790555b60405181151581527f6ba6c1012539169f5a820a29533d8c8b797a1c7a5634edbd3124a80de0e75cba906020015b60405180910390a150565b600082815260066020526040902060010154610f3881611a08565b610f428383611a12565b505050565b6001600160a01b0381163314610fb75760405162461bcd60e51b815260206004820152602f60248201527f416363657373436f6e74726f6c3a2063616e206f6e6c792072656e6f756e636560448201526e103937b632b9903337b91039b2b63360891b6064820152608401610e7b565b610fc18282611a34565b5050565b6000610fd081611a08565b610fc17f9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a683611a34565b3360008181526001602090815260408083206001600160a01b03871684529091528120549091610d49918590610e0690869061224b565b61103961172e565b61104b81670de0b6b3a764000061225e565b600f5550565b61105961172e565b6110636000611a56565b565b600082815260076020526040812061107d9083611ab0565b9392505050565b60009182526006602090815260408084206001600160a01b0393909316845291905290205460ff1690565b606060048054610c55906121fb565b6110c661172e565b60068160ff1611156111155760405162461bcd60e51b8152602060048201526018602482015277466565206d757374206265206c657373207468616e20362560401b6044820152606401610e7b565b60ff8116601481905560125461112a9161224b565b60165550565b61113861172e565b61114a81670de0b6b3a764000061225e565b60115550565b600061115b81611a08565b610fc17f9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a683611a12565b6000610d493384610e0685604051806060016040528060258152602001612415602591393360009081526001602090815260408083206001600160a01b038d16845290915290205491906119d1565b6000610d4933848461187d565b6111e961172e565b600c546001600160a01b039081169082160361125c5760405162461bcd60e51b815260206004820152602c60248201527f546865206d61726b6574696e672077616c6c657420697320616c72656164792060448201526b74686973206164647265737360a01b6064820152608401610e7b565b61126781600161130f565b600c546040516001600160a01b038084169216907f8616c7a330e3cf61290821331585511f1e2778171e2b005fb5ec60cfe874dc6790600090a3600c80546001600160a01b0319166001600160a01b0392909216919091179055565b6112cb61172e565b6112dd81670de0b6b3a764000061225e565b60105550565b6112eb61172e565b6112fd81670de0b6b3a764000061225e565b600e5550565b610fc132600083610dac565b61131761172e565b6001600160a01b03821660009081526019602052604090205481151560ff9091161515036113935760405162461bcd60e51b8152602060048201526024808201527f4163636f756e7420697320616c72656164792065786c756465642066726f6d206044820152636665657360e01b6064820152608401610e7b565b6001600160a01b038216600081815260196020908152604091829020805460ff191685151590811790915591519182527f9d8f7706ea1113d1a167b526eca956215946dd36cc7df39eb16180222d8b5df7910160405180910390a25050565b6113fa61172e565b60005b8281101561146b57816019600086868581811061141c5761141c612275565b90506020020160208101906114319190612017565b6001600160a01b031681526020810191909152604001600020805460ff1916911515919091179055806114638161228b565b9150506113fd565b507f7fdaf542373fa84f4ee8d662c642f44e4c2276a217d7d29e548b6eb29a233b3583838360405161149f939291906122a4565b60405180910390a1505050565b6000818152600760205260408120610c4090611abc565b6114cb61172e565b801515600b60179054906101000a900460ff1615150361152d5760405162461bcd60e51b815260206004820152601d60248201527f43616e27742073657420666c616720746f2073616d65207374617475730000006044820152606401610e7b565b80151560000361155e576014805460155560009055600b805460ff60b81b1916600160b81b8315150217905561158d565b60155460148190556012546115729161224b565b601655600b805460ff60b81b1916600160b81b831515021790555b60405181151581527feeddd25ab572944f46f2e1d17c56bb44594bdf0b4696199da23db34f0bcf9b9a90602001610f12565b6115c761172e565b60068160ff1611156116165760405162461bcd60e51b8152602060048201526018602482015277466565206d757374206265206c657373207468616e20362560401b6044820152606401610e7b565b60ff8116601281905560145461112a9161224b565b60008281526006602052604090206001015461164681611a08565b610f428383611a34565b61165861172e565b600b8054911515600160a81b0260ff60a81b19909216919091179055565b61167e61172e565b6001600160a01b0381166116e35760405162461bcd60e51b815260206004820152602660248201527f4f776e61626c653a206e6577206f776e657220697320746865207a65726f206160448201526564647265737360d01b6064820152608401610e7b565b610d9681611a56565b6116f461172e565b601755565b60006001600160e01b03198216637965db0b60e01b1480610c4057506301ffc9a760e01b6001600160e01b0319831614610c40565b6005546001600160a01b036101009091041633146110635760405162461bcd60e51b815260206004820181905260248201527f4f776e61626c653a2063616c6c6572206973206e6f7420746865206f776e65726044820152606401610e7b565b6001600160a01b0383166117f05760405162461bcd60e51b8152602060048201526024808201527f45524332303a20617070726f76652066726f6d20746865207a65726f206164646044820152637265737360e01b6064820152608401610e7b565b6001600160a01b0382166118515760405162461bcd60e51b815260206004820152602260248201527f45524332303a20617070726f766520746f20746865207a65726f206164647265604482015261737360f01b6064820152608401610e7b565b6001600160a01b0392831660009081526001602090815260408083209490951682529290925291902055565b6001600160a01b0383166118e15760405162461bcd60e51b815260206004820152602560248201527f45524332303a207472616e736665722066726f6d20746865207a65726f206164604482015264647265737360d81b6064820152608401610e7b565b6001600160a01b0382166119435760405162461bcd60e51b815260206004820152602360248201527f45524332303a207472616e7366657220746f20746865207a65726f206164647260448201526265737360e81b6064820152608401610e7b565b611980816040518060600160405280602681526020016123c7602691396001600160a01b03861660009081526020819052604090205491906119d1565b6001600160a01b0380851660009081526020819052604080822093909355908416815220546119b090829061224b565b6001600160a01b039092166000908152602081905260409020919091555050565b600081848411156119f55760405162461bcd60e51b8152600401610e7b9190611f9e565b50611a0083856122fb565b949350505050565b610d968133611ac6565b611a1c8282611b1f565b6000828152600760205260409020610f429082611ba5565b611a3e8282611bba565b6000828152600760205260409020610f429082611c21565b600580546001600160a01b03838116610100818102610100600160a81b031985161790945560405193909204169182907f8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e090600090a35050565b600061107d8383611c36565b6000610c40825490565b611ad08282611084565b610fc157611add81611c60565b611ae8836020611c72565b604051602001611af992919061230e565b60408051601f198184030181529082905262461bcd60e51b8252610e7b91600401611f9e565b611b298282611084565b610fc15760008281526006602090815260408083206001600160a01b03851684529091529020805460ff19166001179055611b613390565b6001600160a01b0316816001600160a01b0316837f2f8788117e7eff1d82e926ec794901d17c78024a50270940304540a733656f0d60405160405180910390a45050565b600061107d836001600160a01b038416611e0e565b611bc48282611084565b15610fc15760008281526006602090815260408083206001600160a01b0385168085529252808320805460ff1916905551339285917ff6391f5c32d9c69d2a47ea670b442974b53935d1edc7fd64eb21e047a839171b9190a45050565b600061107d836001600160a01b038416611e5d565b6000826000018281548110611c4d57611c4d612275565b9060005260206000200154905092915050565b6060610c406001600160a01b03831660145b60606000611c8183600261225e565b611c8c90600261224b565b67ffffffffffffffff811115611ca457611ca4612383565b6040519080825280601f01601f191660200182016040528015611cce576020820181803683370190505b509050600360fc1b81600081518110611ce957611ce9612275565b60200101906001600160f81b031916908160001a905350600f60fb1b81600181518110611d1857611d18612275565b60200101906001600160f81b031916908160001a9053506000611d3c84600261225e565b611d4790600161224b565b90505b6001811115611dbf576f181899199a1a9b1b9c1cb0b131b232b360811b85600f1660108110611d7b57611d7b612275565b1a60f81b828281518110611d9157611d91612275565b60200101906001600160f81b031916908160001a90535060049490941c93611db881612399565b9050611d4a565b50831561107d5760405162461bcd60e51b815260206004820181905260248201527f537472696e67733a20686578206c656e67746820696e73756666696369656e746044820152606401610e7b565b6000818152600183016020526040812054611e5557508154600181810184556000848152602080822090930184905584548482528286019093526040902091909155610c40565b506000610c40565b60008181526001830160205260408120548015611f46576000611e816001836122fb565b8554909150600090611e95906001906122fb565b9050818114611efa576000866000018281548110611eb557611eb5612275565b9060005260206000200154905080876000018481548110611ed857611ed8612275565b6000918252602080832090910192909255918252600188019052604090208390555b8554869080611f0b57611f0b6123b0565b600190038181906000526020600020016000905590558560010160008681526020019081526020016000206000905560019350505050610c40565b6000915050610c40565b600060208284031215611f6257600080fd5b81356001600160e01b03198116811461107d57600080fd5b60005b83811015611f95578181015183820152602001611f7d565b50506000910152565b6020815260008251806020840152611fbd816040850160208701611f7a565b601f01601f19169190910160400192915050565b80356001600160a01b0381168114611fe857600080fd5b919050565b6000806040838503121561200057600080fd5b61200983611fd1565b946020939093013593505050565b60006020828403121561202957600080fd5b61107d82611fd1565b60008060006060848603121561204757600080fd5b61205084611fd1565b925061205e60208501611fd1565b9150604084013590509250925092565b60006020828403121561208057600080fd5b5035919050565b80358015158114611fe857600080fd5b6000602082840312156120a957600080fd5b61107d82612087565b600080604083850312156120c557600080fd5b823591506120d560208401611fd1565b90509250929050565b600080604083850312156120f157600080fd5b50508035926020909101359150565b60006020828403121561211257600080fd5b813560ff8116811461107d57600080fd5b6000806040838503121561213657600080fd5b61213f83611fd1565b91506120d560208401612087565b60008060006040848603121561216257600080fd5b833567ffffffffffffffff8082111561217a57600080fd5b818601915086601f83011261218e57600080fd5b81358181111561219d57600080fd5b8760208260051b85010111156121b257600080fd5b6020928301955093506121c89186019050612087565b90509250925092565b600080604083850312156121e457600080fd5b6121ed83611fd1565b91506120d560208401611fd1565b600181811c9082168061220f57607f821691505b60208210810361222f57634e487b7160e01b600052602260045260246000fd5b50919050565b634e487b7160e01b600052601160045260246000fd5b80820180821115610c4057610c40612235565b8082028115828204841417610c4057610c40612235565b634e487b7160e01b600052603260045260246000fd5b60006001820161229d5761229d612235565b5060010190565b6040808252810183905260008460608301825b868110156122e5576001600160a01b036122d084611fd1565b168252602092830192909101906001016122b7565b5080925050508215156020830152949350505050565b81810381811115610c4057610c40612235565b7f416363657373436f6e74726f6c3a206163636f756e7420000000000000000000815260008351612346816017850160208801611f7a565b7001034b99036b4b9b9b4b733903937b6329607d1b6017918401918201528351612377816028840160208801611f7a565b01602801949350505050565b634e487b7160e01b600052604160045260246000fd5b6000816123a8576123a8612235565b506000190190565b634e487b7160e01b600052603160045260246000fdfe45524332303a207472616e7366657220616d6f756e7420657863656564732062616c616e636545524332303a207472616e7366657220616d6f756e74206578636565647320616c6c6f77616e636545524332303a2064656372656173656420616c6c6f77616e63652062656c6f77207a65726fa2646970667358221220415c00370705353257924026c35bbf774dd1fac49c77a7029328fa1702e0d6be64736f6c63430008130033","accessList":null}, code=INSUFFICIENT_FUNDS, version=providers/5.7.2)
    at Logger.makeError (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@ethersproject/logger/src.ts/index.ts:269:28)
    at Logger.throwError (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@ethersproject/logger/src.ts/index.ts:281:20)
    at checkError (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@ethersproject/providers/src.ts/json-rpc-provider.ts:98:16)
    at EthersProviderWrapper.<anonymous> (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@ethersproject/providers/src.ts/json-rpc-provider.ts:642:20)
    at step (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@ethersproject/providers/lib/json-rpc-provider.js:48:23)
    at Object.throw (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@ethersproject/providers/lib/json-rpc-provider.js:29:53)
    at rejected (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@ethersproject/providers/lib/json-rpc-provider.js:21:65)
    at processTicksAndRejections (node:internal/process/task_queues:95:5) {
  reason: 'insufficient funds for intrinsic transaction cost',
  code: 'INSUFFICIENT_FUNDS',
  error: ProviderError: HttpProviderError
      at HttpProvider.request (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/providers/http.ts:83:19)
      at LocalAccountsProvider.request (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/providers/accounts.ts:187:34)
      at processTicksAndRejections (node:internal/process/task_queues:95:5)
      at async EthersProviderWrapper.send (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@nomiclabs/hardhat-ethers/src/internal/ethers-provider-wrapper.ts:13:20),
  method: 'estimateGas',
  transaction: {
    from: '0x1C77905fEAfD85f7fdeD7aD5f871F93C2B11dcfF',
    data: '0x6080604052600b8054600163ffffff0160a01b03191661dead17905560826017553480156200002d57600080fd5b506040518060400160405280600c81526020016b28a49023b0b9902a37b5b2b760a11b81525060405180604001604052806002815260200161514960f01b81525081600390816200007f9190620005d5565b5060046200008e8282620005d5565b50506005805460ff1916601217905550620000b0620000aa3390565b62000186565b620000bd600033620001e0565b620000e97f9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a633620001e0565b600c80546001600160a01b03191673bd4eafe5215830399a9a30ba588fbe41800146399081179091556200011f906001620001f0565b6200012c306001620001f0565b620001506200014860055461010090046001600160a01b031690565b6001620001f0565b620001806200016c60055461010090046001600160a01b031690565b6c01431e0fae6d7217caa0000000620002db565b620006c3565b600580546001600160a01b03838116610100818102610100600160a81b031985161790945560405193909204169182907f8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e090600090a35050565b620001ec82826200038c565b5050565b620001fa620003b7565b6001600160a01b03821660009081526019602052604090205481151560ff9091161515036200027c5760405162461bcd60e51b8152602060048201526024808201527f4163636f756e7420697320616c72656164792065786c756465642066726f6d206044820152636665657360e01b60648201526084015b60405180910390fd5b6001600160a01b038216600081815260196020908152604091829020805460ff191685151590811790915591519182527f9d8f7706ea1113d1a167b526eca956215946dd36cc7df39eb16180222d8b5df7910160405180910390a25050565b6001600160a01b038216620003335760405162461bcd60e51b815260206004820152601f60248201527f45524332303a206d696e7420746f20746865207a65726f206164647265737300604482015260640162000273565b80600254620003439190620006a1565b6002556001600160a01b0382166000908152602081905260409020546200036c908290620006a1565b6001600160a01b0390921660009081526020819052604090209190915550565b6200039882826200041b565b6000828152600760205260409020620003b29082620004bf565b505050565b6005546001600160a01b03610100909104163314620004195760405162461bcd60e51b815260206004820181905260248201527f4f776e61626c653a2063616c6c6572206973206e6f7420746865206f776e6572604482015260640162000273565b565b60008281526006602090815260408083206001600160a01b038516845290915290205460ff16620001ec5760008281526006602090815260408083206001600160a01b03851684529091529020805460ff191660011790556200047b3390565b6001600160a01b0316816001600160a01b0316837f2f8788117e7eff1d82e926ec794901d17c78024a50270940304540a733656f0d60405160405180910390a45050565b6000620004d6836001600160a01b038416620004df565b90505b92915050565b60008181526001830160205260408120546200052857508154600181810184556000848152602080822090930184905584548482528286019093526040902091909155620004d9565b506000620004d9565b634e487b7160e01b600052604160045260246000fd5b600181811c908216806200055c57607f821691505b6020821081036200057d57634e487b7160e01b600052602260045260246000fd5b50919050565b601f821115620003b257600081815260208120601f850160051c81016020861015620005ac5750805b601f850160051c820191505b81811015620005cd57828155600101620005b8565b505050505050565b81516001600160401b03811115620005f157620005f162000531565b620006098162000602845462000547565b8462000583565b602080601f831160018114620006415760008415620006285750858301515b600019600386901b1c1916600185901b178555620005cd565b600085815260208120601f198616915b82811015620006725788860151825594840194600190910190840162000651565b5085821015620006915787850151600019600388901b60f8161c191681555b5050505050600190811b01905550565b80820180821115620004d957634e487b7160e01b600052601160045260246000fd5b61246f80620006d36000396000f3fe6080604052600436106103c75760003560e01c806391d14854116101f2578063b90306ad1161010d578063d547741f116100a0578063e6c75f711161006f578063e6c75f7114610ba4578063e84d44f814610bba578063f2fde38b14610bdb578063fb7f634a14610bfb576103ce565b8063d547741f14610b08578063dd62ed3e14610b28578063e27ad5eb14610b6e578063e2f4560514610b8e576103ce565b8063ca15c873116100dc578063ca15c87314610a74578063cf8f19bf14610a94578063d46d9ba114610ab4578063d539139314610ad4576103ce565b8063b90306ad146109fe578063c024666814610a1e578063c492f04614610a3e578063c9b4c06314610a5e576103ce565b8063a336d8c311610185578063aacebbe311610154578063aacebbe31461096e578063afa4f3b21461098e578063b3b5e043146109ae578063b62496f5146109ce576103ce565b8063a336d8c3146108f8578063a457c2d714610918578063a6b6388814610938578063a9059cbb1461094e576103ce565b8063980f02fe116101c1578063980f02fe146108835780639f34a5b4146108a3578063a06d8fc7146108c3578063a217fddf146108e3576103ce565b806391d14854146108225780639466125f14610842578063955ebc9e1461085857806395d89b411461086e576103ce565b80632f2ff15d116102e25780636b67c4df116102755780637b16cea0116102445780637b16cea0146107705780638942dd84146107a95780638da5cb5b146107df5780639010d07c14610802576103ce565b80636b67c4df146106ef57806370a0823114610705578063715018a61461073b57806375f0a87414610750576103ce565b80633935bac6116102b15780633935bac61461067957806339509351146106995780635c38ffe2146106b95780635fd65fea146106d9576103ce565b80632f2ff15d146105f6578063313ce5671461061657806336568abe146106385780633884f36414610658576103ce565b8063122fe6851161035a57806323b872dd1161032957806323b872dd14610566578063248a9ca314610586578063263b5fcb146105b657806327c8f835146105d6576103ce565b8063122fe685146104ed57806313114a9d1461052557806318160ddd1461053b57806322bd3f7f14610550576103ce565b8063095ea7b311610396578063095ea7b31461046c57806309c58fcd1461048c57806310f58246146104ad5780631129e65b146104cd576103ce565b806301ffc9a7146103dc57806302259e9e1461041157806306fdde031461043557806307efbfdc14610457576103ce565b366103ce57005b3480156103da57600080fd5b005b3480156103e857600080fd5b506103fc6103f7366004611f50565b610c1b565b60405190151581526020015b60405180910390f35b34801561041d57600080fd5b50610427600f5481565b604051908152602001610408565b34801561044157600080fd5b5061044a610c46565b6040516104089190611f9e565b34801561046357600080fd5b506103da610cd8565b34801561047857600080fd5b506103fc610487366004611fed565b610d3c565b34801561049857600080fd5b50600b546103fc90600160a81b900460ff1681565b3480156104b957600080fd5b506103da6104c8366004612017565b610d52565b3480156104d957600080fd5b506103da6104e8366004612017565b610d99565b3480156104f957600080fd5b5060185461050d906001600160a01b031681565b6040516001600160a01b039091168152602001610408565b34801561053157600080fd5b5061042760165481565b34801561054757600080fd5b50600254610427565b34801561055c57600080fd5b5061042760175481565b34801561057257600080fd5b506103fc610581366004612032565b610dac565b34801561059257600080fd5b506104276105a136600461206e565b60009081526006602052604090206001015490565b3480156105c257600080fd5b506103da6105d1366004612097565b610e15565b3480156105e257600080fd5b50600b5461050d906001600160a01b031681565b34801561060257600080fd5b506103da6106113660046120b2565b610f1d565b34801561062257600080fd5b5060055460405160ff9091168152602001610408565b34801561064457600080fd5b506103da6106533660046120b2565b610f47565b34801561066457600080fd5b50600b546103fc90600160b81b900460ff1681565b34801561068557600080fd5b506103da610694366004612017565b610fc5565b3480156106a557600080fd5b506103fc6106b4366004611fed565b610ffa565b3480156106c557600080fd5b506103da6106d436600461206e565b611031565b3480156106e557600080fd5b5061042760135481565b3480156106fb57600080fd5b5061042760125481565b34801561071157600080fd5b50610427610720366004612017565b6001600160a01b031660009081526020819052604090205490565b34801561074757600080fd5b506103da611051565b34801561075c57600080fd5b50600c5461050d906001600160a01b031681565b34801561077c57600080fd5b506103fc61078b366004612017565b6001600160a01b031660009081526019602052604090205460ff1690565b3480156107b557600080fd5b5060098054600a80544882821b81019092556103ff60f01b16909103019081905560199004600855005b3480156107eb57600080fd5b5060055461010090046001600160a01b031661050d565b34801561080e57600080fd5b5061050d61081d3660046120de565b611065565b34801561082e57600080fd5b506103fc61083d3660046120b2565b611084565b34801561084e57600080fd5b5061042760085481565b34801561086457600080fd5b5061042760145481565b34801561087a57600080fd5b5061044a6110af565b34801561088f57600080fd5b506103da61089e366004612100565b6110be565b3480156108af57600080fd5b506103da6108be36600461206e565b611130565b3480156108cf57600080fd5b506103da6108de366004612017565b611150565b3480156108ef57600080fd5b50610427600081565b34801561090457600080fd5b50600d5461050d906001600160a01b031681565b34801561092457600080fd5b506103fc610933366004611fed565b611185565b34801561094457600080fd5b50610427600e5481565b34801561095a57600080fd5b506103fc610969366004611fed565b6111d4565b34801561097a57600080fd5b506103da610989366004612017565b6111e1565b34801561099a57600080fd5b506103da6109a936600461206e565b6112c3565b3480156109ba57600080fd5b506103da6109c936600461206e565b6112e3565b3480156109da57600080fd5b506103fc6109e9366004612017565b601a6020526000908152604090205460ff1681565b348015610a0a57600080fd5b506103da610a1936600461206e565b611303565b348015610a2a57600080fd5b506103da610a39366004612123565b61130f565b348015610a4a57600080fd5b506103da610a5936600461214d565b6113f2565b348015610a6a57600080fd5b5061042760155481565b348015610a8057600080fd5b50610427610a8f36600461206e565b6114ac565b348015610aa057600080fd5b506103da610aaf366004612097565b6114c3565b348015610ac057600080fd5b506103da610acf366004612100565b6115bf565b348015610ae057600080fd5b506104277f9f2df0fed2c77648de5860a4cc508cd0818c85b8b8a1ab4ceeef8d981c8956a681565b348015610b1457600080fd5b506103da610b233660046120b2565b61162b565b348015610b3457600080fd5b50610427610b433660046121d1565b6001600160a01b03918216600090815260016020908152604080832093909416825291909152205490565b348015610b7a57600080fd5b506103da610b89366004612097565b611650565b348015610b9a57600080fd5b5061042760105481565b348015610bb057600080fd5b5061042760115481565b348015610bc657600080fd5b50600b546103fc90600160b01b900460ff1681565b348015610be757600080fd5b506103da610bf6366004612017565b611676565b348015610c0757600080fd5b506103da610c1636600461206e565b6116ec565b60006001600160e01b03198216635a05180f60e01b1480610c405750610c40826116f9565b92915050565b606060038054610c55906121fb565b80601f0160208091040260200160405190810160405280929190818152602001828054610c81906121fb565b8015610cce5780601f10610ca357610100808354040283529160200191610cce565b820191906000526020600020905b8154'... 12150 more characters,
    accessList: null
  }
}
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % yarn deploy:testnet2
yarn run v1.22.19
$ npx hardhat run --network scrollTestnet scripts/deploy.ts
✖ Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y

Deploying to scrollTestnet network...
Nothing to compile
Compiled contracts...
Deploying smart contracts to...scrollTestnet:
HardhatError: HH101: Hardhat was set to use chain id 534353, but connected to a chain with id 534351.
    at ChainIdValidatorProvider.request (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/providers/chainId.ts:57:15)
    at processTicksAndRejections (node:internal/process/task_queues:95:5)
    at async EthersProviderWrapper.send (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@nomiclabs/hardhat-ethers/src/internal/ethers-provider-wrapper.ts:13:20)
    at async getSigners (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@nomiclabs/hardhat-ethers/src/internal/helpers.ts:45:20)
    at async getContractFactoryByAbiAndBytecode (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@nomiclabs/hardhat-ethers/src/internal/helpers.ts:288:21)
    at async main (/Users/charlestaylor/Documents/eth-den-rgas-token/scripts/deploy.ts:36:22)
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % yarn deploy:testnet2
yarn run v1.22.19
$ npx hardhat run --network scrollTestnet scripts/deploy.ts
✖ Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y

Deploying to scrollTestnet network...
Nothing to compile
Compiled contracts...
Deploying smart contracts to...scrollTestnet:
ProviderError: HttpProviderError
    at HttpProvider.request (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/providers/http.ts:83:19)
    at LocalAccountsProvider.request (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/hardhat/src/internal/core/providers/accounts.ts:181:36)
    at processTicksAndRejections (node:internal/process/task_queues:95:5)
    at async EthersProviderWrapper.send (/Users/charlestaylor/Documents/eth-den-rgas-token/node_modules/@nomiclabs/hardhat-ethers/src/internal/ethers-provider-wrapper.ts:13:20)
error Command failed with exit code 1.
info Visit https://yarnpkg.com/en/docs/cli/run for documentation about this command.
charlestaylor@charless-Air eth-den-rgas-token % history > history_for_print.txt
charlestaylor@charless-Air eth-den-rgas-token % 
