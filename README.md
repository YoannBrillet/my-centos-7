# Script de configuration post-installation pour serveur CentOS 7

(c) Niki Kovacs, 2020
(Traduciton par : Couruss, yoann.brillet@ynov.com)

Ce depot fournis un script "automagique" de configuration post-installation pour les serveurs sopus Centos 7 ainsi qu'une collection de script d'aide et de fichiers de configuration par defaut pour des services communs. 

## En bref

Suivez ces etapes :

  1. Installez un systeme CentOS 7 minimal.

  2. Creer un utilisateur avec des droits administrateur qui ne soit pas `root`.

  3. Installez Git : `sudo yum install git` 

  4. Clonez ce depot : `git clone https://gitlab.com/kikinovak/centos-7.git`

  5. Entrez dans le dossier: `cd centos-7`

  6. Lancez le script : `sudo ./centos-setup.sh --setup`

  7. Prenez un cafe pendant que le script fait tout le travail.

  8. Redemarrez.


## Customizing a CentOS server

Turning a minimal CentOS installation into a functional server always boils
down to a series of more or less time-consuming operations. Your mileage may
vary of course, but here's what I usually do on a fresh CentOS installation:

  * Customize the Bash shell : prompt, aliases, etc.

  * Customize the Vim editor.

  * Setup official and third-party repositories.

  * Install a complete set of command line tools.

  * Remove a handful of unneeded packages.

  * Enable the admin user to access system logs.

  * Disable IPv6 and reconfigure some services accordingly.
  
  * Configure a persistent password for `sudo`.

  * Etc.

The `centos-setup.sh` script performs all of these operations.

Configure Bash and Vim and set a more readable default console resolution:

```
# ./centos-setup.sh --shell
```

Setup official and third-party repositories:

```
# ./centos-setup.sh --repos
```

Install the `Core` and `Base` package groups along with some extra tools:

```
# ./centos-setup.sh --extra
```

Remove a handful of unneeded packages:

```
# ./centos-setup.sh --prune
```

Enable the admin user to access system logs:

```
# ./centos-setup.sh --logs
```

Disable IPv6 and reconfigure basic services accordingly:

```
# ./centos-setup.sh --ipv4
```

Configure password persistence for sudo:

```
# ./centos-setup.sh --sudo
```

Perform all of the above in one go:

```
# ./centos-setup.sh --setup
```

Strip packages and revert back to an enhanced base system:

```
# ./centos-setup.sh --strip
```

Display help message:

```
# ./centos-setup.sh --help
```

If you want to know what exactly goes on under the hood, open a second terminal
and view the logs:

```
$ tail -f /tmp/centos-setup.log
```

