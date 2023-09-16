#!/bin/sh
locale-gen
localectl set-locale LANG=pt_BR.UTF-8
localectl --no-ask-password set-x11-keymap br abnt2