#!/bin/bash
# Use bash instead of make (?)

function print_usage_exit {
    echo "Usage: gtest.sh [build|run|all]"
    exit 1
}

# echo 1 is $1
# echo 2 is $1

if [ -z "$1" ] || [ -n "$2" ]; then
    print_usage_exit
    echo 1
fi

if [[ $1 == "build" ]] || [[ $1 == "all" ]]; then
    need_build=true
fi

if [[ $1 == "run" ]] || [[ $1 == "all" ]]; then
    need_run=true
fi

if [[ $need_build != true ]] && [[ $need_run != true ]]; then
    print_usage_exit
fi

# echo "run is $run , build is $build"

if [[ $need_build == true ]]; then
    echo "-- Gonna build tests"
fi

if [[ $need_run == true ]]; then
    echo "-- Gonna run tests"
fi

