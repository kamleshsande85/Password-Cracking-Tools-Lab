# Password Cracking Tools Learning Plan

This Markdown file serves as a comprehensive guide and tracker for your projects on password cracking tools (John the Ripper, Hydra, Hashcat, wordlists, scenarios, performance tips, and defenses). It's structured by phases, with each project broken down into step-by-step tasks. Use checkboxes (`- [ ]` for incomplete, `- [x]` for complete) to track your progress.

**Important Reminders:**
- All activities are for educational purposes only in isolated lab environments (e.g., Kali Linux VM or Docker).
- Document everything in a GitHub repo: scripts, logs, screenshots, and reports.
- Ethics: Never target real systems without permission.
- Tools Needed: Kali Linux, Docker, wordlists (e.g., rockyou.txt).
- Time Estimates: Provided per project; adjust as needed.

## Phase 1: Beginner Projects (Tool-Specific Basics)
Focus: Install, run, and analyze individual tools.

### Project 1: John the Ripper - Basic Password Cracking Lab
**Objective:** Understand dictionary and brute-force attacks on local password files.  
**Time Estimate:** 2-3 hours.  
**Real-World Tie-In:** Simulates cracking leaked password dumps.

- [ ] **Setup:**
  - Install John: `sudo apt update && sudo apt install john -y`.
  - Create a test password file (e.g., `test_passwords.txt`) with 5-10 entries like "user1:password123" (use plain text or hashes like MD5).
- [ ] **Execution:**
  - Run in direct mode: `john test_passwords.txt`.
  - Run with wordlist: `john --wordlist=/usr/share/wordlists/rockyou.txt test_passwords.txt`.
  - Run incremental mode: `john --incremental test_passwords.txt`.
  - View results: `john --show test_passwords.txt`.
- [ ] **Experiment:**
  - Generate a custom wordlist with `crunch` (e.g., `crunch 4 6 0123456789 -o custom_numbers.txt`).
  - Test the custom wordlist on John.
- [ ] **Analysis & Documentation:**
  - Measure time, success rate, and reasons for failures.
  - Create a repo folder with scripts, logs, and a README report: "How John identifies weak passwords."
- [ ] **Extension (Optional):**
  - Test on anonymized hashes from `/etc/shadow` format.
- [ ] **Completion Notes:** (Add your notes here, e.g., challenges faced, lessons learned).

### Project 2: Hydra - Network Service Cracking Simulation
**Objective:** Learn brute-forcing network logins ethically.  
**Time Estimate:** 2-4 hours.  
**Real-World Tie-In:** Mirrors red-team exercises in pentesting.

- [ ] **Setup:**
  - Install Hydra: `sudo apt install hydra`.
  - Use Docker for test services: `docker run -d -p 2222:22 --name test-ssh rastasheep/ubuntu-sshd`.
  - Add test users: `docker exec test-ssh useradd -m -s /bin/bash testuser` and `docker exec test-ssh bash -c "echo 'testuser:password123' | chpasswd"`.
- [ ] **Execution:**
  - SSH crack (single user): `hydra -l testuser -P /usr/share/wordlists/rockyou.txt ssh://localhost:2222`.
  - Multiple users: Create `users.txt` and `passwords.txt`, then `hydra -L users.txt -P passwords.txt ssh://localhost:2222`.
  - HTTP form: Simulate a WordPress login (setup a simple HTTP server if needed): `hydra -l admin -P passwords.txt http-form-post "/wp-login.php:log=^USER^&pwd=^PASS^&wp-submit=Log+In:F=incorrect" localhost`.
  - FTP crack: `hydra -L users.txt -P passwords.txt ftp://localhost` (setup FTP Docker if needed).
- [ ] **Experiment:**
  - Use verbose mode (`-V`) and add delays (e.g., `-t 1` for tasks).
- [ ] **Analysis & Documentation:**
  - Count attempts, time, and failures.
  - Record a screen demo video.
  - Repo: Logs, video, and blog post: "Simulating brute-force attacks on lab networks."
- [ ] **Extension (Optional):**
  - Setup and crack RDP or SMB.
- [ ] **Completion Notes:**

### Project 3: Hashcat - Advanced Hash Recovery with GPU
**Objective:** Master GPU-accelerated cracking for various hash types.  
**Time Estimate:** 3-4 hours.  
**Real-World Tie-In:** Used in forensic analysis or WiFi pentesting.

- [ ] **Setup:**
  - Install Hashcat: `sudo apt install hashcat`.
  - Ensure GPU drivers (NVIDIA/AMD) if available; fallback to CPU.
- [ ] **Execution:**
  - Identify hashes: `hashcat --example-hashes | grep -A 10 -B 5 "MD5"`.
  - Crack MD5: Create `hash.txt` with "5f4dcc3b5aa765d61d8327deb882cf99" (MD5 of "password"), then `hashcat -m 0 -a 0 hash.txt /usr/share/wordlists/rockyou.txt`.
  - WPA2 simulation: If WiFi tools available, capture a handshake and convert to `.hc22000`, then `hashcat -m 22000 handshake.hc22000 /usr/share/wordlists/rockyou.txt`.
- [ ] **Experiment:**
  - Use rules: Download Hashcat rules and apply (e.g., `hashcat -m 0 -a 0 hash.txt rockyou.txt -r rules/best64.rule`).
- [ ] **Analysis & Documentation:**
  - Compare CPU vs. GPU speeds (hashes/sec).
  - Use Python/Matplotlib for benchmark charts.
  - Repo: Charts, cracked hashes, summary: "Optimizing cracking performance."
- [ ] **Extension (Optional):**
  - Generate hashes with `mkpasswd` and crack them.
- [ ] **Completion Notes:**

## Phase 2: Intermediate Projects (Wordlists & Performance Optimization)
Focus: Integrate supporting elements.

### Project 4: Custom Wordlist Generation & Optimization
**Objective:** Create efficient wordlists for better cracking success.  
**Time Estimate:** 2 hours.  
**Real-World Tie-In:** Tailored wordlists for social engineering in pentests.

- [ ] **Setup:**
  - Install `crunch` if needed: `sudo apt install crunch`.
- [ ] **Execution:**
  - Build custom list: `echo -e "password\n123456\nadmin\nletmein" > custom_wordlist.txt`.
  - Generate with Crunch: `crunch 6 8 1234567890 -o numbers.txt`.
- [ ] **Experiment:**
  - Test on John: `john --wordlist=custom_wordlist.txt --rules test_passwords.txt`.
  - Test on Hashcat: `hashcat -m 0 -a 0 hash.txt custom_wordlist.txt`.
- [ ] **Analysis & Documentation:**
  - Compare hit rates vs. rockyou.txt.
  - Repo: Wordlist files, results, guide: "Building targeted wordlists for efficiency."
- [ ] **Extension (Optional):**
  - Python script to mutate lists.
- [ ] **Completion Notes:**

### Project 5: Performance Tuning Lab
**Objective:** Apply tips to make cracking faster.  
**Time Estimate:** 2-3 hours.  
**Real-World Tie-In:** Resource management in CTFs or incident response.

- [ ] **Setup:**
  - Reuse previous project setups.
- [ ] **Execution:**
  - Benchmarks: Run Hashcat with/without GPU.
  - Rules in John: `john --wordlist=wordlist.txt --rules test_passwords.txt`.
  - Incremental: `john --incremental test_passwords.txt`.
- [ ] **Experiment:**
  - Mask attacks in Hashcat: `hashcat -m 0 -a 3 hash.txt ?a?a?a?a`.
  - Simulate large-scale (100 hashes).
- [ ] **Analysis & Documentation:**
  - Graphs/tables of improvements (Tool | Mode | Time | Success Rate).
  - Repo: Performance report.
- [ ] **Completion Notes:**

## Phase 3: Advanced Projects (Scenarios & Defenses)
Focus: Combine tools and shift to defense.

### Project 6: Full SSH Cracking Scenario with Integration
**Objective:** Replicate a full scenario integrating tools.  
**Time Estimate:** 3-4 hours.  
**Real-World Tie-In:** Pentest reports for clients.

- [ ] **Setup:**
  - Docker SSH with multiple users/weak passwords.
- [ ] **Execution:**
  - Hydra attack: `hydra -l testuser -P rockyou.txt -s 2222 ssh://localhost -V`.
  - If needed, extract hashes and use John/Hashcat.
- [ ] **Experiment:**
  - Integrate custom wordlists from Project 4.
- [ ] **Analysis & Documentation:**
  - Attack timeline.
  - Repo: Script, report, video.
- [ ] **Extension (Optional):**
  - Add other protocols.
- [ ] **Completion Notes:**

### Project 7: Defense & Auditing Project
**Objective:** Protect against attacks.  
**Time Estimate:** 3 hours.  
**Real-World Tie-In:** Cybersecurity jobs and audits.

- [ ] **Setup:**
  - Reuse lab environments.
- [ ] **Execution:**
  - Enable MFA: Install `google-authenticator`.
  - Limit logins: Install `fail2ban`.
  - Audit: Use `cracklib-check` or generate strong passwords with `pwgen`.
- [ ] **Experiment:**
  - Re-run attacks post-defense.
- [ ] **Analysis & Documentation:**
  - Before/after comparison.
  - Repo: Hardening guide, essay: "Lessons from Cracking to Securing."
- [ ] **Completion Notes:**

## Overall Timeline & Milestones
- **Week 1-2:** Complete Phase 1.
- **Week 3:** Complete Phase 2.
- **Week 4-5:** Complete Phase 3.
- **Final Milestone:** 
  - [ ] Create a portfolio repo linking all projects.
  - [ ] Write a summary: "Password Security Learning Journey" (for interviews/resume).
- **Additional Resources:**
  - CTFs: HackTheBox, TryHackMe.
  - Books: "Hacking: The Art of Exploitation".
  - Communities: r/netsec on Reddit.

Track your progress by checking boxes as you go. Save this file and update it regularly! If you need modifications, revisit the plan.
