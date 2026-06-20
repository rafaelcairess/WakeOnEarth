# 🌍 WakeOnEarth

> Power on your computer from anywhere in the world using Telegram, MikroTik RouterOS and Wake-on-LAN.

<p align="center">
  <img src="https://img.shields.io/badge/MikroTik-RouterOS-blue?style=for-the-badge">
  <img src="https://img.shields.io/badge/Telegram-Bot_API-26A5E4?style=for-the-badge&logo=telegram">
  <img src="https://img.shields.io/badge/Wake_on_LAN-Supported-success?style=for-the-badge">
  <img src="https://img.shields.io/badge/RouterOS-v6.x-orange?style=for-the-badge">
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

Most solutions require additional hardware, cloud services, or another device permanently powered on.

Since I already had a MikroTik router running continuously, I decided to use the existing infrastructure to create a lightweight and cost-free solution.

The result is WakeOnEarth.

---

## 🌎 Real-World Use Case

This project is actively used in my personal environment.

When I am away from home, I can send a command through Telegram and remotely power on my desktop computer using Wake-on-LAN.

The solution was designed to be simple, reliable, and completely independent of additional hardware.

---

## 🚀 Features

* Remote PC startup using Telegram
* Wake-on-LAN integration
* Computer availability check
* Internet connectivity diagnostics
* Lightweight RouterOS implementation
* No external servers required
* Uses existing network infrastructure

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

### turnon

Starts the configured computer by sending a Wake-on-LAN packet.

```text
turnon
```

---

### status

Checks whether the target computer is online and responding.

```text
status
```

---

### internet

Performs a connectivity test and reports network quality based on latency and packet loss.

```text
internet
```

---

## ⚙ Technologies

* MikroTik RouterOS v6
* Telegram Bot API
* Wake-on-LAN
* RouterOS Scheduler
* RouterOS Fetch Tool
* ICMP Monitoring

---

## 📦 Installation

Detailed installation instructions are available here:

👉 **INSTALL.md**

---

## 📂 Repository Structure

```text
WakeOnEarth/
│
├── README.md
├── INSTALL.md
├── LICENSE
│
└── mikrotik/
    └── wakeonearth.rsc
```

---

## 🔒 Security Notes

Before using this project:

* Create your own Telegram Bot
* Generate your own Bot Token
* Configure your Chat ID
* Replace MAC addresses
* Replace internal IP addresses
* Never publish real credentials

The repository intentionally contains placeholders instead of real infrastructure information.

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

⭐ If you found this project interesting, consider giving it a star.
