
# **Fail2Ban + UFW Setup Guide on Ubuntu**

This guide explains how to install, configure, and manage Fail2Ban together with UFW (Uncomplicated Firewall) on Ubuntu. It also includes commands for manual banning/unbanning IPs and full removal instructions.

---

## **1. Update System**

```bash
sudo apt update
```

---

## **2. Install Fail2Ban and UFW**

```bash
sudo apt install fail2ban ufw
```

---

## **3. Enable and Configure UFW**

Allow SSH before enabling the firewall:

```bash
sudo systemctl enable --now ufw
sudo ufw allow ssh
sudo ufw enable
```

---

## **4. Enable and Start Fail2Ban**

```bash
sudo systemctl enable --now fail2ban
sudo systemctl status fail2ban
```

---

## **5. Create Local Fail2Ban Configuration**

Copy the default jail file to a local one (this prevents overwriting on package updates):

```bash
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
```

Edit the configuration:

```bash
sudo nano /etc/fail2ban/jail.local
```

Add the following section:

```ini
[sshd]
enabled = true
port    = ssh
filter = sshd
logpath = %(sshd_log)s
backend = systemd
maxretry = 3
findtime = 15m
bantime = 3h
banaction = ufw
```

---

## **6. Restart Fail2Ban**

```bash
sudo systemctl restart fail2ban
```

---

## **7. Test Fail2Ban**

Check if the service responds:

```bash
sudo fail2ban-client ping
```

Check SSH jail status:

```bash
sudo fail2ban-client status sshd
```

---

## **8. Manually Ban/Unban IPs**

Ban an IP:

```bash
sudo fail2ban-client set sshd banip IP-ADDRESS
```

Unban an IP:

```bash
sudo fail2ban-client set sshd unbanip IP-ADDRESS
```

---

# **Full Removal of Fail2Ban and UFW**

If you want to completely remove Fail2Ban and UFW from the system, follow these steps.

---

## **Remove Fail2Ban**

```bash
sudo systemctl stop fail2ban
sudo apt purge fail2ban
sudo rm -rf /etc/fail2ban
```

---

## **Disable and Remove UFW**

```bash
sudo systemctl stop ufw
sudo ufw disable
sudo apt purge ufw
sudo rm -rf /etc/ufw
```

---

## **Clean remaining dependencies**

```bash
sudo apt autoremove --purge
```


