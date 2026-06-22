# 🌍 WakeOnEarth

> Power on your computer from anywhere in the world using Telegram, MikroTik RouterOS, Wake-on-LAN, Tailscale, Sunshine and Moonlight.

<p align="center">
  <img src="https://img.shields.io/badge/MikroTik-RouterOS-blue?style=for-the-badge">
  <img src="https://img.shields.io/badge/Telegram-Bot_API-26A5E4?style=for-the-badge&logo=telegram">
  <img src="https://img.shields.io/badge/Wake_on_LAN-Supported-success?style=for-the-badge">
  <img src="https://img.shields.io/badge/Tailscale-VPN-242424?style=for-the-badge">
  <img src="https://img.shields.io/badge/Sunshine-Streaming-orange?style=for-the-badge">
  <img src="https://img.shields.io/badge/Moonlight-Client-brightgreen?style=for-the-badge">
  <img src="https://img.shields.io/badge/RouterOS-v6.x-orange?style=for-the-badge">
  <img src="https://img.shields.io/badge/Status-Production-green?style=for-the-badge">
</p>

---

## 📖 Overview

WakeOnEarth is a remote power management solution built with MikroTik RouterOS scripting and the Telegram Bot API.

The project allows a computer to be powered on from anywhere with internet access without requiring:

- Raspberry Pi
- Smart plugs
- Dedicated servers
- VPN servers
- Cloud infrastructure
- Additional hardware

Everything runs directly on a MikroTik router that is already online 24/7.

The goal is simple: power on a computer remotely from anywhere in the world using infrastructure that already exists.

---

## 💡 Why I Built This

I wanted a simple way to turn on my home computer remotely.

Most existing solutions require purchasing additional hardware, leaving another device permanently powered on, or relying on cloud-based services.

Since I already had a MikroTik router running continuously, I decided to use the existing infrastructure to build a lightweight and cost-free solution.

The result is WakeOnEarth.

---

## 🌎 Real-World Use Case

This project is actively used in my personal environment.

Whenever I am away from home, I can send a Telegram command to my MikroTik router and remotely power on my desktop computer using Wake-on-LAN.

After the computer starts, I connect to it securely through a Tailscale VPN and access the desktop using Sunshine and Moonlight.

This allows me to:

- Access files remotely
- Manage applications
- Perform administrative tasks
- Use development tools
- Stream games from my desktop
- Access my PC from virtually anywhere with internet access

All without exposing services directly to the internet or requiring additional always-on hardware.

---

## 🔄 Complete Workflow

```text
Phone / Laptop
       │
       ▼
Telegram Command
       │
       ▼
Telegram Bot API
       │
       ▼
MikroTik Router
       │
       ▼
Wake-on-LAN Packet
       │
       ▼
Desktop Computer
       │
       ▼
Tailscale VPN
       │
       ▼
Sunshine Host
       │
       ▼
Moonlight Client
       │
       ▼
Remote Desktop / Game Streaming
```

---

## 🎮 Remote Access Stack

WakeOnEarth handles only the power-on process.

After the machine is powered on, remote access is achieved using the following tools.

### Tailscale

Tailscale creates a secure private network between devices using WireGuard.

It allows remote connectivity without opening ports or exposing services directly to the public internet.

Official Website:

https://tailscale.com

---

### Sunshine

Sunshine is an open-source self-hosted game streaming host running on the target computer.

Official Repository:

https://github.com/LizardByte/Sunshine

---

### Moonlight

Moonlight is the client used to connect to Sunshine and remotely control the computer.

Official Website:

https://moonlight-stream.org

---

### Why This Combination?

WakeOnEarth solves a problem that Sunshine and Moonlight do not:

The computer can remain completely powered off until it is needed.

Instead of keeping the machine running 24/7, WakeOnEarth powers it on remotely and then Sunshine + Moonlight provide full remote access.

---

## 🚀 Features

- Remote PC startup using Telegram
- Wake-on-LAN integration
- Computer availability check
- Internet connectivity diagnostics
- Lightweight RouterOS implementation
- No external servers required
- No additional hardware required
- Uses existing network infrastructure
- Integrates with Tailscale, Sunshine and Moonlight
- Secure remote access workflow

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
│ Desktop PC  │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Tailscale  │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Sunshine   │
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Moonlight  │
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

- MikroTik RouterOS v6
- Telegram Bot API
- Wake-on-LAN
- RouterOS Scheduler
- RouterOS Fetch Tool
- ICMP Monitoring
- Tailscale
- Sunshine
- Moonlight

---

## 📦 Installation

Detailed setup instructions are available in:

**INSTALL.md**

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

Before deploying this project:

- Create your own Telegram Bot
- Generate your own Bot Token
- Configure your Chat ID
- Replace MAC addresses
- Replace local IP addresses
- Never publish credentials
- Never expose production infrastructure information

The repository intentionally uses placeholders instead of real values.

## 🎯 What This Project Demonstrates

This project combines several real-world infrastructure and automation concepts:

- Network Automation
- RouterOS Scripting
- API Integration
- Remote Systems Management
- VPN Networking
- Wake-on-LAN
- Network Diagnostics
- Infrastructure Troubleshooting
- Real-world Problem Solving

Unlike a tutorial or academic project, WakeOnEarth was created to solve an actual operational need using existing infrastructure.

---

## 👨‍💻 Author

**Rafael Caires Pires**

Network Operations Center (NOC) Analyst

**Python • Linux • Networking • Automation**

GitHub:
https://github.com/rafaelcairess

LinkedIn:
https://www.linkedin.com/in/rafael-caires-pires-58225b238

---

⭐ If you found this project interesting, consider giving it a star.