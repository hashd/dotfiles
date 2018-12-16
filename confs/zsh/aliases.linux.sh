# apt-get aliases
alias install="sudo apt-get install"
alias upgrade="sudo apt-get upgrade"
alias remove="sudo apt-get remove"
alias update="sudo apt-get update"
alias dist-upgrade="sudo apt-get dist-upgrade"
alias uptodate="update && upgrade"

# Java related aliases
alias javahome6="export JAVA_HOME=/usr/lib/jvm/java-6-oracle"
alias javahome7="export JAVA_HOME=/usr/lib/jvm/java-7-oracle"
alias javahome8="export JAVA_HOME=/usr/lib/jvm/java-8-oracle"

alias setjava6="echo 1 | sudo update-alternatives --config java >/dev/null 2>&1"
alias setjava7="echo 2 | sudo update-alternatives --config java >/dev/null 2>&1"
alias setjava8="echo 3 | sudo update-alternatives --config java >/dev/null 2>&1"

alias setjavac6="echo 1 | sudo update-alternatives --config javac >/dev/null 2>&1"
alias setjavac7="echo 2 | sudo update-alternatives --config javac >/dev/null 2>&1"
alias setjavac8="echo 3 | sudo update-alternatives --config javac >/dev/null 2>&1"

alias setjavaws6="echo 1 | sudo update-alternatives --config javaws >/dev/null 2>&1"
alias setjavaws7="echo 2 | sudo update-alternatives --config javaws >/dev/null 2>&1"
alias setjavaws8="echo 3 | sudo update-alternatives --config javaws >/dev/null 2>&1"

alias checkjava="java -version && javac -version && echo $JAVA_HOME"

alias java6="setjava6;setjavac6;setjavaws6;javahome6"
alias java7="setjava7;setjavac7;setjavaws7;javahome7"
alias java8="setjava8;setjavac8;setjavaws8;javahome8"