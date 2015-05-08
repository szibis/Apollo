#!/bin/bash

# Util functions cloud reusable.

get_ansible_requirements() {
  ansible-galaxy install -f -n -r plugins.yml
}

get_plugin_variables() {
  local plugin_namespace='APOLLO_PLUGIN_'
  local var_list=()
  for i in $(env | grep ${plugin_namespace}); do
  	# This deletes shortest match of $substring from front of $string. ${string#substring}
    var=${i#${plugin_namespace}}
    var_list+=(-var "$var")
  done
  echo ${var_list[@]}
}