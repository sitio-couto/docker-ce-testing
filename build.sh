set -e

echo "=========> [CHECKING DOCKER] >>> "
sudo docker run hello-world | grep "Hello from Docker!" 

echo "=========> [CLONNING MASTER AND PATCHING] >>>"
git clone https://github.com/docker/docker-ce
cd docker-ce && git apply -v --3way ../patches/*
cd ../

echo "=========> [BUILDING <$sys> PACKAGES] >>>"
cd ./$dir
sudo make $sys
