#/bin/bash

tty=
tty -s && tty=--tty
tag=docker-google-closure-compiler


case "$1" in
    create)
        docker build --rm --pull --tag $tag --file Dockerfile .
    ;;

    bash)
        docker run $tty --interactive --rm --entrypoint="" $tag sh
    ;;

    check)
        docker run $tty --interactive --rm $tag --version
    ;;

    help)
        docker run $tty --interactive --rm $tag --help
    ;;

    test)
        docker run $tty --interactive --rm --workdir $(pwd) --volume $(pwd):$(pwd) $tag --compilation_level=SIMPLE --js=test/bootstrap-3.3.7-dist/js/bootstrap.js --js_output_file=test/compiled.js
    ;;

    *)
        echo " - create"
        echo " - bash"
        echo " - check"
        echo " - help"
        echo " - test"
    ;;
esac