#!/bin/bash

git clone https://github.com/tfutils/tfenv.git ~/.tfenv
echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bash_profile
export PATH="$HOME/.tfenv/bin:$PATH"
tfenv install latest
tfenv use latest
