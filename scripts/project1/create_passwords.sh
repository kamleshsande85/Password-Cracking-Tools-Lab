#! /bin/bash
echo "user1:password123" > test_passwords.txt
echo "user2:admin" >>  test_passwords.txt
echo "user3:123456" >> test_passwords.txt
echo "user4:letmein" >> test_passwords.txt
echo "user5:strongPass!2023" >> test_passwords.txt #One stronger for testing failures

echo "Created test_passwords.txt with sample passwords."
