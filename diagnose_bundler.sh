#!/usr/bin/env bash
set -e

echo
echo "=== Bundler Hang Diagnostic Script ==="
echo "Make sure you run this in your project root (where Gemfile lives)."
echo

prompt() {
  local msg="$1"
  read -p "$msg [Y/n] " ans
  [[ -z "$ans" || "$ans" =~ ^[Yy]$ ]]
}

if prompt "1) Run Basic System Info checks?"; then
  echo
  echo "---- System Info ----"
  uname -a
  if command -v lsb_release &>/dev/null; then
    lsb_release -a
  else
    echo "lsb_release not installed"
  fi
  echo "glibc:"
  ldd --version | head -n1
  echo "Disk space:"
  df -h
  echo "Memory:"
  free -m
  echo
fi

if prompt "2) Run Ruby & Gem environment checks?"; then
  echo
  echo "---- Ruby & Gem Env ----"
  ruby -v
  if command -v rbenv &>/dev/null; then
    echo "rbenv version:"; rbenv version
  elif command -v rvm &>/dev/null; then
    echo "rvm list:"; rvm list
  fi
  gem env
  bundle -v
  bundle env
  echo
fi

if prompt "3) Run Network connectivity tests?"; then
  echo
  echo "---- Network Tests ----"
  ping -c3 rubygems.org || echo "ping failed"
  echo
  echo "HTTP HEAD rubygems.org index:"
  curl -I https://rubygems.org/latest_specs.4.8.gz || echo "curl failed"
  echo
  echo "DNS lookup:"
  if command -v nslookup &>/dev/null; then
    nslookup rubygems.org
  else
    echo "nslookup not available"
  fi
  if command -v dig &>/dev/null; then
    dig +short rubygems.org
  else
    echo "dig not available"
  fi
  echo
  echo "Proxy vars:"
  env | grep -i proxy || echo "no proxy vars set"
  echo
fi

if prompt "4) Check compilation toolchain & headers?"; then
  echo
  echo "---- Compiler & Headers ----"
  gcc --version
  if command -v pkg-config &>/dev/null; then
    echo "libxml2 version:"; pkg-config --modversion libxml-2.0 || echo "not found"
    echo "libxslt version:"; pkg-config --modversion libxslt || echo "not found"
  else
    echo "pkg-config not installed"
  fi
  echo "Installed libxml2/libxslt/zlib dev packages:"
  if command -v rpm &>/dev/null; then
    rpm -qa | grep -E "libxml2|libxslt|zlib|sqlite"
  else
    echo "rpm not available; check via your package manager"
  fi
  echo
  if prompt "   → Install common dev headers now? (requires sudo)"; then
    sudo yum groupinstall -y "Development Tools"
    sudo yum install -y zlib-devel libxml2-devel libxslt-devel sqlite-devel
  fi
  echo
fi

if prompt "5) Run Bundler sanity checks?"; then
  echo
  echo "---- Bundler Config ----"
  bundle check || echo "bundle check found missing gems"
  echo
  echo "Parallel jobs:";  bundle config get jobs
  echo "force_ruby_platform:"; bundle config get force_ruby_platform
  echo "build.nokogiri:";    bundle config get build.nokogiri
  echo
fi

echo "=== Diagnostics complete ==="
if prompt "Finally, run 'bundle install --verbose' now?"; then
  echo; echo "Running bundle install --verbose…"
  bundle install --verbose
else
  echo; echo "Skipping bundle install. Review above output and re-run when ready."
fi

