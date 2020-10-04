 node-install () (
  _node-install-helper $1 _node-install-installer $1
)

_node-install-installer () {
  npm-add-dependencies $1
}

node-git-install () (
  local user=$1
  local repo=$2
  _node-install-helper $repo _node-git-install-installer "$user $repo"
)

_node-git-install-installer () {
  npm install $1/$2
  rm -fr node_modules
}

_node-install-helper () {
  local name=$1
  local install=$2
  local installArgs=$3
  rm -fr $name
  mkdir $name
  cd $name
  mkdir node2nix
  cd node2nix
  echo '{"name":"'$name'","version":"0"}' > package.json
  $install $installArgs
  node2nix
  cd ..
  echo '(import ./node2nix {}).shell.nodeDependencies' > default.nix
  cd ..
  node addPackage.js $name
}
