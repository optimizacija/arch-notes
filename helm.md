# Helm 

To install helm, use helmenv. helmenv makes it possible to easily switch between different version of helm.
```
yay -S helmenv
```

Install latest version of helm.
```
# find latest version of helm in the list of all versions
helmenv list remote --all-versions

# install helm
helmenv install 3.8.0

# use the new helm (put it in path)
helmenv use 3.8.0

# test helm is setup properly
10481  helm --version
```
