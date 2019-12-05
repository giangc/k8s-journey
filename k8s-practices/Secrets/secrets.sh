#!/bin/bash
echo -n 'admin1'| base64 > username.txt
echo -n '123456' | base64 > password.txt

sleep .2;
