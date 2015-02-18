#
# Cookbook Name:: stackstorm
# Recipe:: default
#
# Copyright 2015, Jim Rosser
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

base_uri = "#{node['stackstorm']['package_url']}/#{node['stackstorm']['version']}"
pkg_version = "#{node['stackstorm']['version']}-#{node['stackstorm']['patch_version']}"
patch_version = node['stackstorm']['patch_version']

%w(
  st2common
  st2reactor
  st2client
  st2auth
  st2api
  st2actions
).each do |pkg|
  case node['platform_family']
  when 'debian'
    ## Install Stackstorm dependencies
    %w(
      python-prettytable
      python-yaml
      python-dateutil
      python-jsonpath-rw
    ).each do |dep_pkg|
      package dep_pkg
    end

    pkg_name = "#{pkg}_#{pkg_version}_amd64.deb"
    pkg_uri = "#{base_uri}/debs/#{patch_version}/#{pkg_name}"
  when 'rhel'
    include_recipe 'yum-epel'

    pkg_name = "#{pkg}-#{pkg_version}.noarch.rpm"
    pkg_uri = "#{base_uri}/rpms/#{patch_version}/#{pkg_name}"
  end

  pkg_path = ::File.join(Chef::Config[:file_cache_path], pkg_name)
  remote_file pkg_path do
    source pkg_uri
  end

  package pkg_name do
    if node['platform_family'] == 'debian'
      provider Chef::Provider::Package::Dpkg
    end
    action :install
    source pkg_path
  end
end
