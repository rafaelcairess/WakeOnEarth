# 🌍 WakeOnEarth

> Power on your computer from anywhere in the world using Telegram, MikroTik RouterOS and Wake-on-LAN.

<p align="center">
  <img src="https://img.shields.io/badge/MikroTik-RouterOS-blue?style=for-the-badge">
  <img src="https://img.shields.io/badge/Telegram-Bot_API-26A5E4?style=for-the-badge&logo=telegram">
  <img src="https://img.shields.io/badge/Wake_on_LAN-Supported-success?style=for-the-badge">
  <img src="https://img.shields.io/badge/Status-Production-green?style=for-the-badge">
</p>

---

## 📖 Overview

WakeOnEarth is a remote power management solution built with MikroTik RouterOS scripting and Telegram Bot API.

The project allows a computer to be powered on from anywhere with internet access without requiring:

* Raspberry Pi
* Smart plugs
* VPN access
* Additional hardware

Everything runs directly on a MikroTik router that is already online 24/7.

---

## 💡 Why I Built This

I wanted a simple way to turn on my home computer remotely.

Most solutions require buying extra hardware or leaving another device powered on all the time.

Since I already had a MikroTik router running continuously, I decided to use the existing infrastructure to create a lightweight and cost-free solution.

The result is WakeOnEarth.

---

## 🚀 Features

* Remote PC startup using Telegram
* Wake-on-LAN integration
* Computer availability check
* Internet connectivity diagnostics
* Lightweight RouterOS implementation
* No external servers required

---

## 🏗 Architecture

```text
┌─────────────┐
│   Telegram  │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│ Telegram API│
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  MikroTik   │
│  RouterOS   │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│ Wake-on-LAN │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│     PC      │
└─────────────┘
```

---

## 📱 Available Commands

### Start Computer

```text
turnon
```

Sends a Wake-on-LAN packet to the configured device.

---

### Check Computer Status

```text
status
```

Verifies whether the target machine is online and responding.

---

### Check Internet Quality

```text
internet
```

Performs a connectivity test and reports network quality based on packet loss and latency.

---

## ⚙ Technologies

* MikroTik RouterOS v6
* Telegram Bot API
* Wake-on-LAN
* RouterOS Scheduler
* RouterOS Fetch Tool
* ICMP Monitoring

---

## 📂 Repository Structure

```text
WakeOnEarth/
│
├── README.md
├── mikrotik/
│   └── wakeonearth.rsc
│
└── docs/
    └── architecture.png
```

---

## 🔒 Security Notes

Before using this project:

* Create your own Telegram Bot.
* Generate your own Bot Token.
* Configure your Chat ID.
* Replace MAC addresses.
* Replace internal IP addresses.
* Never publish real credentials.

---

## 🛣 Roadmap

* [ ] Support multiple computers
* [ ] User authorization
* [ ] Scheduled startup
* [ ] Logging system
* [ ] Web dashboard
* [ ] RouterOS v7 adaptation

---

## 🎯 What This Project Demonstrates

This project combines several practical infrastructure and automation concepts:

* Network Automation
* API Integration
* Remote Systems Management
* RouterOS Scripting
* Troubleshooting
* Real-world Problem Solving

Rather than being a tutorial project, WakeOnEarth was created to solve an actual operational need using resources already available in the environment.

---

## 👨‍💻 Author

Rafael Caires Pires

Network Operations Center (NOC) Analyst
Python • Linux • Networking • Automation

GitHub:
https://github.com/rafaelcairess

LinkedIn:
https://www.linkedin.com/in/rafael-caires-pires-58225b238

---

⭐ If you found this project useful, consider giving it a star.
