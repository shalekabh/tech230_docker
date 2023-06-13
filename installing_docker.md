# Installing WSL2:

To set up Docker using WSL 2 (Windows Subsystem for Linux 2), you need to follow these general steps:

Install WSL 2: Make sure you have WSL 2 installed on your Windows machine. You can follow Microsoft's documentation to enable and install WSL 2.

```wsl --install```

Install a Linux distribution: Choose a Linux distribution such as Ubuntu, Debian, or CentOS, and install it through the Microsoft Store or by downloading the distribution's package manually.

Set WSL 2 as the default version: Open PowerShell as an administrator and run the following command to set WSL 2 as the default version:

```wsl --set-default-version 2```

Launch your Linux distribution: Open the installed Linux distribution from the Start menu or by typing its name in the Command Prompt or PowerShell.

Update the Linux distribution: Run the following commands in the Linux terminal to update the distribution:

```
sudo apt update
sudo apt upgrade
```

Install Docker: Use the following commands to install Docker in the Linux distribution:

```
sudo apt install docker.io
sudo systemctl enable --now docker
```

Configure Docker to use WSL 2 backend: Run the following command to configure Docker to use the WSL 2 backend:

```
echo "export DOCKER_CLI=client\nexport DOCKER_HOST=unix:///var/run/docker.sock" >> ~/.bashrc && source ~/.bashrc
```

Then use ```printenv``` to see if it has been sucessfully added to the .bashrc

Test Docker installation: Verify that Docker is installed and working correctly by running the following command:

```docker --version```


