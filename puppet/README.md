# puppet configuration

The following puppet modules should be installed for the puppet configuration
in this repository to work.

```bash
puppet module install puppetlabs-vcsrepo
puppet module install stankevich-python
```

To apply the puppet configuration in this repository run the following command.

```bash
puppet apply --modulepath ./modules manifests/site.pp
```
