mkdir -p ~/recon && cd recon
sudo apt install curl
sudo apt intsal jq
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
curl -OL https://dl.google.com/go/go1.18.3.linux-amd64.tar.gz
sudo tar -C /usr/local -xvf go1.16.7.linux-amd64.tar.gz
echo 'export GOPATH=$HOME/work' >> ~/.profile
echo 'export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin' >> ~/.profile
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.profile && source ~/.profile
git clone https://github.com/blechschmidt/massdns.git && cd massdns
make && sudo make install
go install github.com/tomnomnom/unfurl@latest
go install github.com/d3mondev/puredns/v2@latest
go install github.com/bp0lr/gauplus@latest
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go get github.com/cgboal/sonarsearch/cmd/crobat
go get -u github.com/tomnomnom/assetfinder
go install github.com/Josue87/gotator@latest
cd ~/recon
git clone https://github.com/Edu4rdSHL/unimap.git && cd unimap
cargo build --release
cp ./target/release/unimap /usr/local/bin
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install github.com/projectdiscovery/tlsx/cmd/tlsx@latest
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
go install -v github.com/tomnomnom/anew@latest
GO111MODULE=on go get -u github.com/xm1k3/cent
cent -p cent-nuclei-templates -k
cd ~/recon
wget https://wordlists-cdn.assetnote.io/data/manual/best-dns-wordlist.txt
wget https://raw.githubusercontent.com/BonJarber/fresh-resolvers/main/resolvers.txt
wget https://raw.githubusercontent.com/K4r1it0/installer/main/perm.txt
go get -u https://github.com/hakluke/hakcron
hakcron -f "every 3h" -c "dnsvalidator -tL https://public-dns.info/nameservers.txt -threads 50 -o /tmp/resolvers.txt&& cat /tmp/resolvers.txt | sort -u > ~/resolvers.txt&&rm /tmp/resolvers.txt"
