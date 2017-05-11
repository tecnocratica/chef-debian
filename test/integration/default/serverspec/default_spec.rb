require 'spec_helper'

describe file('/etc/apt/sources.list') do
  it { should exist }
  its(:content) { should match /^deb http:\/\/ftp.nl.debian.org\/debian (\w+) main contrib non-free/ }
  its(:content) { should match /^deb-src http:\/\/ftp.nl.debian.org\/debian (\w+) main contrib non-free/ }
end

describe file('/etc/apt/sources.list.d/security.list') do
  it { should exist }
  its(:content) { should match /^deb(\s+)"http:\/\/ftp.nl.debian.org\/debian-security" (\w+)\/updates main contrib non-free/ }
  its(:content) { should match /^deb-src(\s+)"http:\/\/ftp.nl.debian.org\/debian-security" (\w+)\/updates main contrib non-free/ }
end

describe file('/etc/apt/sources.list.d/stable-updates.list') do
  it { should exist }
  its(:content) { should match /^deb(\s+)"http:\/\/ftp.nl.debian.org\/debian" (\w+)-updates main contrib non-free/ }
  its(:content) { should match /^deb-src(\s+)"http:\/\/ftp.nl.debian.org\/debian" (\w+)-updates main contrib non-free/ }
end
