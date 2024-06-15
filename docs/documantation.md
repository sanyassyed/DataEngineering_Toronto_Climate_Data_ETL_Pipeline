# Toronto Climate Data Mini Project
```bash
    sudo useradd -r Toronto_Climate_Data
    getent passwd
    sudo passwd Toronto_Climate_Data
```
## Create a new user:
* Create a new user with project name as the username
* sudo useradd -r Toronto_Climate_data
* sudo passwd Toronto_Climate_Data (pass*****)
## Creating Project Repository
* Created a remote repo on GitHub with the name `Toronto_Climate_Data`
* On the EC2 intance `DE-LabSarah` did the following:
    * Generated a key for SSH access
    * Added the keys to the `/home/ubuntu/.ssh/` folder
    * Changed the file security of the .pub file
    * Added the public key to GitHub as `id_rsa_ubuntu_DELabSarah`
    * Added this data to the `/home/ubuntu/.ssh/config` file
    * Cloned the remote repo using ssh
    ```bash
        # generating ssh keys    
        ssh-keygen -t rsa
        nano .ssh/config
        # Append the following the config file
        Host github.com
            User git
            IdentityFile /home/ubuntu/.ssh/id_rsa
        # Make .pub file less more secure 
        chmod 600 .ssh/id_rsa.pub
        # add the .pub file to GitHub account: click your profile photo -> Settings-> SSH and GPG keys -> New SSH key or Add SSH key
        # cloning the repo via ssh
        git clone git@github.com:sanyassyed/Toronto_Climate_Data.git
        cd Toronto_Climate_Data
        git config --global user.email "ubuntu@ip-172-31-45-230"
        git config --global user.name "Ubuntu Sarah DELab"
        git config --list
        git remote -v
         # Check the SSH connection with repo from VM using
        ssh -T git@github.com
        # Push changes
        git add .
        git commit -m "CICD: Initial commit to repo"
        git push -u origin main
    ```
* Create virtual environment
```bash
    # Path to install the virtual env in the current project directory with python 3.10 and pip
    conda create --prefix ./.my_env python=3.10.9 pip 
    # Activate the virtual env as follows
    conda activate .my_env 
    # to de-activate the virtual env my_env use the below 
    conda activate 
    # don't use deactivate just use activate to go to base
    #### BONUS
    # view envs in conda
    conda info --envs
    # remove conda env
    conda env remove -p /home/ubuntu/Toronto_Climate_Data/my_env
```
## Extract
[extract.sh](./extract.sh): Code to extract data
## Transform
[transform.py](./transform.py): Code to concatenate all the downloaded files
## Load / Save
[all_years.csv](./all_years.csv): Extracted & Transformed Data