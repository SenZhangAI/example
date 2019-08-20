#!/usr/bin/env bash

# list of bash options
#    allexport      	off
#    braceexpand    	on
#    emacs          	off
#    errexit        	off
#    errtrace       	off
#    functrace      	off
#    hashall        	on
#    histexpand     	off
#    history        	off
#    ignoreeof      	off
#    interactive-comments	on
#    keyword        	off
#    monitor        	off
#    noclobber      	off
#    noexec         	on
#    noglob         	off
#    nolog          	off
#    notify         	off
#    nounset        	off
#    onecmd         	off
#    physical       	off
#    pipefail       	off
#    posix          	off
#    privileged     	off
#    verbose        	off
#    vi             	off
#    xtrace         	off

try_test () {
    _test_cmd_=$@
    read -p "try testing '$_test_cmd_' [y/N]? " ans
    case $ans in
        Y | y)
            $@
            return 1
            ;;
        *)
            return 0
            ;;
    esac
}

## bash 默认将未声明（未绑定）的变量设置为空，但有时不利于排查，
## 当使用`set -u`，调用未绑定变量则会报错
try_test set -u || echo $_unbind_variable
### `set -u` 的另一种写法
try_test set -nounset || echo $_unbind_variable_

## 用于调试时显示命令
try_test set -x || echo "set -x is very useful when debugging script by showing cmd."
### `set -x`的另一种写法
try_test set -o xtrace || echo "'set -o xtrace' is alternative of 'set -x'"


## 当发生错误时阻止程序进一步运行
try_test set -e || _unknow_cmd_
echo "you will not see this message if 'set -e'"

## set -e 有一个例外情况，不适用于管道命令
try_test set -e || _unknow_cmd_ | echo "escape set -e"
echo "you will see this message if 'set -e' but using pipeline"

### alias of set -e
try_test set -o errexit || _unknow_cmd_
echo "you will not see this message if 'set -o errexit'"

## 即便管道命令中途出错也立即返回
try_test set -eo pipefail || _unknow_cmd_ | echo "it will exit if 'set -eo pipefail' and get error in any step of pipeline"
echo "you will not see this message if 'set -eo pipefail'"

