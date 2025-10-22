#!/bin/bash
echo "user1:`mkpasswd -m sha-512 password123`" > test_passwords_hashed.txt
echo "user2:`mkpasswd -m sha-512 admin`" >> test_passwords_hashed.txt
echo "user3:`mkpasswd -m sha-512 123456`" >> test_passwords_hashed.txt
echo "user4:`mkpasswd -m sha-512 letmein`" >> test_passwords_hashed.txt
echo "user5:`mkpasswd -m sha-512 strongPass!2023`" >> test_passwords_hashed.txt
echo "Created test_passwords_hashed.txt with hashed passwords."#! /bin/bash
echo "user1:password123" > test_passwords.txt
echo "user2:admin" >>  test_passwords.txt
echo "user3:123456" >> test_passwords.txt
echo "user4:letmein" >> test_passwords.txt
echo "user5:strongPass!2023" >> test_passwords.txt #One stronger for testing failures

echo "Created test_passwords.txt with sample passwords."
