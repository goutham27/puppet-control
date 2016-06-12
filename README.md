## Getting Started

### OSX - Homebrew + Tooling

- Install

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

- Use Brew to install Git

```
brew install git
```

- Install brew-cask for binary applications

```
brew update && brew install caskroom/cask/brew-cask
```

- Use brew cask to install VirtualBox

```
brew cask install virtualbox
```

- Use brew to install Vagrant

```
brew cask install vagrant
```

### Windows - Chocolatey + Tooling

- Install Chocolatey

```
@powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
```

- Use Chocolatey to install Git

```
choco install git
```

- Use Chocolatey to install VirtualBox

```
choco install virtualbox
```

- Use Chocolatey to install Vagrant

```
choco install vagrant
```

### Install Vagrant plugins (All Operating Systems)

- Oscar plugin

```
vagrant plugin install oscar
```

- Optionally install snap plugin to take snapshots

```
vagrant plugin install vagrant-multiprovider-snap
```

### Running from this repository

```
git clone https://github.com/goutham27/puppet-control
cd puppet-control
vagrant up master --provider=virtualbox
```

#### Access the PE console

[PE Console](https://localhost:4443)

```
user: admin
pass: puppetlabs
```

#### SSH to the master

```
vagrant ssh master
```

#### RDP to the Windows agent

```
vagrant rdp vagrant-win2012r2
```

### Footnotes

#### Building Your Own Windows VMs

* [Joe Fitzgerald's Windows Templates](https://github.com/joefitzgerald/packer-windows)
* [Box-cutter](https://github.com/box-cutter/windows-vm)
