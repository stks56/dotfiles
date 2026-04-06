# dotfiles

# usage

## elmin(wslnix)

1. clone this

```sh
git clone https://github.com/stks56/dotfiles.git && cd dotfiles
```

2. run
```sh
nix run home-manager/master -- switch --flake .#elmin
```

3. everytime
```sh
home-manager switch --flake .#elmin
```

## unizm(darwin)

1. install home-manager

```sh
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)u
```

2. clone this

```sh
git clone https://github.com/stks56/dotfiles.git && cd dotfiles
```

3. run
```sh
nix run home-manager/master -- switch --flake .#unizm --impure
```

usually...

```sh
home-manager switch --flake .#unizm --impure
```

