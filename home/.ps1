if echo $HOSTNAME | egrep -q '^a'; then
  PS_HOST="\[\e[01;38;5;28m\]\h"
elif echo $HOSTNAME | egrep -q '^b'; then
  PS_HOST="\[\e[01;38;5;45m\]\h"
elif echo $HOSTNAME | egrep -q '^c'; then
  PS_HOST="\[\e[01;38;5;60m\]\h"
elif echo $HOSTNAME | egrep -q '^d'; then
  PS_HOST="\[\e[01;38;5;76m\]\h"
elif echo $HOSTNAME | egrep -q '^e'; then
  PS_HOST="\[\e[01;38;5;112m\]\h"
elif echo $HOSTNAME | egrep -q '^f'; then
  PS_HOST="\[\e[01;38;5;124m\]\h"
elif echo $HOSTNAME | egrep -q '^g'; then
  PS_HOST="\[\e[01;38;5;130m\]\h"
elif echo $HOSTNAME | egrep -q '^h'; then
  PS_HOST="\[\e[01;38;5;154m\]\h"
elif echo $HOSTNAME | egrep -q '^i'; then
  PS_HOST="\[\e[01;38;5;159m\]\h"
elif echo $HOSTNAME | egrep -q '^j'; then
  PS_HOST="\[\e[01;38;5;147m\]\h"
elif echo $HOSTNAME | egrep -q '^k'; then
  PS_HOST="\[\e[01;38;5;178m\]\h"
elif echo $HOSTNAME | egrep -q '^l'; then
  PS_HOST="\[\e[01;38;5;199m\]\h"
elif echo $HOSTNAME | egrep -q '^m'; then
  PS_HOST="\[\e[01;38;5;204m\]\h"
elif echo $HOSTNAME | egrep -q '^n'; then
  PS_HOST="\[\e[01;38;5;213m\]\h"
elif echo $HOSTNAME | egrep -q '^o'; then
  PS_HOST="\[\e[01;38;5;246m\]\h"
elif echo $HOSTNAME | egrep -q '^p'; then
  PS_HOST="\[\e[01;38;5;96m\]\h"
elif echo $HOSTNAME | egrep -q '^q'; then
  PS_HOST="\[\e[01;38;5;100m\]\h"
elif echo $HOSTNAME | egrep -q '^r'; then
  PS_HOST="\[\e[01;38;5;65m\]\h"
elif echo $HOSTNAME | egrep -q '^s'; then
  PS_HOST="\[\e[01;38;5;88m\]\h"
elif echo $HOSTNAME | egrep -q '^t'; then
  PS_HOST="\[\e[01;38;5;105m\]\h"
elif echo $HOSTNAME | egrep -q '^u'; then
  PS_HOST="\[\e[01;38;5;118m\]\h"
elif echo $HOSTNAME | egrep -q '^v'; then
  PS_HOST="\[\e[01;38;5;132m\]\h"
elif echo $HOSTNAME | egrep -q '^w'; then
  PS_HOST="\[\e[01;38;5;141m\]\h"
elif echo $HOSTNAME | egrep -q '^x'; then
  PS_HOST="\[\e[01;38;5;148m\]\h"
elif echo $HOSTNAME | egrep -q '^y'; then
  PS_HOST="\[\e[01;38;5;165m\]\h"
elif echo $HOSTNAME | egrep -q '^z'; then
  PS_HOST="\[\e[01;38;5;171m\]\h"
fi
