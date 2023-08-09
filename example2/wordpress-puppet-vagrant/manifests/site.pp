#manifests/site.pp

node default{
include apache
include php
include wordpress
}
