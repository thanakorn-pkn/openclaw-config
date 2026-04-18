# Session: 2026-04-17 13:31:39 UTC

- **Session Key**: agent:main:main
- **Session ID**: 1d32d801-ddc5-40aa-b6e5-12b02eaaefd3
- **Source**: telegram

## Conversation Summary

user: Conversation info (untrusted metadata):
```json
{
  "message_id": "1780",
  "sender_id": "6538865360",
  "sender": "Thanakorn Phattarapakorn",
  "timestamp": "Thu 2026-04-16 23:05 GMT+7"
}
```

Sender (untrusted metadata):
```json
{
  "label": "Thanakorn Phattarapakorn (6538865360)",
  "id": "6538865360",
  "name": "Thanakorn Phattarapakorn",
  "username": "ThanakornPKN"
}
```

I want to install newest version of claude code on this host but I got error : ✘ Installation failed

 Failed to fetch version from https://storage.googleapis.com/claude-code-dist-86c565f3-f756-42ad-8dfa-d59b1c096819/claude-code-releases/latest: timeout of 30000ms exce
 eded
 I tried to switch to use homebrew, latest version is 2.1.97 but I checked in github it's 2.1.110. Do you have solution to install latest version from github?
assistant: I’m checking the actual release source and package path so I can give you a clean install route, not just a guess.
assistant: Good news, the latest is actually 2.1.111 now, and Homebrew is behind because its stable tag is pinned separately.
