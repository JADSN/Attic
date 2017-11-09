#!/bin/bash
say() { 
    local IFS=+;
    /usr/bin/mplayer -really-quiet -noconsolecontrols "http://translate.google.com/translate_tts?ie=UTF-8&client=tw-ob&q=$*&tl=pt-br" 2>&1 >/dev/null
}

say $* 2>/dev/null 1>&2
